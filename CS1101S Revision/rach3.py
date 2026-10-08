# Requires Source Academy Python section 3, py2js engine. Asynchronous rendering with progress.
from sound import play_waves
f=1000
z=204
a=0.
b=1.
U=2147483647.
k=.5
g=2.
v=128
V=16777216
r=3.
u=4096
G=.05
n=len
T=math_atan2
P=math_cos
o=math_exp
d=math_floor
t=math_pi
F=math_sin
p=min
print('Preparing asynchronous rendering - please wait.')
def A(c,l,e,k,h,j,i):
 a=[0]*j
 g=0
 for b in range(0,j,i):
  d=l//V**(c%e)%V
  g=g+d%64/2
  a[b]=g
  a[b+1]=d//64%32/2
  a[b+2]=c//e%h+k
  a[b+3]=d//2048%2048/f
  if i>4:
   a[b+4]=d//4194304
  c=c//(e*h)
 return a
au=A(0x23a4ea31670991b3afdee10c3ec42eb941f89716ad7ad5231c4046b9ae730b4cea9cf65384afc7ae868fffb703022ec0d66c8bae5da0bb52a4ab39dc1bc3d3a7083e01c5752e1714bdf0bf0bf4cef78db16d10856dc5373daeee3dde84c4063cfa9ed4879d5cecd393941c0f2478364e38fe4e4bbe4aa1f0df26e8cd5dede2374da80df6461dff7ea7ca410877a7a4f4bf49f9b77d7c1b8aa2314f5a3859c5d02627cbd80523e43d1a03,0x1ac9811ac8411ac8441ac8832cd0c12cd0c22a18832a18432a18c22a18842cd04324e0821f40842cd0842a18822cd0821f40821ac8841ac882,19,60,17,652,4)
av=A(0x1a885a9181e2875971b0bd427e07008e4e0bfabdbabff39844bc98ba4199d1413a45356c512206fa4cfd42f3d3471bf34a87cef758f5778afbba8eb97d76f2e67bb15d8a12cff71159bd315fa449b95fdb897a0f234219c1575ad7ecb88c0ca1625c37cf9acc3e68c39441983da28e3cd2bca90aa48dbef5b3d9c22ee3cf90eb3dc1edf46ecb62fce49c5d6e9c0685396782f9cbe7c4cde91bfcdcebf15c564,0x1ac9811ac8411ac8442a18832a18432a18c22a188424e0821f40842cd0842a18821f40822cd0821ac8841ac882,15,55,15,652,4)
aq=A(0x12d7d0e62626c6ea33b0364d02aa18db124570315abd6dfffa6e37b45209b89495c4033784ecc4e6f7280cddb4d812da23be32672839ed609e0c6b2e3fdc9f112f6cc1d55bd62d3711bcd2186f7473628fb21e1d13c3c9afd17fe8b385d116600435b5dfbc6b828247971785558ebcc9ddddac528f95d61acc19199f98c803b1942fc8ece6b6c30885db16ec3f2497954e2e47603e702303885d4e7c8d29e8e1f33638ddd05b163881b27f1cea5,0x1ac9811ac8832eb0c12eb0c22be8832be8432be8c22be8841ac88e1ac8812eb0432550821ac8411ac8441f40842eb0842be8822eb0821f40821ac8841ac882,21,50,20,636,4)
h=A(0x10402491a5bd30fe9a427a6d883f182704eac68f64c550e8130642593e2dd513264183d756f2c1d885c8d9f52ece366b947f254ac88a006a51b9e2e280a8ac3e1e1e17b61c16867238c3c61a57739d6e7c948aafb8b5539f7fed707de5e469f3371caf9ac,0x1ac1821ac0865ac1821ac0826030822518822b70842949046949145ac1041ac1085ac2089f41029f408624190469490c2b71846b71085f41085f40865f42025f42045f413c6b74081f42025f41021f41881f42089ac1029ac0862b70865f41801f41825f41881f40846b71825f41822b71041ac1049f41001f40825f42089ac1081f41049f41041f4086,46,41,36,375,5)
I=A(0x4774b026a3040f2e7cf1e96a0e6b02f38d5c9d0c91355334f7752bf9ad62fa61af7ca35ebf58cb9e7e86b796c7fbc73671e34bad5cde95086a1eb437ed50a171b2a4da588,0x1ac10c1ac1203121042729041f410c1f41102949081ac1101ac08e2b70862b71021f41001f41082b71081f41021f40861ac0861ac1021f41041ac1041ac108,21,33,18,256,4)
N=A(0x49ef60a1475f6d09823d4de81af5e81a9e439b543838d65d8323e074685b1683203c73eef70d64700388fa52187659911f3f5e42f9586cfb3b03dad3de02d4ea9684282d3550fd845e36314c832676e6d709fb5fc5f1a91e66f0d045315d4d0e8252971da09b7854d2cc5794240e864797a,0x1f44001f44041f410c1f43041f41081551021550821d788430890c308b08308a0231b08435290435290c35298c352988352a023529843088843089883089843089101f43021f408a1f42843089081f42041f40881f42023f08843f09041f40861f41841f4124308a08352882352b02308a043088863528863089021f41041f40843088821f41023089041f4082,47,62,23,360,4)
y=[0]*360
for L in range(360):
 y[L]=N[L]-12 if L%4==2 else N[L]
