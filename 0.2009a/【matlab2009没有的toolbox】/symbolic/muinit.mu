/* muinit.mu
 * MuPAD code run during initializing the MuPAD kernel
 * providing MuPAD procedures to interface MATLAB and MuPAD.
 *
 *   Copyright 2008 The MathWorks, Inc.
 */

// names that currently match MuPAD names
mllimit := limit:
mlcharpoly := linalg::charpoly:
mlmap := map:
mlintersect := _intersect:
mlexpm := exp:
mlfactor := factor:
mlgaussJordan := gaussJordan:
mllatex := generate::TeX:
mlgcd := gcd:

mlround := proc(x)
begin
  if bool(x<0) then
    return( -round(-x) );
  else
    return( round(x) );
  end_if:
end_proc:

// convert to list
mltolist := proc(x)
begin
  if type(x) = Dom::Matrix() or
     type(x) = DOM_LIST or
     type(x) = DOM_ARRAY then
     x := [op(x)];
  else
     x := [x]:
  end_if:
  return (x):
end_proc:

// interface to generate::optimize
mloptimize := proc(x)
local last;
begin
  if type(x)=Dom::Matrix() then
    x := (Dom::Matrix())::convert_to(x,DOM_ARRAY);
    x := generate::optimize(x);
    last := x[nops(x)];
    x[nops(x)] := (Dom::Matrix())::convert(rhs(last));
  else  
    x := generate::optimize(x);
    last := x[nops(x)];
    x[nops(x)] := rhs(last);
  end_if:
  return( x );
end_proc:

// interface to jacobian
mljacobian := proc(f,v)
begin
  f:=mltolist(f):
  v:=mltolist(v):
  return( jacobian(f,v) ):
end_proc:

// interface to hypergeom
mlhypergeom := proc(n,d,z)
begin
  n := mltolist(n):
  d := mltolist(d):
  return( hypergeom(n,d,z) );
end_proc:

// interface to subs
mlsubs := proc(obj,var)
begin
  return( eval(subs(obj,var)) ):
end_proc:

// interface to int
mlint := proc(f,x,a,b)
begin
  return( int(f,x=a..b) );
end_proc:

// sort elements
mlsort := proc(x)
begin
  sort([op(x)]):
end_proc:

// interface to Simplify
mlsimplify := proc(x,n)
begin
  Simplify(x,Steps=n):
end_proc:

// used by mlindets to sort the indeterminates according to findsym style
mlsortproc:=proc(x,y)
local x1, y1, order, indx, indy;
begin
  x:=expr2text(x);
  y:=expr2text(y);
  // compare first char closest-to-x. rest normally
  x1 := x[1];
  y1 := y[1];
  if (bool(x1 = y1)) then
    return(bool(x<y)); // hmm - not lexi?
  else
        // x y w z v ...
    order := "xywzvutsrqponmlkjihgfedcbaXYWZVUTSRQPONMLKJIHGFEDCBA";
    indx := stringlib::pos(order,x1);
    indy := stringlib::pos(order,y1);
    return (bool(indx < indy));
  end_if:
end_proc:

// get free variables
mlindets := proc(list,dosort)
local res,sortproc;
begin
  if type(list)=Dom::Matrix() then
    list = [op(list)];
  end_if:
  res := indets(list) minus Type::ConstantIdents;
  res := [op(res)]; // convert set to list
  if bool(dosort = 1) then
    res := sort(res,mlsortproc);
  else
    res := sort(res);
  end_if:
  return(res);
end_proc:

// poly gcd
mlgcdex := proc(a,b,x)
begin
  [gcdex(a,b,x)];
end_proc:

// int gcd
mligcdex := proc(a,b)
begin
  [igcdex(a,b)];
end_proc:

// get the size of a container
mlgetarraydims := proc(x)
 local dims;
