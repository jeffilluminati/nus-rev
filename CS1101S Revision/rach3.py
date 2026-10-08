# Use Python §3. 
# Rendering takes about 20 seconds. 
# Rachmaninoff 3 intro

from sound import play_waves
V=0x49ca86d66cd3e8
y=204
a=0.
b=1.
W=0x80000000000000
L=2147483647.
k=.5
h=2.
t=128
o=3.
G=.05
n=len
U=math_atan2
R=math_cos
r=math_exp
d=math_floor
s=math_pi
F=math_sin
print('Preparing audio...')
def z(a,l,m,h,k,g,j,i):
 b=[0]*j
 f=0
 for c in range(0,j,i):
  e=a%3
  a=a//3
  if e>1:
   e=a%(h-2)+2
   a=a//(h-2)
  d=l//65536**e%65536
  f=f+d%64/2
  b[c]=f
  b[c+1]=d//64%32/2
  b[c+2]=a%g+k
  b[c+3]=m//2048**(d//2048%8)%2048/1000
  if i>4:
   b[c+4]=d//16384
  a=a//g
 return b
au=z(0x7b6853d1500e844ed35113ababfd7348814c978a172e8277d990bf9487610e20913c13943750d2fc07a60a9e3ad2e7c270f661b0952b0229c925d764252e6dfe06dc86f6922d2edefd829f79b4d4ba3254b5f7f111a2769905be157f883479ed09f7a058ddc9c2b4740417a3bc86a71a554ae205de44270e04e9f360eb09597c92121f8edfacc08efed7,0x118110411044108308c108c21883184318c21884084320820084088418820882008210841082,V,19,60,17,652,4)
av=z(0x29a716c715e12a42b801ada7ea23363cef55a62cdf92b677e9e95984681e4e4af9841a1f3a5ffe41a5da3345a3498eb739c7575f4b54eebde93b4f4204c52cfda6d4619de2cdfd4edd01da4b6a32119b8c1ef5785470ce622cf576c9e6b62ee30b8f1802dfb28508092aa5dff5101857f3f4e5f3779adb4b1ae4db35b7da72e2c6eb62c8,0x1181104110441883184318c2188420820084088418820082088210841082,V,15,55,15,652,4)
aq=z(0x36a0b2edaa1dc41908ed34a37f4032f91be990d91fbaf1a55b6611b30a13dee366be5c9f16d64bbf936ebf9cabbb15d319bbb066d4599db1be100144fe4e43d117401e4fda3300308531bc811b4cdb8c823e555a3422443d55006e0779ebf69016d1cd1137a702c4d34bed522d9547898fc548d8b9eed7783b029f5025daa2c562b2c6af45008e4960f20c7327bc11,0x1181108308c108c21883184318c21884108e108108432082104110440084088418820882008210841082,0x4aaafad66eb3e8,21,50,20,636,4)
g=z(0x412eb9a3b2df0c6e5521e1a9f6104c380f1e73352a5eee17f610ecc0b3c013d7d6dfda43f1860115ada5e4c81437e2d1f22b04f17832c15c37af1958bc8ff73320ff0c942dadfba989c582a671cf22086df9a15fb791a320066c2ab865ec6299785411ad3dbd32e5418bca,0x118210865182108270822882088419045914510411085208810280862104590c098449084108408642024204413c4c080202410201880208910290860886418001824188008449824182090411048100008242089108010481040086,0x101a51c83a52d62b73e8,46,41,36,375,5)
I=z(0x173e0ad79fba06f05ea80876aa8e4c14015418d44780cffc1abd4d74402961d78d1322cbde9710c633d6f9d5dce3fffb107c483101b90003f5bd977b9daa9f6497dc69e,0x110c112029042104010c011019081110108e088609020100010809080102008610861102010411041108,0x3124e5a52d62b73e8,21,33,18,256,4)
P=z(0xebc1b84fd3dc5b6e563bb71d51909132eb0b3127a127ee964a568892fc76d11165f377de789ddbcc29a8124dabf837698b9c0a63c299604e5f8c21bd3784b06219f1f6095d74047c55fd74484220a8610b9816e60c6a45fb2ad6fe552270429c12f2f84ec0a2793b1c200781ea00c36fff26f4f8,0x4000404010c03040108310230822884110c1308120220841904190c198c19881a02198410841188118411100302008a0284110802040088020208840904008601840124120818821b021204108618861102010400841082010211040082,0xaa9d7e36d4b847f0be8,47,62,23,360,4)
x=[0]*360
for N in range(360):
 x[N]=P[N]-12 if N%4==2 else P[N]