y[354]=38
y[358]=50
y[355]=1.553
y[359]=1.553
def e(a,d,c,e,g):
 b=[0]*d
 for f in range(d):
  b[f]=(a%c+g)/e
  a=a//c
 return b
ac=e(0x8f33bfdb693fbc1e23bafa16aae15f124ec5a2554757606b3f711941ac4434730bf56ffbc62f2c21513ff6b6245df3b60cd5a1e4147840bb7414b336d0,30,114001,f,-15000)
aw=e(0x51cc25445745be9787030c8f2c8acd2b9840a040ac8ab8791d6ce1bb598d3b0d730ef4988492bc4dc104888bdb75abc70ae9cbfd3bfe7eca3a6,28,100001,f,-f)
aj=e(0xd556e30aa81f55f2db4dda6897859e7ad0efdbc30fbd0707c52266,14,99001,f,0)
ad=e(0x953414c124585156726ce23e221f00bf1544272eef13dc8667a0b8a7d05ef18fd44adeba392ac3d86b888453a0c1ea0cae0d01863ae82f5cf962a2414c9,30,98998,f,3)
am=e(0x183574c34f1645e8e38ed395f58401c7c8d356063e3b916be06fcc82094464c4d58d7c469dc70bb5390ba428f802b395db,20,907084,10000,-7083)
an=e(0x54f8ceb565d97b5b32bb8487964673a,8,98951,f,50)
af=e(0x5e778825d63dcf906f05f0f6ca2c37c47966476ec01a7b9f2065e38de1adae06ab9097f427d6fe23ae32a9097ed701c36f,24,98524,f,477)
ae=e(0x55d781e4fafc5260602e0432a64f06e80f13d87c11745bbf66eb8623490150c9a02db128621dd63a07c186e58f2e558487,24,96659,f,1001)
ah=e(0xc50d37c61e6f164c8863523dfb33fb4de24df56046e6d53cf1b6de1972e595ae302578137e6d15ae7f2c0936d7d0ddeab99bda975276b2642f052f65a950c114e410ac0878,34,95664,f,800)
al=e(0x345446cea38353ef31f457fc1b6fef94a96d5f3e84648b601ebc4054046ef73fd5e67332a95468cc,20,90198,f,960)
ar=e(0xb1fc6b5a3ad25004edd5afa4c3fa93f3243582a4,16,1001,f,0)
ag=e(0x16fae6ad9a10c8e4265dde6757cfb018a675cfa423deab1b5af85ee59d0d14ace44a5e035abd87f070d91d22050c8388aea985a0ee,26,90810,f,815)
ak=e(0x6aee33c2cb43c5aa8560ebcff6559dfb7bd132afd657322573eb840564641b8f,16,92691,f,350)
ai=e(0x17ad14b7072adc26c64cb4a66b614c455c71099b2081dd1cb99a3b7ad5fab6bc0fef628676bf0992ba132689,22,95999,f,2)
ao=e(0x54472e6861f7af8b42dc8b445c0e67353f2efe9b413e9421824e5d42a7d946238f49925227255b90,20,92489,f,370)
ab=e(0x17635c9d89d6416c5ca6e94d9305c09c9c6d450e7184e594f09cc45d782fcd5cf1f4ed1ef,18,92000,f,-999)
w=e(0x262a400c7374ceba7ade9d6ad056ac34c4f8b37bba27742f5b72a6af83234de2f378ee22649f6ffa4507090487dab7803fd2b9b538421dc7e3,30,35535,10000,-19867)
at=e(0x2dd2c5ef3c88b9b5fe363ff0c29004a19d67b03647cb04bf5c3c0970e2779743f9153f4b2ce2a7d376b74cdd1ecabb74bf45ce33dbcb1e1eaea872b5285fc7e8e3cc29bf7e5fd22ede2f0803baf48af3a32f480f,30,5330224,1000000,-1962377)
c=22050
B=.235
E=216
C=[B]*E
for m in range(136,144):
 C[m]=B*(b+.3*((m-135)/8)**2)