begin
  dims := op(x,0);
  dims := dims[2..nops(dims)];
  if type(dims) = "_exprseq" then
    dims := [map(dims,(pair)->op(pair,2))];
  else
    dims := [op(dims,2)];
  end_if:
  return (dims);
end:

// get an element from a container
mlelem := proc(x,elem)
local dims,k,ind,prod,d;
begin
if type(x) = Dom::Matrix() then
  dims := linalg::matdim(x);
  elem := elem - 1;
  return( x[(elem mod dims[1])+1, (elem div dims[1])+1] );
elif type(x) = DOM_LIST then
  return( x[elem] );
elif type(x) = DOM_ARRAY then
  dims := mlgetarraydims(x);
  prod := 1;
  elem := elem - 1;
  ind := [];
  for k from 1 to nops(dims) do
    d :=elem mod dims[k];
    ind := [op(ind), d+1];
    elem := (elem - d)/dims[k];
  end_for:
  return (x[op(ind)]);
end_if:
end_proc:

// assign elements into ans array
mlassignall := proc(p, ansn)
local k, n;
begin
  n := nops(p);
  for k from 1 to n do
    mlans[ansn + k] := p[k];
  end_for:
end_proc:

// get the next index of n-d array
mlnextinds := proc(inds,dims,ndims)
local k;
begin
  k := 1;
  while inds[k] = dims[k] do
    k := k+1;
  end_while:
  inds[k] := inds[k]+1;
  while k > 1 do
    k := k-1;
    inds[k] := 1;
  end_while:
  return( inds );
end_proc:

// get the size of x and assign elements to ansn array
mlsize := proc(x,ansn)
option hold;
local n,k,dims,inds,ndims;
begin
ansn := context(ansn);
x := context(x);
if type(x) = Dom::Matrix() then
  mlassignall([op(transpose(x))],ansn);
  return (linalg::matdim(x));
elif type(x) = DOM_LIST then
  mlassignall(x,ansn);
  return ([1,nops(x)]);
elif type(x) = "_exprseq" then
  x := [x];
  mlassignall(x,ansn);
  return ([1,nops(x)]);
elif type(x) = DOM_ARRAY then
  dims := mlgetarraydims(x);
  ndims := nops(dims);
  inds := [1$k=1..ndims];
  n := nops(x);
  for k from 1 to n-1 do
    mlans[ansn + k] := x[op(inds)];
    inds := mlnextinds(inds,dims,ndims);
  end_for:
  mlans[ansn + n] := x[op(inds)];
  return (dims);
else
  return ([]);
end_if:
end_proc:

// convert to vpa
mlfloat := proc(x)
begin
  x := mlremoveRootOfs(x):
  x := float(x):
  if has(x,RD_INF) then
        x := subs(x,RD_INF = infinity);
  end_if:
  if has(x,RD_NINF) then
        x := subs(x,RD_NINF = -infinity);
  end_if:
  if has(x,RD_NAN) then
        x := subs(x,RD_NAN = undefined);
  end_if:
  return (x):
end_proc:

// test equality
mlequal := proc(a,b)
local res,dom;
begin
  res := bool(a = b);
  if not res then
    b := coerce(b,domtype(a));
    if b <> FAIL then
      res := bool(a = b);
    end_if:
  end_if:
  return( res );
end_proc:

// get coeffs of a poly
mlcoeffs := proc(f,x)
begin
  if args(0) = 1 then
    return([coeff(f)]);
  else
    return([coeff(f,[x])]);
  end_if:
end_proc:

// get coeffs and terms of a poly
mlcoeffsterms := proc(f,x)
local pol,lis;
begin
  pol := poly(f,[x]);
  lis := poly2list(pol);
  return( matrix(lis) );
end_proc:

// get or set DIGITS
mlDigits := proc(n)
begin
  if (args(0) = 0) then
    DIGITS;
  else
    DIGITS := n;
  end_if:
end_proc:

// get the alias for I
mlgetimagunit := proc()
begin
  return(I);
end_proc:

// Jordan form
mljordan := proc(A,arg)
local res;
begin
  if (args(0) = 2) then
    if linalg::nrows(A)>3 and not has(A,I)then
      // try to predict if the similarity matrix will hang
      res := float(jordanForm(A));
      if has(res,I) then
        error("Similarity matrix too large."): 
      end_if:
    end_if:
    res := jordanForm(A,All);
    res := [res[2], res[1]];
  else
    jordanForm(A);
  end_if:
end_proc:

// MATLAB-like left divide
mlmldivide := proc(A,B)
local X, res;
begin
  X:=matlinsolve(A,B);
  if (type(X) = DOM_LIST) then
    if (X = []) then
      res := [array(0..0),array(0..0)];
    else
      res := [X[1], nops(X[2])];
    end_if:
  else
    res := [X,ncols(A)];
  end_if:
end_proc:

// this is supposed to error so that the m-file version of svd is called.
mlsvdvals := proc() 
begin 
  error("svd not available"): 
end_proc:

// MATLAB-like svd 
mlsvdvecs := proc(A)
local res;
begin
  res := numeric::svd(A);
  res[2] := matrix(nops(res[2]),nops(res[2]),res[2],Diagonal);
  return(res):
end_proc:

// expand RootOfs or approximate
mlremoveRootOfs := proc(X)
 local sel, fcn;
begin
  if (hastype(X,RootOf)) then
    X := simplify(RootOf::exact(X)):
    if (hastype(X,RootOf)) then
      X := float(X);
    end_if:
  end_if:
  if type(X)=DOM_SET then
    X:=[op(X)];
  end_if:
  return(X):
end_proc:

// get eigenvalues in MATLAB format
mleigenvalues := proc(A)
  local eigvals, res;
begin
  extractelem := 
  proc(x)
    begin
    if type(x)=Dom::Multiset and type(x[1]) = DOM_LIST then
      res := [op(res), x[1]];
    elif type(x)=DOM_SET then
      res := [op(res), map(op(x),(y->[y,1]))];
    else
      res := [op(res), [x,1]];
    end_if:
  end_proc:

  eigvals := mlremoveRootOfs(linalg::eigenvalues(A,Multiple)):
  if type(eigvals) = piecewise then
    eigvals := Simplify(eigvals,Steps=2000);
    // if it still has piecewise then filter
    if type(eigvals) = piecewise then
      eigvals := mlpiecewisefilter(eigvals);
    end_if:
  end_if:
  if hastype(eigvals,DOM_SET) then
    res := [];
    map(eigvals, extractelem):
    eigvals := res;
  elif type(eigvals)=DOM_LIST and type(eigvals[1])<>DOM_LIST then
    eigvals:=map(eigvals,(x)->[x,1]);
  end_if:
  return(matrix(eigvals)):
end_proc:

// get eigenvectors in MATLAB format
mleigenvectors := proc(A)
  local eigvecs, V, D, P, m;
begin
  eigvecs := mlremoveRootOfs(linalg::eigenvectors(A)):
  if eigvecs = FAIL then
    error("Unable to find eigenvectors.");
  end_if:
  m := 0;
  V := [];
  D := [];
  P := [];
  work:=proc(item)
    local eigval, malg, mbasis, k, w;
    begin
    eigval := item[1];
    malg := item[2];
    mbasis := item[3];
    mgeo := nops(mbasis);
    for k from 1 to mgeo do
      V := [op(V), [op(mbasis[k])]];
    end_for;
    P := [op(P), (m+w)$w=1..mgeo];
    D := [op(D), eigval$w=1..malg];
    m := m + malg;
  end_proc:
  map(eigvecs,work);
  return([transpose(matrix(V)), matrix(nops(D),nops(D),D,Diagonal), matrix(P)]):
end_proc:

// extract an element of a list
mlfullshape := proc(X)
begin
  if bool(X = array(0..0)) then
    return([]):
  else
    return(X):
  end_if:
end_proc:

// nullspace as a matrix
mlnullspace := proc(A)
local basis;
begin
  basis := linalg::nullspace(A):
  if nops(basis) <> 0 then
    basis := linalg::concatMatrix(op(basis));
  end_if:
  return(basis);
end_proc:

// implement taylor that converts to builtin DOM_POLY type.
// Avoids the problem of sending the order term back to MATLAB.
mltaylor := proc(f,x,a,n)
  begin
   expr(taylor(f,x=a,n,AbsoluteOrder)):
end_proc:

// get expanded coeffs of poly
mlsym2poly := proc(p,x)
  local c,c2,k;
begin
  p := poly(p,[x]):
  if (p <> FAIL) then
    p := [coeff(p,x,k)$k=degree(p)..0 step -1];
  end_if:
  return(matrix(p)):
end_proc:

// MATLAB-like collect
mlcollect := proc(expr,x)
begin
  if args(0)=1 then
    return( collect(expr) );
  elif type(x) = Dom::Matrix() then
    return( collect(expr,[op(x)]) );
  else
    return( collect(expr,x) );
  end_if:
end_proc:

// implement "atan2" for MuPAD
mlatan2 := proc(y,x)
  local w;
begin
  if (x = 0) then
    w := PI/2;
  else
    w := arctan(y/x):
  end_if:
  if (y < 0) then
    w := -w:
  end_if:
  w:
end_proc:

// Search for a "good" subexpression X to extract from S to get S2
// by using generate::optimize and looking for a split that results
// in the minimum len(X)+len(S2). If that doesn't produce a smaller
// split use the subexpr that minimizes abs(len(S2)-len(X)).
mlsubexpr := proc(x,signame)
  local s,sr,Y,tdiff,Ydiff,sigmadiff,rest,
        sum2,rest2,sigma2,diff2,Y2,sigma,k, lenY,lensigma,
        bestSigma, bestY, bestSum;
begin
  s := mlmatrix2array(x);
  s := generate::optimize(s);
  if nops(s) < 2 then
	return([x,NULL]):
  end_if;
  sr := revert(s);
  Y := rhs(sr[1]);
  sigma := NULL;
  bestSigma := NULL;
  tdiff := infinity;
  Ydiff := Y;
  sigmadiff := NULL;
  bestSum := infinity;
  rest := sr[2 .. nops(sr)];
  for k from 1 to nops(rest) do
	sigma2 := rest[k];
	rest2 := select(rest,x->x<>rest[k]);
	Y2 := subs(Y,op(rest2));
	sigma2 := subs(sigma2,op(rest2));
        lenY:=length(Y2);
        lensigma:=length(sigma2);
	sum2 := lenY+lensigma;
	if (sum2 < bestSum) then
	  bestSigma := sigma2;
	  bestY := Y2;
	  bestSum := sum2;
	end_if;
        diff2:=abs(lenY-lensigma);
	if (diff2 < tdiff) then
	  sigmadiff := sigma2;
	  Ydiff := Y2;
	  tdiff := diff2;
	end_if;
  end_for:
  if (bestSigma=NULL) then 
    s := [Ydiff, sigmadiff];
  else 
    s := [bestY,bestSigma]; 
  end_if;
  k := lhs(s[2]);
  s[1] := subs(s[1],k=signame);
  s[2] := rhs(s[2]);
  return (s):
end_proc:

// Horner's method in MuPAD is polynomial evaluation
mlhorner := proc(p,x)
  local p2;
begin
  p2:=poly(p,[x]);
  p2(x);
end_proc:

// modp mapped over polynomial coeffs
mlmodp := proc(x,m)
  local p;
begin
  p := poly(x);
  if p <> FAIL then
    expr(mapcoeffs(p,modp,m));
  else
    modp(x,m);
  end_if:
end_proc:

// matlab-like quorem
mlquorem := proc(a,b,x)
begin
  if (args(0) = 3) then
    return( [ divide(a,b,[x]) ] );
  else
    return( [_div(a,b), _mod(a,b)] );
  end_if:
end_proc:

// returns TRUE if x is a piecewise expression with condition
// that isn't of the form "C123 in ..."
mlcanfilter := proc(x)
local nonC,findC;
begin

  findC := proc(cond)
  local str;
  begin
    if bool(type(cond) = "_in") then
       str := "" . op(cond,1);
       // look for C1, C2 etc
       if length(str)>1 and bool(str[1]="C") and 
          traperror(text2int(str[2..length(str)]))=0 then
          return( FALSE );
       end_if:
    end_if:
    return( TRUE );
  end_proc:

  nonC := piecewise::selectConditions(x,findC);
  return( bool(nonC = x) );
end_proc:

// filter a piecewise to obtain the "usual" result
mlpiecewisefilter := proc(x)
local replacesets,x2;
begin
    replacesets := proc(x)
      begin
      if type(x) = Dom::ImageSet then
        return (expr(x));
      else
        return (x);
      end_if:
      end_proc:

    if type(x) = piecewise then
        x2 := piecewise::disregardPoints(x);
        if x2<>undefined then
           x := x2;
        end_if:
        if type(x) = piecewise and mlcanfilter(x) then
          x:=piecewise::selectExpressions(x,
               proc(a)begin print(a);a<>{}; end_proc);
          x:=x[1];
         end_if;
    end_if:
    if type(x) = "_union" then
      x := [op(x)];
      x := map(x,(y)->replacesets(y));
    elif type(x) = DOM_SET then
      x := op(x);
      if nops([x]) = 0 then x := []; end_if:
    end_if:
    return (x):
end_proc:

// convert a vector to a list
mlvectolist := proc(x)
begin
  if type(x)=Dom::Matrix() then
    x := [op(x)];
  end_if:
  return (x);
end_proc:

// convert a matrix to an array
mlmatrix2array := proc(x)
begin
  if type(x)=Dom::Matrix() then
    x := expr(x);
  end_if:
  return (x);
end_proc:

// get the shortest elements of a list
mlshortest := proc(objs)
local res,i,mlist,shortest_len;
begin
  // now look for shortest
  mlist := map(objs,(ans)->length(ans));
  shortest_len := infinity;
  for i from 1 to nops(mlist) do
    if mlist[i] < shortest_len then
      res := op(objs,i);
      shortest_len := mlist[i];
    end_if:
  end_for:
  return(res);
end_proc:

mlunionfilter := proc(res)
begin
  set_replace := 
  proc(res)
  begin
    if type(res) = solvelib::VectorImageSet or
       type(res) = Dom::ImageSet then
      res := subs(expr(res),op(op(res,2))=0);
    end_if:
    return(res);
  end_proc:

  // subfunction to turn 1-by-1 matrices into scalars.
  matrix_replace := proc(res)
  begin
    if type(res) = Dom::Matrix() then
      res := res[1,1];
    end_if:
    return(res);
  end_proc:
    
  res := map([op(res)],set_replace);
  return(map(res,matrix_replace));
end_proc:

// call solve and return a matrix of results where the number of
// columns is the number of variables solved for and the number of
// rows is the number of solutions. Note this means each solution
// must be a scalar.
mlsolve:=
proc(func,var)
  local res,again,opts;
begin
  if bool(type(func) = Dom::Matrix()) then
    func := [op(func)];
  elif bool(type(func) <> DOM_EXPR) then
    func := expr(func):
  end_if:
  opts := MaxDegree=4,IgnoreSpecialCases,VectorFormat;
  // first try as a polynomial with Multiple
  if type(var)=DOM_LIST and nops(var)=1 then 
    var:=var[1]; 
  end_if:
  if traperror((res := solve(func,op(var),opts,Multiple))) <> 0 then
    // if that failed then just try as general expr
    if traperror((res := solve(func,var,opts))) <> 0 then
      return([]);
    end_if:
  end_if:
  again := not has(res,solve);
  while again do