x[354]=38
x[358]=50
x[355]=1.553
x[359]=1.553
w=[0x5a571bef720145ff62a3484f5106308570dc3186ff8dc06af2ab53bc760786e2f55863f92aca0530b7e27566c83c608af37b9ce46998325b25452cf22b9b07f7fd4b3ca0f68616dff24dc43e7251ce97fdc19b890523c46d745b5e3190eede8a0f995844526bc8e2951e724208b2bcbf8c594a7fcd6a80e7317b97910136045212f5919e7cee8d8e0ef021a3998b6fe27cbab75e8290b8dd31f6c625f795d99fc5cf7f9894311129f965222fe8ded7cce6c017d1d77faf0288914ab5f3d804381d2d4bf9f6922bf2801937f8f7428325d062d9924a5c06cb216a49212d824484e89b9006f649535771f2cf571a4758ec0acb3886d1291a4b5a30750f33c03a2d4a8b1846e344380f559b4e329688e3593f0c18b943d53588a10e0166c39e24fb1f035017419459e0041b2c72458d894eef966f7429e00eb158c83e7c78d33b5a00bbb50c49e9f11e363e941b2b362609d8a2c79bbc2c625314f4adf1db2b4e38c8cc6f69372170f902bbaf4da18cecf4945717f793e6adb9bdc36bed59c9e7715e0a9cb79a977f3b3976bd8791a61969ad7f4753e54ddbca4e5eefdddc5c9e8cab579fc89492f200246465c27156e8435d0264ce9d1efc18c713842365f8be70c395ca2b113f931b46b488e33484f12d292708b8be1f9fc761d163f0a09b6b48561e152ece42c9cf1ddd320bf1f83a8974c85872e5bbfdb2e946a499dc61205414b3adcaa3681d93e4b6f46a3746f635d49502a93056ca4c71d7f44b7ceed14aec5801b092f08bc88c730b74f79175052c2fb34752fbf99d5f79cf1c20ec1eea33bff51fe04c5d3fa7de9d704df85c1d5d82c455afda5837c6bfd3a8cab779913165ca41c1fb2309f63b63218cce7e5bc9c47bcc178a56e3784b600714c38b356a08f31dacb4654e4a82dc7c1a65e283d93ac5cfdb325acb82d34adfe5ed7ca1fa561c65f2a2a513e16496a4f99e463e886138690a25aae761b8f8ef01b85004e1f605bcc52]
def f():
 a=w[0]%W
 w[0]=w[0]//W
 e=a%64
 a=a//64
 d=a%8388608
 f=10**(a//8388608%8)
 b=a//67108864
 b=b//2 if b%2==0 else-b//2
 c=[0]*e
 for g in range(e):
  c[g]=(w[0]%d+b)/f
  w[0]=w[0]//d
 return c
ad=f()
aw=f()
aj=f()
ae=f()
am=f()
an=f()
ag=f()
af=f()
ai=f()
al=f()
ar=f()
ah=f()
ak=f()
ao=f()
ac=f()
v=f()
at=f()
c=22050
A=.235
D=216
C=[A]*D
for l in range(136,144):
 C[l]=A*(b+.3*((l-135)/8)**2)
for l in range(192,y):
 C[l]=A*(b+.22*((l-191)/12)**2)
for l in range(y,D):
 C[l]=A*1.25
Q=[a]*(D+1)
for l in range(D):
 Q[l+1]=Q[l]+C[l]
def j(b):
 a=d(b)
 return Q[a]+(b-a)*C[a]
E=[20260926.]
def m():
 a=E[0]*16807.%L
 E[0]=a
 return a/L
O=262144
K=[a]*O
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
def Y(a,c):
 return F(c*(b-a)/h)/F(c*(b+a)/h)
def az(e,t,aQ,aC):
 y=H(e)
 at=[a]*t
 aq=i(ar,aQ)
 ay=i(al,e)
 q=ay+(i(ai,e)-G+.02-ay)*aq
 q=q*q
 ax=i(ak,e)
 aL=(b-q)*(ax+(i(ah,e)-ax)*aq)
 p=i(ac,e)
 p=-(p*p)
 aH=k*(b-p)
 z=10**(i(ad,e)/y/20)
 S=i(aw,e)
 Q=i(aj,e)
 B=b-Q
 C=b-S
 I=o*C-z*B
 V=h*(z*B-C)/I
 W=h*(Q*C-z*B*S)/I
 n=(z*B*S-o*Q*C)/I
 j=i(am,e)
 aM=i(ae,e)
 l=[a]*4
 for P in range(2):
  A=h*s*(y+(k-P)*aM)/c
  v=F(A)
  E=R(A)
  aF=U((j*j-b)*v,h*j+(j*j+b)*E)
  aG=b+h*V
  D=n+h*W
  au=b+n*E
  av=aG+D*E
  aO=U(-D*v*au+n*v*av,av*au+D*v*n*v)
  X=(h*s+o*aF+aO)/A-b
  T=d(X-k)
  l[2*P]=T
  l[2*P+1]=Y(X-T,A)
 L=[[a]*(t+l[0]+1),[a]*(t+l[2]+1)]
 g=[[a]*8,[a]*8]
 f=[a]*2
 M=r(-s*i(af,e)*y/c)
 Z=M*M
 aI=-h*M*R(h*s*y/i(an,e)/c)
 aJ=(k-k*Z)*i(ag,e)
 w=a
 aA=r(-k)
 aP=r(-7./(i(ao,e)*c))
 O=[a]*4
 aB=a
 J=a
 az=a
 x=a
 aa=a
 ab=a
 N=a
 ap=a
 aN=d(m()*100000)
 aK=min(d(.6*c),t)
 def aE(v,u):
  nonlocal x,J,aa,ab,N,ap,az,w,aB
  for d in range(v,u):
   s=a
   if d<aK:
    if d<2:
     w=w*aA+(b-aA)*.15
    else:
     w=w*aP
    k=o*w*K[aN+d]
    for c in range(4):
     O[c]=aL*k+q*O[c]
     k=O[c]
    J=aH*(k-aB)-p*J
    aB=k
    s=J
   for c in range(2):
    i=s+.9996*f[c]
    for h in range(0,6,2):
     m=j*i+g[c][h]-j*g[c][h+1]
     g[c][h]=i
     g[c][h+1]=m
     i=m
    L[c][d+l[2*c]]=i
    r=l[2*c+1]*L[c][d]+g[c][6]-l[2*c+1]*g[c][6+1]
    g[c][6]=L[c][d]
    g[c][6+1]=r
    f[c]=r
   e=f[0]+f[1]
   x=V*e+W*az-n*x
   az=e
   f[0]=x+f[0]
   f[1]=x+f[1]
   t=aJ*(e-ab)-aI*N-Z*ap
   ab=aa
   aa=e
   ap=N
   N=t
   at[d]=e+t
 def aD():
  return aC(at)
 u(t,aE,aD)
T=[.55,4.,at,.2687,.35,.0025,5.6,.03]
ab=[.65,4.,v,.2609,b,.0065,5.2,.07]
def S(f,k,an,ad):
 Z=k[0]
 S=k[1]
 v=k[2]
 ab=k[5]
 ac=h*s*k[6]*(.96+.08*m())/c
 aj=b-r(-b/(k[7]*c))
 al=b-r(-b/(.03*c))
 ak=b-r(-b/(G*c))
 Q=n(f)//4
 ag=f[4*Q-3]
 B=ag+d(.4*c)
 w=.135
 ah=.95*(b-Z)
 g=c/f[2]-S
 U=g
 for ai in range(Q):
  U=max(U,c/f[4*ai+2]-S)
 I=d(U*1.1)+4
 P=[a]*(B+I+2)
 J=[a]*(B+I+2)
 Y=[a]*B
 ao=d(m()*(O-B-8))
 p=d(g*(b-w))
 x=p*b
 o=d(g*w)
 l=o*b
 i=g*w-l
 am=b/(.3*c)
 C=[a]*12
 E=a
 M=a
 N=a
 j=a
 A=b
 y=b
 T=b
 H=a
 W=a
 ap=h*R(ac)
 V=a
 aa=-F(ac)
 D=a
 z=0
 X=a
 e=0
 L=False
 q=0
 t=I
 def af(ad,ac):
  nonlocal g,l,i,o,X,x,p,y,e,j,z,L,M,N,D,q,T,E,A,V,aa,H,W,t
  for B in range(ad,ac):
   if B==q:
    if L:
     L=False
     q=-1
     if e<Q:
      q=f[4*e]
     if q!=B:
      A=a
    if B==q:
     if e>0:
      z=d(.012*c)
      X=(c/f[4*e+2]-S-g)/z
      if f[4*e+3]==1:
       y=.3
     W=ab*.4
     if f[4*e+1]-f[4*e]>.3*c:
      W=ab
     A=b
     T=b
     L=True
     q=f[4*e+1]
     e=e+1
   if A>j:
    j=j+(A-j)*aj
   else:
    j=j+(A-j)*al
    if an:
     if j<.02:
      T=a
   y=y+(b-y)*ak
   ae=.13*j*y*(b+.03*K[ao+B])
   E=ah*M+Z*E
   O=ae+E+N
   m=(O+.001)*h
   if m<a:
    m=-m
   m=m+.75
   m=m*m
   u=b/(m*m)
   if u>.98:
    u=.98
   if u<.01:
    u=.01
   R=O*u*T
   P[t]=R-E
   J[t]=R-N
   U=ap*V-aa
   aa=V
   V=U
   H=H+(W-H)*am
   if z>0:
    g=g+X
    z=z-1
    i=g*w-l
    if i>=b:
     o=o+1
     l=l+b
     i=i-b
    elif i<a:
     o=o-1
     l=l-b
     i=i+b
   n=g*(b-w+H*U)-x
   if n>=b:
    p=p+1
    x=x+b
    n=n-b
   elif n<a:
    p=p-1
    x=x-b
    n=n+b
   F=t-p
   N=P[F]*(b-n)+P[F-1]*n
   F=t-o
   M=J[F]*(b-i)+J[F-1]*i
   t=t+1
   s=v[0]*M
   for r in range(0,12,2):
    G=0+5*r//2
    I=s+C[r]
    C[r]=v[G+1]*s-v[G+3]*I+C[r+1]
    C[r+1]=v[G+2]*s-v[G+4]*I
    s=I
   af=s
   D=D+k[4]*(af-D)
   Y[B]=k[3]*.1248*D
 def ae():
  return ad(Y)
 u(B,af,ae)
def Z(B,p,D,z,w):
 l=H(B)
 E=h*s*l/c
 r=c/l-k
 b=d(r-k)
 q=Y(r-b,E)
 A=10**(-o/(D*l))
 e=[a]*(p+b+2)
 t=[a]*p
 C=d(m()*100000)
 g=a
 for n in range(b):
  g=g+z*(K[C+n]-g)
  e[n+b+1]=g*F(s*n/b)
 i=[a]*2
 f=[a]*6
 j=b+1
 def y(o,n):
  nonlocal j
  for g in range(o,n):
   l=k*(e[g+1]+e[g])
   h=q*l+i[0]-q*i[0+1]
   i[0]=l
   i[0+1]=h
   r=h
   m=e[j]+A*r
   e[j]=m
   j=j+1
   b=m
   for a in range(0,6,2):
    c=15+5*a//2
    d=b+f[a]
    f[a]=v[c+1]*b-v[c+3]*d+f[a+1]
    f[a+1]=v[c+2]*b-v[c+4]*d
    b=d
   p=b
   t[g]=G*p
 def x():
  return w(t)
 u(p,y,x)
ap=j(D-.01)+3.5
p=d(ap*c)+4
B=[a]*p
J=[a]*p
q=[a]*p
def M(b,e,f,g):
 a=d(f*c)
 for h in range(n(e)):
  b[a]=b[a]+g*e[h]
  a=a+1
def ax(f,j,k,g,m,p):
 h=d(k*c)
 i=n(j)
 l=min(d(m*c),i)
 e=g
 o=r(-b/(p*c))
 a=0
 while a<i and e>.0005*g:
  f[h+a]=f[h+a]+e*j[a]
  if a>=l:
   e=e*o
  a=a+1
def aD(v):
 i=[a]*t
 q=[a]*t
 h=[0]*t
 p=[P,x]
 for w in range(2):
  b=p[w]
  for f in range(0,n(b),4):
   g=b[f+2]
   s=j(b[f]+b[f+1])-j(b[f])+G
   if b[f]>=y:
    s=o
   i[g]=max(i[g],s)
   q[g]=q[g]+b[f+3]
   h[g]=h[g]+1
 r=[None]*t
 def l(c,a):
  if c==2:
   v()
  elif a==n(p[c]):
   e(l,c+1,0)
  else:
   b=p[c]
   h=b[a+2]
   i=j(b[a])+.006*m()
   d=j(b[a]+b[a+1])-j(b[a])+G
   f=.1
   if b[a]>=y:
    d=o
    f=.15
   g=k*b[a+3]*(.94+.12*m())
   ax(J,r[h],i,g,d,f)
   e(l,c,a+4)
 def u(a):
  while a<t and h[a]==0:
   a=a+1
  if a==t:
   e(l,0,0)
  else:
   def b(b):
    r[a]=b
    e(u,a+1)
   f=.42+.18*q[a]/h[a]
   az(a,d((i[a]+.7)*c),f,b)
 e(u,0)
def aE(h):
 f=[au,av,aq]
 g=[B,B,q]
 b=[None]*256
 def a(l,i):
  if l==3:
   h()
  elif i==n(f[l]):
   e(a,l+1,0)
  else:
   k=f[l]
   q=k[i+2]
   t=k[i+1]
   o=2*q if t==1 and k[i]<y else 0
   p=d(m()*2)
   def r(b):
    c=j(k[i])+.008*m()
    M(g[l],b,c,k[i+3]*(.9+.2*m()))
    e(a,l,i+4)
   if o>0:
    if b[o+p]==None:
     def u(a):
      b[o+p]=a
      r(a)
     s=d(.88*A*c)
     S([0,s,H(q),1],T,False,u)
    else:
     r(b[o+p])
   else:
    s=d((j(k[i]+t)-j(k[i]))*.9*c)
    S([0,s,H(q),1],T,k[i]>=y,r)
 e(a,0,0)
def aC(h):
 f=n(g)//5
 def b(k):
  if k==f:
   h()
  else:
   s=g[5*k]
   if g[5*k+4]==2:
    def z(a):
     M(q,a,j(s)+.006*m(),.9*g[5*k+3])
     e(b,k+1)
    Z(g[5*k+2],d(1.4*c),1.1,.25,z)
   else:
    i=k+1
    while i<f and g[5*i+4]!=2 and(g[5*i]==g[5*i-5]+g[5*i-4]):
     i=i+1
    t=j(s)
    p=i-k
    o=[0]*(4*p)
    r=a
    for n in range(p):
     l=5*(k+n)
     y=[d((j(g[l])-t)*c),d((j(g[l]+g[l+1])-t)*c),H(g[l+2]),g[l+4]if n>0 else 0]
     for u in range(4):
      o[4*n+u]=y[u]
     if n>0 and g[l+4]==1:
      o[4*n-3]=o[4*n-3]-d(.03*c)
     r=r+g[l+3]
    x=[.65,4.,v,.2609,.3,.0045,5.2,.07]if s<32 else ab
    def w(a):
     M(q,a,t,.95*r/p)
     e(b,i)
    S(o,x,True,w)
 e(b,0)
def aB(f):
 a=[None]*t
 def b(g):
  if g==n(I):
   f()
  else:
   h=I[g+2]
   def i(a):
    M(q,a,j(I[g])+.008*m(),1.1*I[g+3])
    e(b,g+4)
   if a[h]==None:
    def k(b):
     a[h]=b
     i(b)
    Z(h,d(1.8*c),1.5,.2,k)
   else:
    i(a[h])
 e(b,0)
def aF(b,k,h):
 f=c/2
 e=d(.02*f)
 g=[a]*(b+e+2)
 def j(d,c):
  for b in range(d,c):
   a=2*b
   g[b+e]=.25*(B[a]+B[a+1]+J[a]+J[a+1]+q[a]+q[a+1])
 def i():
  j=[59,89,113,281,347,359,409]
  d=[None]*7
  n=[a]*4
  for i in range(7):
   d[i]=[a]*(b+e+j[i]+2)
  for i in range(4):
   n[i]=10**(-o*j[i+3]/(k*f))
  l=[a]*4
  c=[a]*4
  m=b+e
  p=[a]*m
  q=[a]*m
  def s(k,i):
   for b in range(k,i):
    e=g[b]
    for a in range(3):
     f=d[a][b]
     h=e+.7*f
     d[a][b+j[a]]=h
     e=f-.7*h
    for a in range(4):
     l[a]=.65*n[a]*d[a+3][b]+.35*l[a]
     c[a]=e+l[a]
     d[a+3][b+j[a+3]]=c[a]
    p[b]=c[0]-c[1]+c[2]-c[3]
    q[b]=c[0]+c[1]-c[2]-c[3]
  def r():
   return h([p,q])
  u(m,s,r)
 u(b-1,j,i)
def aa(b,d):
 c=[0]
 def e(g):
  if g==a:
   c[0]=0
  e=c[0]
  c[0]=e+1
  f=e//2
  return d*b[f]if e%2==0 else d*k*(b[f]+b[f+1])
 return e
def u(b,f,d):
 a=0
 def c():
  nonlocal a
  g=min(a+4096,b)
  f(a,g)
  a=g
  if g<b:
   e(c)
  else:
   d()
 e(c)
def e(b,*a):
 set_timeout(lambda:b(*a),0)
def ay(i):
 print('Mixing stereo audio...')
 e=p//2-2
 f=[a]*p
 g=[a]*p
 m=[f,g]
 h=[b,.35]
 d=a
 def l(l,j):
  nonlocal d
  for b in range(l,j):
   g=b//2
   for f in range(2):
    e=i[f]
    e=e[g]if b%2==0 else k*(e[g]+e[g+1])
    c=h[f]*B[b]+.7*J[b]+h[1-f]*q[b]+.16*e
    m[f][b]=c
    if c<a:
     c=-c
    if c>d:
     d=c
 def j():
  print('Rendering complete. Playing...')
  play_waves(aa(f,.89/d),aa(g,.89/d),(2*e-2)/c)
 u(2*e,l,j)
def aA():
 def c(c,a):
  for d in range(c,a):
   E[0]=E[0]*16807.%L
   K[d]=h*(E[0]/L)-b
 def a():
  e(X,0)
 u(O,c,a)
def X(a):
 if a<4:
  print(['Rendering piano...','Rendering violins and viola...','Rendering cello...','Rendering bass...'][a])
  [aD,aE,aC,aB][a](lambda:e(X,a+1))
 else:
  print('Rendering reverberation...')
  aF(p//2-2,2.1,ay)
e(aA)