for m in range(192,z):
 C[m]=B*(b+.22*((m-191)/12)**2)
for m in range(z,E):
 C[m]=B*1.25
O=[a]*(E+1)
for m in range(E):
 O[m+1]=O[m]+C[m]
def j(b):
 a=d(b)
 return O[a]+(b-a)*C[a]
R=[20260926.]
def l():
 a=R[0]*16807.%U
 R[0]=a
 return a/U
M=262144
J=[a]*M
def H(a):
 return 440.*2**((a-69)/12)
def i(a,c):
 d=n(a)//2
 if c<=a[0]:
  return a[1]
 for b in range(1,d):
  if c<=a[2*b]:
   e=a[2*b-2]
   f=a[2*b-1]
   return f+(a[2*b+1]-f)*(c-e)/(a[2*b]-e)
 return a[2*d-1]
def X(a,c):
 return F(c*(b-a)/g)/F(c*(b+a)/g)
def az(f,C,a1,aP):
 U=None
 V=None
 aa=None
 ap=None
 h=None
 B=None
 v=None
 K=None
 L=None
 Q=H(f)
 aI=[a]*C
 aH=i(ar,a1)
 aL=i(al,f)
 A=aL+(i(ah,f)-G+.02-aL)*aH
 A=A*A
 aK=i(ak,f)
 aV=(b-A)*(aK+(i(ag,f)-aK)*aH)
 z=i(ab,f)
 z=-(z*z)
 aR=k*(b-z)
 R=10**(i(ac,f)/Q/20)
 x=i(aw,f)
 w=i(aj,f)
 W=r*(b-x)-R*(b-w)
 aA=g*(R*(b-w)-(b-x))/W
 aB=g*(w*(b-x)-R*(b-w)*x)/W
 s=(R*(b-w)*x-r*w*(b-x))/W
 n=i(am,f)
 aW=i(ad,f)
 q=[a]*4
 for e in range(2):
  S=g*t*(Q+(k-e)*aW)/c
  E=F(S)
  y=P(S)
  aQ=T((n*n-b)*E,g*n+(n*n+b)*y)
  az=b+g*aA
  N=s+g*aB
  a_=T(-N*E*(b+s*y)+s*E*(az+N*y),(az+N*y)*(b+s*y)+N*E*s*E)
  aC=(g*t+r*aQ+a_)/S-b
  av=d(aC-k)
  q[2*e]=av
  q[2*e+1]=X(aC-av,S)
 Z=[[a]*(C+q[0]+1),[a]*(C+q[2]+1)]
 m=[[a]*8,[a]*8]
 j=[a]*2
 aq=o(-t*i(ae,f)*Q/c)
 aD=aq*aq
 aS=-g*aq*P(g*t*Q/i(an,f)/c)
 aT=(k-k*aD)*i(af,f)
 I=a
 aN=o(-k)
 a0=o(-7./(i(ao,f)*c))
 D=a
 aZ=i(ai,f)*.2
 aJ=o(-b/(.01*c))
 aY=o(-b/(g*c))
 au=[a]*4
 aO=a
 Y=a
 aM=a
 O=a
 aE=a
 aF=a
 at=a
 aG=a
 aX=d(l()*100000)
 aU=p(d(.6*c),C)
 M=0
 ay=C
 def ax():
  nonlocal U,V,O,Y,aa,ap,aE,aF,at,aG,h,B,e,D,v,aM,I,K,L,aO,M
  c=p(M+u,ay)
  for h in range(M,c):
   aa=a
   if h<aU:
    if h<2:
     I=I*aN+(b-aN)*.15
    else:
     I=I*a0
    if h<220:
     D=D*aJ+(b-aJ)*aZ
    else:
     D=D*aY
    L=r*(I+D)*J[aX+h]
    for e in range(4):
     au[e]=aV*L+A*au[e]
     L=au[e]
    Y=aR*(L-aO)-z*Y
    aO=L
    aa=Y
   for e in range(2):
    K=aa+.9996*j[e]
    for B in range(0,6,2):
     U=n*K+m[e][B]-n*m[e][B+1]
     m[e][B]=K
     m[e][B+1]=U
     K=U
    Z[e][h+q[2*e]]=K
    V=q[2*e+1]*Z[e][h]+m[e][6]-q[2*e+1]*m[e][6+1]
    m[e][6]=Z[e][h]
    m[e][6+1]=V
    j[e]=V
   v=j[0]+j[1]
   O=aA*v+aB*aM-s*O
   aM=v
   j[0]=O+j[0]
   j[1]=O+j[1]
   ap=aT*(v-aF)-aS*at-aD*aG
   aF=aE
   aE=v
   aG=at
   at=ap
   aI[h]=v+ap
  M=c
  if M<ay:
   set_timeout(ax,0)
  else:
   return aP(aI)
 set_timeout(ax,0)
S=[.55,4.,at,.2687,.35,.0025,5.6,.03]
aa=[.65,4.,w,.2609,b,.0065,5.2,.07]
def Q(h,q,aE,aw):
 D=None
 r=None
 s=None
 Q=None
 x=None
 an=None
 Y=None
 m=None
 z=None
 ae=None
 B=None
 e=None
 ai=None
 av=None
 aq=q[0]
 af=q[1]
 E=q[2]
 at=q[5]
 au=g*t*q[6]*(.96+.08*l())/c
 aA=b-o(-b/(q[7]*c))
 aC=b-o(-b/(.03*c))
 aB=b-o(-b/(G*c))
 ad=n(h)//4
 ax=h[4*ad-3]
 O=ax+d(.4*c)
 H=.135
 ay=.95*(b-aq)
 i=c/h[2]-af
 ah=i
 for az in range(ad):
  ah=max(ah,c/h[4*az+2]-af)
 W=d(ah*1.1)+4
 ac=[a]*(O+W+2)
 X=[a]*(O+W+2)
 ap=[a]*O
 aF=d(l()*(M-O-8))
 y=d(i*(b-H))
 I=y*b
 w=d(i*H)
 v=w*b
 j=i*H-v
 aD=b/(.3*c)
 S=[a]*12
 U=a
 aa=a
 ab=a
 k=a
 N=b
 K=b
 ag=b
 V=a
 ak=a
 aG=g*P(au)
 aj=a
 ar=-F(au)
 T=a
 L=0
 ao=a
 f=0
 Z=False
 A=0
 C=W
 R=0
 am=O
 def al():
  nonlocal D,r,s,Q,i,v,j,w,x,an,ao,I,y,K,Y,f,k,m,L,z,Z,aa,ab,T,ae,A,ag,B,e,U,N,ai,aj,ar,V,ak,C,av,R
  l=p(R+u,am)
  for z in range(R,l):
   if z==A:
    if Z:
     Z=False
     A=-1
     if f<ad:
      A=h[4*f]
     if A!=z:
      N=a
    if z==A:
     if f>0:
      L=d(.012*c)
      ao=(c/h[4*f+2]-af-i)/L
      if h[4*f+3]==1:
       K=.3
     ak=at*.4
     if h[4*f+1]-h[4*f]>.3*c:
      ak=at
     N=b
     ag=b
     Z=True
     A=h[4*f+1]
     f=f+1
   if N>k:
    k=k+(N-k)*aA
   else:
    k=k+(N-k)*aC
    if aE:
     if k<.02:
      ag=a
   K=K+(b-K)*aB
   an=.13*k*K*(b+.03*J[aF+z])
   U=ay*aa+aq*U
   Y=an+U+ab
   e=(Y+.001)*g
   if e<a:
    e=-e
   e=e+.75
   e=e*e
   x=b/(e*e)
   if x>.98:
    x=.98
   if x<.01:
    x=.01
   ae=Y*x*ag
   ac[C]=ae-U
   X[C]=ae-ab
   ai=aG*aj-ar
   ar=aj
   aj=ai
   V=V+(ak-V)*aD
   if L>0:
    i=i+ao
    L=L-1
    j=i*H-v
    if j>=b:
     w=w+1
     v=v+b
     j=j-b
    elif j<a:
     w=w-1
     v=v-b
     j=j+b
   m=i*(b-H+V*ai)-I
   if m>=b:
    y=y+1
    I=I+b
    m=m-b
   elif m<a:
    y=y-1
    I=I-b
    m=m+b
   B=C-y
   ab=ac[B]*(b-m)+ac[B-1]*m
   B=C-w
   aa=X[B]*(b-j)+X[B-1]*j
   C=C+1
   s=E[0]*aa
   for r in range(0,12,2):
    D=0+5*r//2
    Q=s+S[r]
    S[r]=E[D+1]*s-E[D+3]*Q+S[r+1]
    S[r+1]=E[D+2]*s-E[D+4]*Q
    s=Q
   av=s
   T=T+q[4]*(av-T)
   ap[z]=q[3]*.1248*T
  R=l
  if R<am:
   set_timeout(al,0)
  else:
   return aw(ap)
 set_timeout(al,0)
def Y(Q,z,S,O,N):
 x=None
 i=None
 f=None
 h=None
 m=None
 L=None
 A=None
 M=None
 B=None
 y=H(Q)
 T=g*t*y/c
 I=c/y-k
 e=d(I-k)
 E=X(I-e,T)
 P=10**(-r/(S*y))
 j=[a]*(z+e+2)
 K=[a]*z
 R=d(l()*100000)
 q=a
 for b in range(e):
  q=q+O*(J[R+b]-q)
  j[b+e+1]=q*F(t*b/e)
 s=[a]*2
 o=[a]*6
 v=e+1
 n=0
 D=z
 def C():
  nonlocal x,i,f,h,m,b,L,A,M,v,B,n
  a=p(n+u,D)
  for b in range(n,a):
   A=k*(j[b+1]+j[b])
   x=E*A+s[0]-E*s[0+1]
   s[0]=A
   s[0+1]=x
   M=x
   B=j[v]+P*M
   j[v]=B
   v=v+1
   h=B
   for f in range(0,6,2):
    i=15+5*f//2
    m=h+o[f]
    o[f]=w[i+1]*h-w[i+3]*m+o[f+1]
    o[f+1]=w[i+2]*h-w[i+4]*m
    h=m
   L=h
   K[b]=G*L
  n=a
  if n<D:
   set_timeout(C,0)
  else:
   return N(K)
 set_timeout(C,0)
ap=j(E-.01)+3.5
s=d(ap*c)+4
x=[a]*s
D=[a]*s
q=[a]*s
def K(b,e,f,g):
 a=d(f*c)
 for h in range(n(e)):
  b[a]=b[a]+g*e[h]
  a=a+1
def ax(f,j,k,g,m,r):
 h=d(k*c)
 i=n(j)
 l=p(d(m*c),i)
 e=g
 q=o(-b/(r*c))
 a=0
 while a<i and e>.0005*g:
  f[h+a]=f[h+a]+e*j[a]
  if a>=l:
   e=e*q
  a=a+1
def aD(t):
 h=[a]*v
 o=[a]*v
 g=[0]*v
 m=[N,y]
 for u in range(2):
  b=m[u]
  for e in range(0,n(b),4):
   f=b[e+2]
   q=j(b[e]+b[e+1])-j(b[e])+G
   if b[e]>=z:
    q=r
   h[f]=max(h[f],q)
   o[f]=o[f]+b[e+3]
   g[f]=g[f]+1
 p=[None]*v
 def i(c,a):
  if c==2:
   t()
  elif a==n(m[c]):
   set_timeout(lambda:i(c+1,0),0)
  else:
   b=m[c]
   g=b[a+2]
   h=j(b[a])+.006*l()
   d=j(b[a]+b[a+1])-j(b[a])+G
   e=.1
   if b[a]>=z:
    d=r
    e=.15
   f=k*b[a+3]*(.94+.12*l())
   ax(D,p[g],h,f,d,e)
   set_timeout(lambda:i(c,a+4),0)
 def s(a):
  while a<v and g[a]==0:
   a=a+1
  if a==v:
   set_timeout(lambda:i(0,0),0)
  else:
   def b(b):
    p[a]=b
    set_timeout(lambda:s(a+1),0)
   e=.42+.18*o[a]/g[a]
   az(a,d((h[a]+.7)*c),e,b)
 set_timeout(lambda:s(0),0)
def aE(g):
 e=[au,av,aq]
 f=[x,x,q]
 b=[None]*256
 def a(k,h):
  if k==3:
   g()
  elif h==n(e[k]):
   set_timeout(lambda:a(k+1,0),0)
  else:
   i=e[k]
   p=i[h+2]
   s=i[h+1]
   m=2*p if s==1 and i[h]<z else 0
   o=d(l()*2)
   def q(b):
    c=j(i[h])+.008*l()
    K(f[k],b,c,i[h+3]*(.9+.2*l()))
    set_timeout(lambda:a(k,h+4),0)
   if m>0:
    if b[m+o]==None:
     def t(a):
      b[m+o]=a
      q(a)
     r=d(.88*B*c)
     Q([0,r,H(p),1],S,False,t)
    else:
     q(b[m+o])
   else:
    r=d((j(i[h]+s)-j(i[h]))*.9*c)
    Q([0,r,H(p),1],S,i[h]>=z,q)
 set_timeout(lambda:a(0,0),0)
def aC(f):
 e=n(h)//5
 def b(i):
  if i==e:
   f()
  else:
   r=h[5*i]
   if h[5*i+4]==2:
    def v(a):
     K(q,a,j(r)+.006*l(),.9*h[5*i+3])
     set_timeout(lambda:b(i+1),0)
    Y(h[5*i+2],d(1.4*c),1.1,.25,v)
   else:
    g=i+1
    while g<e and h[5*g+4]!=2 and(h[5*g]==h[5*g-5]+h[5*g-4]):
     g=g+1
    s=j(r)
    o=g-i
    m=[0]*(4*o)
    p=a
    for k in range(o):
     n=5*(i+k)
     m[4*k]=d((j(h[n])-s)*c)
     m[4*k+1]=d((j(h[n]+h[n+1])-s)*c)
     m[4*k+2]=H(h[n+2])
     if k>0:
      m[4*k+3]=h[n+4]
      if h[n+4]==1:
       m[4*k-3]=m[4*k-3]-d(.03*c)
     p=p+h[n+3]
    u=[.65,4.,w,.2609,.3,.0045,5.2,.07]if r<32 else aa
    def t(a):
     K(q,a,s,.95*p/o)
     set_timeout(lambda:b(g),0)
    Q(m,u,True,t)
 set_timeout(lambda:b(0),0)
def aB(e):
 a=[None]*v
 def b(f):
  if f==n(I):
   e()
  else:
   g=I[f+2]
   def h(a):
    K(q,a,j(I[f])+.008*l(),1.1*I[f+3])
    set_timeout(lambda:b(f+4),0)
   if a[g]==None:
    def i(b):
     a[g]=b
     h(b)
    Y(g,d(1.8*c),1.5,.2,i)
   else:
    h(a[g])
 set_timeout(lambda:b(0),0)
def aF(l,E,C):
 g=None
 f=None
 o=None
 e=None
 b=None
 h=None
 j=None
 k=None
 s=None
 t=None
 v=None
 w=None
 n=None
 y=c/2
 m=d(.02*y)
 B=[a]*(l+m+2)
 i=0
 A=l-1
 def z():
  nonlocal g,f,o,e,b,h,j,k,s,t,v,w,n,i
  F=p(i+u,A)
  for b in range(i,F):
   e=2*b
   B[b+m]=.25*(x[e]+x[e+1]+D[e]+D[e+1]+q[e]+q[e+1])
  i=F
  if i<A:
   set_timeout(z,0)
  else:
   h=[59,89,113,281,347,359,409]
   g=[None]*7
   o=[a]*4
   for b in range(7):
    g[b]=[a]*(l+m+h[b]+2)
   for b in range(4):
    o[b]=10**(-r*h[b+3]/(E*y))
   j=[a]*4
   f=[a]*4
   k=l+m
   v=[a]*k
   w=[a]*k
   c=0
   G=k
   def d():
    nonlocal e,b,s,t,n,c
    a=p(c+u,G)
    for e in range(c,a):
     n=B[e]
     for b in range(3):
      s=g[b][e]
      t=n+.7*s
      g[b][e+h[b]]=t
      n=s-.7*t
     for b in range(4):
      j[b]=.65*o[b]*g[b+3][e]+.35*j[b]
      f[b]=n+j[b]
      g[b+3][e+h[b+3]]=f[b]
     v[e]=f[0]-f[1]+f[2]-f[3]
     w[e]=f[0]+f[1]-f[2]-f[3]
    c=a
    if c<G:
     set_timeout(d,0)
    else:
     return C([v,w])
   set_timeout(d,0)
 set_timeout(z,0)
def Z(b,d):
 c=[0]
 def e(g):
  if g==a:
   c[0]=0
  e=c[0]
  c[0]=e+1
  f=e//2
  return d*b[f]if e%2==0 else d*k*(b[f]+b[f+1])
 return e
def ay(o):
 b=None
 d=None
 e=None
 f=None
 v=None
 w=None
 print('Reverberation ready. Mixing stereo audio...')
 l=s//2-2
 i=o[0]
 j=o[1]
 m=[a]*s
 n=[a]*s
 g=a
 h=0
 t=2*l
 def r():
  nonlocal b,d,e,g,f,v,w,h
  o=p(h+u,t)
  for b in range(h,o):
   d=b//2
   v=i[d]if b%2==0 else k*(i[d]+i[d+1])
   w=j[d]if b%2==0 else k*(j[d]+j[d+1])
   e=x[b]+.7*D[b]+.35*q[b]+.16*v
   f=.35*x[b]+.7*D[b]+q[b]+.16*w
   m[b]=e
   n[b]=f
   if e<a:
    e=-e
   if f<a:
    f=-f
   if e>g:
    g=e
   if f>g:
    g=f
  h=o
  if h<t:
   set_timeout(r,0)
  else:
   print('Rendering complete. Starting playback.')
   play_waves(Z(m,.89/g),Z(n,.89/g),(2*l-2)/c)
 set_timeout(r,0)
def aA():
 e=None
 a=0
 d=M
 def c():
  nonlocal e,a
  f=p(a+u,d)
  for e in range(a,f):
   J[e]=g*l()-b
  a=f
  if a<d:
   set_timeout(c,0)
  else:
   set_timeout(lambda:W(0),0)
 set_timeout(c,0)
def W(a):
 if a<4:
  print(['Rendering piano...','Piano ready. Rendering violins and viola...','Violins and viola ready. Rendering cello...','Cello ready. Rendering bass...'][a])
  [aD,aE,aC,aB][a](lambda:set_timeout(lambda:W(a+1),0))
 else:
  print('Instruments ready. Rendering reverberation...')
  aF(s//2-2,2.1,ay)
set_timeout(aA,0)