//  print(type(res));
    case type(res)
      of Dom::Matrix() do
        res := transpose(res);
        again := FALSE;
        break;
      of Dom::ImageSet do
      of solvelib::VectorImageSet do
        res := subs(expr(res),op(op(res,2))=0);
        break;
      of "_in" do
        res := op(res,2);
        // longterm, return condition as assumption if possible eg k in Z_
        break;
      of "_minus" do
        res := op(res,1);
        break;
      of "_exprseq" do
        res := map(res,expr);
        again := FALSE;
        break;
      of "_union" do
        res := mlunionfilter(res);
        break;
      of piecewise do
        res := mlpiecewisefilter(res);
        break;
      of Dom::Multiset do
        res := expand(res);
        break;
      otherwise
        again := FALSE;
    end_case:
  end_while:
  // now build matrix of results
  if type(res)=DOM_SET then // transform set to list
     res := sort([op(res)],(x,y)->bool(length(x)<length(y)));
     res := map(res,mlvectolist); // also transform vectors to lists
  elif type(res)="_exprseq" then
     res := [res];
  end_if:
  if has(res,solve) then
    res := FAIL;
  elif type(res)<>Dom::Matrix() and type(res)<>DOM_LIST then
    res := matrix([[res]]):
  else
    res := matrix(res):
  end_if:
  return(res):
end_proc:

/* Rewrite a list of solutions as equations into matrix form.
 * The set of lists of equations { [x=1,y=2], [x=3,y=4], .. } becomes
 * [1 3;2 4] meaning the columns are solutions.
 */
mlSolsToMatrix2:=
proc(res, vars)
local resmat, resrhs, reslhs, rescol, k, k2, m;
begin
    res := [op(res)];
    resmat := NIL;
    reslhs := map(res[1],(sol)->lhs(sol));
    for k from 1 to nops(vars) do
      k2 := 1;
      for m from 1 to nops(reslhs) do
        if reslhs[m] = vars[k] then
           k2 := m;
        end_if:
      end_for:
      resrhs := map(res,(sol)->rhs(sol[k2]));
      rescol := matrix(resrhs);
      if resmat=NIL then
        resmat := rescol;
      else
        resmat := linalg::concatMatrix(resmat,rescol);
      end_if:
    end_for:
    return(resmat):
end_proc:

mlFilterSols:=
proc(res)
begin
  res := map(res,(x)->mlpiecewisefilter(x));
end_proc:

mlSolsToMatrix:=
proc(res, vars)
begin
  if nops(vars) = 1 then
    res := matrix([op(res)]);
  else
    res := mlSolsToMatrix2(res, vars):
  end_if:
  return (res):
end_proc:

mlfsolve:=
proc(eqns,vars)
local res, resmat;
begin
  if bool(type(eqns) = Dom::Matrix()) then
    eqns := [op(eqns)];
  end_if:
  res:=numeric::fsolve(eqns,vars):
  if res = FAIL then
    // if the first try failed try another starting point
    res:=numeric::fsolve(eqns,map(vars,(x)->(x=1))):
  end_if:
  if res = FAIL then
    return([]);
  else
    // extract solutions in same order as vars
    return (mlSolsToMatrix([res], vars)):
  end_if:
end_proc:

mldsolve:=
proc(eqns,vars)
local res, res1;
begin
  if type(eqns) = Dom::Matrix() then
    eqns := [op(eqns)];
  end_if:
  if type(vars) = Dom::Matrix() then
    vars := [op(vars)];
  end_if:
  res := solve(ode(numeric::rationalize(eqns),vars)):
  if type(res) = "solve" or type(res) = "ode" then
    res := NIL:
  elif type(res) = piecewise then
    res := mlpiecewisefilter(res);
  else
    res := mlFilterSols(mlSolsToMatrix(res, vars)):
  end_if:
  return(res): // todo: also return flag for implicit/explicit
end_proc:

/* Get list of dependent variables in a MATLAB-style ODE X. These have
 * the form Dfoo or D123foo.
 */
mlgetdepvars:=
proc(X)
local res,x,str;
begin
  res := {};
  for x in X do 
    str := expr2text(x);
    if str[1] = "D" and length(str) > 1 then
      str := str[2 .. length(str)];
      while stringlib::pos("0123456789",str[1])<>FAIL do
        str := str[2 .. length(str)];
      end_while:
      res := res union {text2expr(str)};
    end_if:
  end_for:
  return (res);
end_proc:

/* Convert MATLAB-style ODE to MuPAD ODE object. X is an expression
 * where Df and D2f are used for derivatives of f. t is the indep var.
 * Returns a list of 2 items. The first item is the list of dep vars
 * of the form [x(t),y(t),...]. The second item is the transformed X.
 */
mlconvertode:=
proc(X,t)
local replaceD,str,var,ivar,depvars,tdepvars,n,first_pass;
begin
    tdepvars := {};
    first_pass := TRUE;

    /* subfunction to apply to every identifier to expand D2f to 
     * diff(f(t),2), etc. Called twice - once to expand D2f to
     * diff(f,2) and again to replace f with f(t). Also builds
     * up the set of dependent variables tdepvars.
     */
    replaceD := proc(x)
      begin
        str := expr2text(x);
        if str[1] = "D" and length(str) > 1 then
            if stringlib::pos("0123456789",str[2])<>FAIL then
              var := str[2 .. length(str)];
              n := 0;
              while stringlib::pos("0123456789",var[1])<>FAIL do
                n := n*10 + text2expr(var[1]);
                var := var[2 .. length(var)];
              end_while:
              ivar := text2expr(var);
              tdepvars := tdepvars union {ivar(t)};
              ivar := (D@@n)(ivar);
              if first_pass then
                return ( ivar(t) );
              else
                return ( ivar );
              end_if:
            else
              var := str[2 .. length(str)];
              ivar := text2expr(var);
              tdepvars := tdepvars union {ivar(t)};
              ivar := D(ivar);
              if first_pass then
                return ( ivar(t) );
              else
                return ( ivar );
              end_if:
            end_if:
        elif first_pass and x<>t and bool(x in depvars) then
          return( x(t) );
        end_if:
      return(x);
    end_proc:
    
    if has(X,D) then
       error("dsolve cannot use variable D");
    end_if:
    depvars := indets(X) minus Type::ConstantIdents minus {t};
    depvars := mlgetdepvars(depvars);
    if bool(D in depvars) then
       error("dsolve cannot use variable D");
    end_if:
    X := misc::maprec(X, {DOM_IDENT}=replaceD, NoOperators);
    first_pass := FALSE;    
    X := misc::maprec(X, {DOM_IDENT}=replaceD);
    return ([[op(tdepvars)], X]);
end_proc:

// Get the dimensions of an array or matrix.
mlgetdims := proc(x)
  local y, ndims;
begin
  y := op(x,0):
  ndims := op(y,1):
  [map(op(y,2..ndims+1),z->op(z,2))]:
end_proc:

// Get the kth element of x
mlgetelem := (x,k)->op(x)[k]:

// Pretty print s
mlpretty := proc(s,n)
  save PRETTYPRINT, TEXTWIDTH;
begin
  TEXTWIDTH := n;
  PRETTYPRINT := TRUE;
  s := subs(s,[betaMLVar=beta,gammaMLVar=gamma,psiMLVar=psi,thetaMLVar=theta,
     zetaMLVar=zeta,DMLVar=D,OMLVar=O,EiMLVar=Ei,SiMLVar=Si,CiMLVar=Ci,
     IMLVar=I],Unsimplified);
  print(s);
end_proc:

// Zeta function with swapped inputs.
mlzeta := proc(n,z) 
begin
  if args(0)=2 then
    zeta(z,n);
  else
    zeta(n);
  end_if:
end_proc:

// matrix inverse
mlinvert := (X)->simplify(_invert(X)):

/* Inverse of f(x). Assumes f and x are scalars. Returns a pair of items
 * [res,msg]. 
 * If msg = 0, res is the expression for the inverse as a function of x.
 * If msg = 1, no inverse was found.
 * If msg = 2, res wasn't unique (discards other values).
 */
mlfinverse := proc(f,x)
  local res,mlist,i1,i2,msg,rlist;
begin
  res := mlsolve(f=tmpy,x);
  msg := 0;
  if res = FAIL then
    res := [];
    msg := 1;
  else
    res:=[op(res)];
    if bool(nops(res) > 1) then
      msg := 2;
      // look for real solutions first, then shortest
      mlist := map(res,(ans)->not has(ans,I));
      rlist :=[];
      for i1 from 1 to nops(mlist) do
        if mlist[i1] then
          rlist := [op(rlist), op(res,i1)]; // take real sols
        end_if:
      end_for:
      if nops(rlist) = 0 then
        rlist := res; // if no real sols use originals
      end_if:
      res := mlshortest(rlist);
    else
      res := res[1];
    end_if:
    res := subs(res,tmpy=x);
    if not hastype(res,RootOf) then
      i1:=indets(f);
      i2:=indets(res);
      // if there are extra idents like 2*k*pi then try subing 0
      if nops(i1) <> nops(i2) then
         i1 := i2 minus i1;
         i1 := i1 minus Type::ConstantIdents;
         i1 := map([op(i1)],(item)->item=0);
         res := subs(res,i1);
      end_if:
    end_if:
  end_if:
  return([res,msg]);
end_proc:

// Sum in a MATLAB-like syntax
mlsymsum := (f,x,a,b)->sum(f,x=a..b):

// Compose f(x) with g(y) to get f(g(z)).
mlcompose := proc(f,g,x,y,z)
  local f1,g1;
begin
  f1 := fp::unapply(f,x);
  g1 := fp::unapply(g,y);
  return( f1(g1(z)) );
end_proc:

// standard aliases and exports

use(linalg):
DIGITS := 32:
alias(Inf=infinity, pi=PI, i=I, NaN=undefined):
alias(besselj=besselJ, bessely=besselY);
alias(besseli=besselI, besselk=besselK);
alias(log=ln);
alias(fix=trunc, factorial=fact);
alias(asin=arcsin, acos=arccos, atan=arctan);
alias(asinh=arcsinh, acosh=arccosh, atanh=arctanh);
alias(acsc=arccsc, asec=arcsec, acot=arccot);
alias(acsch=arccsch, asech=arcsech, acoth=arccoth);
expint := (x) -> -Ei(-x):
alias(sinint=Si, cosint=Ci);
alias(lambertw=lambertW);
alias(eulergamma=EULER, conj=conjugate, catalan=CATALAN);

// set upper bound on matrix display to be really big
matrix::setPrintMaxSize(infinity):

// fourier/ifourier uses a different defn that MATLAB so we can't alias it.
alias(laplace=transform::laplace);
alias(ilaplace=transform::invlaplace);
alias(ztrans=transform::ztrans);
alias(iztrans=transform::invztrans);

// Test if t is FAIL.
mlisfail := (t)->bool(type(t) = DOM_FAIL):

// Normalize fourier and ifourier to match backwards compatibility
mlfourier := (f,x,y)->subs(transform::fourier(f,x,y), y = -y):
mlifourier := (f,x,y)->subs(transform::invfourier(f,x,y), y = -y):

// Make sure "I" is properly handled at output
mloutputproc := proc()
  local res;
begin
  if traperror((res := ((MathContent::expr)@MathContent)(args()))) = 0 then
    res
  else
    args()
  end_if
end_proc:
Pref::output(mloutputproc):

// prevent linewrapping that mupadmex has to strip out.
TEXTWIDTH := 2^31-1:
