
_kill:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	56                   	push   %esi
    1012:	53                   	push   %ebx
    1013:	51                   	push   %ecx
    1014:	83 ec 0c             	sub    $0xc,%esp
    1017:	8b 01                	mov    (%ecx),%eax
    1019:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
    101c:	83 f8 01             	cmp    $0x1,%eax
    101f:	7e 30                	jle    1051 <main+0x51>
    1021:	8d 5a 04             	lea    0x4(%edx),%ebx
    1024:	8d 34 82             	lea    (%edx,%eax,4),%esi
    1027:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102e:	66 90                	xchg   %ax,%ax
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	ff 33                	pushl  (%ebx)
    1035:	83 c3 04             	add    $0x4,%ebx
    1038:	e8 23 02 00 00       	call   1260 <atoi>
    103d:	89 04 24             	mov    %eax,(%esp)
    1040:	e8 be 02 00 00       	call   1303 <kill>
  for(i=1; i<argc; i++)
    1045:	83 c4 10             	add    $0x10,%esp
    1048:	39 f3                	cmp    %esi,%ebx
    104a:	75 e4                	jne    1030 <main+0x30>
  exit();
    104c:	e8 82 02 00 00       	call   12d3 <exit>
    printf(2, "usage: kill pid...\n");
    1051:	50                   	push   %eax
    1052:	50                   	push   %eax
    1053:	68 e8 17 00 00       	push   $0x17e8
    1058:	6a 02                	push   $0x2
    105a:	e8 e1 03 00 00       	call   1440 <printf>
    exit();
    105f:	e8 6f 02 00 00       	call   12d3 <exit>
    1064:	66 90                	xchg   %ax,%ax
    1066:	66 90                	xchg   %ax,%ax
    1068:	66 90                	xchg   %ax,%ax
    106a:	66 90                	xchg   %ax,%ax
    106c:	66 90                	xchg   %ax,%ax
    106e:	66 90                	xchg   %ax,%ax

00001070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1070:	f3 0f 1e fb          	endbr32 
    1074:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1075:	31 c0                	xor    %eax,%eax
{
    1077:	89 e5                	mov    %esp,%ebp
    1079:	53                   	push   %ebx
    107a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    107d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1080:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1084:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1087:	83 c0 01             	add    $0x1,%eax
    108a:	84 d2                	test   %dl,%dl
    108c:	75 f2                	jne    1080 <strcpy+0x10>
    ;
  return os;
}
    108e:	89 c8                	mov    %ecx,%eax
    1090:	5b                   	pop    %ebx
    1091:	5d                   	pop    %ebp
    1092:	c3                   	ret    
    1093:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    109a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000010a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    10a0:	f3 0f 1e fb          	endbr32 
    10a4:	55                   	push   %ebp
    10a5:	89 e5                	mov    %esp,%ebp
    10a7:	53                   	push   %ebx
    10a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    10ae:	0f b6 01             	movzbl (%ecx),%eax
    10b1:	0f b6 1a             	movzbl (%edx),%ebx
    10b4:	84 c0                	test   %al,%al
    10b6:	75 19                	jne    10d1 <strcmp+0x31>
    10b8:	eb 26                	jmp    10e0 <strcmp+0x40>
    10ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10c0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    10c4:	83 c1 01             	add    $0x1,%ecx
    10c7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    10ca:	0f b6 1a             	movzbl (%edx),%ebx
    10cd:	84 c0                	test   %al,%al
    10cf:	74 0f                	je     10e0 <strcmp+0x40>
    10d1:	38 d8                	cmp    %bl,%al
    10d3:	74 eb                	je     10c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10d5:	29 d8                	sub    %ebx,%eax
}
    10d7:	5b                   	pop    %ebx
    10d8:	5d                   	pop    %ebp
    10d9:	c3                   	ret    
    10da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10e2:	29 d8                	sub    %ebx,%eax
}
    10e4:	5b                   	pop    %ebx
    10e5:	5d                   	pop    %ebp
    10e6:	c3                   	ret    
    10e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ee:	66 90                	xchg   %ax,%ax

000010f0 <strlen>:

uint
strlen(char *s)
{
    10f0:	f3 0f 1e fb          	endbr32 
    10f4:	55                   	push   %ebp
    10f5:	89 e5                	mov    %esp,%ebp
    10f7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    10fa:	80 3a 00             	cmpb   $0x0,(%edx)
    10fd:	74 21                	je     1120 <strlen+0x30>
    10ff:	31 c0                	xor    %eax,%eax
    1101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1108:	83 c0 01             	add    $0x1,%eax
    110b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    110f:	89 c1                	mov    %eax,%ecx
    1111:	75 f5                	jne    1108 <strlen+0x18>
    ;
  return n;
}
    1113:	89 c8                	mov    %ecx,%eax
    1115:	5d                   	pop    %ebp
    1116:	c3                   	ret    
    1117:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    1120:	31 c9                	xor    %ecx,%ecx
}
    1122:	5d                   	pop    %ebp
    1123:	89 c8                	mov    %ecx,%eax
    1125:	c3                   	ret    
    1126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    112d:	8d 76 00             	lea    0x0(%esi),%esi

00001130 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1130:	f3 0f 1e fb          	endbr32 
    1134:	55                   	push   %ebp
    1135:	89 e5                	mov    %esp,%ebp
    1137:	57                   	push   %edi
    1138:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    113b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    113e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1141:	89 d7                	mov    %edx,%edi
    1143:	fc                   	cld    
    1144:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1146:	89 d0                	mov    %edx,%eax
    1148:	5f                   	pop    %edi
    1149:	5d                   	pop    %ebp
    114a:	c3                   	ret    
    114b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    114f:	90                   	nop

00001150 <strchr>:

char*
strchr(const char *s, char c)
{
    1150:	f3 0f 1e fb          	endbr32 
    1154:	55                   	push   %ebp
    1155:	89 e5                	mov    %esp,%ebp
    1157:	8b 45 08             	mov    0x8(%ebp),%eax
    115a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    115e:	0f b6 10             	movzbl (%eax),%edx
    1161:	84 d2                	test   %dl,%dl
    1163:	75 16                	jne    117b <strchr+0x2b>
    1165:	eb 21                	jmp    1188 <strchr+0x38>
    1167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116e:	66 90                	xchg   %ax,%ax
    1170:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1174:	83 c0 01             	add    $0x1,%eax
    1177:	84 d2                	test   %dl,%dl
    1179:	74 0d                	je     1188 <strchr+0x38>
    if(*s == c)
    117b:	38 d1                	cmp    %dl,%cl
    117d:	75 f1                	jne    1170 <strchr+0x20>
      return (char*)s;
  return 0;
}
    117f:	5d                   	pop    %ebp
    1180:	c3                   	ret    
    1181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1188:	31 c0                	xor    %eax,%eax
}
    118a:	5d                   	pop    %ebp
    118b:	c3                   	ret    
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001190 <gets>:

char*
gets(char *buf, int max)
{
    1190:	f3 0f 1e fb          	endbr32 
    1194:	55                   	push   %ebp
    1195:	89 e5                	mov    %esp,%ebp
    1197:	57                   	push   %edi
    1198:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1199:	31 f6                	xor    %esi,%esi
{
    119b:	53                   	push   %ebx
    119c:	89 f3                	mov    %esi,%ebx
    119e:	83 ec 1c             	sub    $0x1c,%esp
    11a1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    11a4:	eb 33                	jmp    11d9 <gets+0x49>
    11a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ad:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    11b0:	83 ec 04             	sub    $0x4,%esp
    11b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11b6:	6a 01                	push   $0x1
    11b8:	50                   	push   %eax
    11b9:	6a 00                	push   $0x0
    11bb:	e8 2b 01 00 00       	call   12eb <read>
    if(cc < 1)
    11c0:	83 c4 10             	add    $0x10,%esp
    11c3:	85 c0                	test   %eax,%eax
    11c5:	7e 1c                	jle    11e3 <gets+0x53>
      break;
    buf[i++] = c;
    11c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    11cb:	83 c7 01             	add    $0x1,%edi
    11ce:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11d1:	3c 0a                	cmp    $0xa,%al
    11d3:	74 23                	je     11f8 <gets+0x68>
    11d5:	3c 0d                	cmp    $0xd,%al
    11d7:	74 1f                	je     11f8 <gets+0x68>
  for(i=0; i+1 < max; ){
    11d9:	83 c3 01             	add    $0x1,%ebx
    11dc:	89 fe                	mov    %edi,%esi
    11de:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11e1:	7c cd                	jl     11b0 <gets+0x20>
    11e3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11e5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11e8:	c6 03 00             	movb   $0x0,(%ebx)
}
    11eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11ee:	5b                   	pop    %ebx
    11ef:	5e                   	pop    %esi
    11f0:	5f                   	pop    %edi
    11f1:	5d                   	pop    %ebp
    11f2:	c3                   	ret    
    11f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11f7:	90                   	nop
    11f8:	8b 75 08             	mov    0x8(%ebp),%esi
    11fb:	8b 45 08             	mov    0x8(%ebp),%eax
    11fe:	01 de                	add    %ebx,%esi
    1200:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1202:	c6 03 00             	movb   $0x0,(%ebx)
}
    1205:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1208:	5b                   	pop    %ebx
    1209:	5e                   	pop    %esi
    120a:	5f                   	pop    %edi
    120b:	5d                   	pop    %ebp
    120c:	c3                   	ret    
    120d:	8d 76 00             	lea    0x0(%esi),%esi

00001210 <stat>:

int
stat(char *n, struct stat *st)
{
    1210:	f3 0f 1e fb          	endbr32 
    1214:	55                   	push   %ebp
    1215:	89 e5                	mov    %esp,%ebp
    1217:	56                   	push   %esi
    1218:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1219:	83 ec 08             	sub    $0x8,%esp
    121c:	6a 00                	push   $0x0
    121e:	ff 75 08             	pushl  0x8(%ebp)
    1221:	e8 ed 00 00 00       	call   1313 <open>
  if(fd < 0)
    1226:	83 c4 10             	add    $0x10,%esp
    1229:	85 c0                	test   %eax,%eax
    122b:	78 2b                	js     1258 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    122d:	83 ec 08             	sub    $0x8,%esp
    1230:	ff 75 0c             	pushl  0xc(%ebp)
    1233:	89 c3                	mov    %eax,%ebx
    1235:	50                   	push   %eax
    1236:	e8 f0 00 00 00       	call   132b <fstat>
  close(fd);
    123b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    123e:	89 c6                	mov    %eax,%esi
  close(fd);
    1240:	e8 b6 00 00 00       	call   12fb <close>
  return r;
    1245:	83 c4 10             	add    $0x10,%esp
}
    1248:	8d 65 f8             	lea    -0x8(%ebp),%esp
    124b:	89 f0                	mov    %esi,%eax
    124d:	5b                   	pop    %ebx
    124e:	5e                   	pop    %esi
    124f:	5d                   	pop    %ebp
    1250:	c3                   	ret    
    1251:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1258:	be ff ff ff ff       	mov    $0xffffffff,%esi
    125d:	eb e9                	jmp    1248 <stat+0x38>
    125f:	90                   	nop

00001260 <atoi>:

int
atoi(const char *s)
{
    1260:	f3 0f 1e fb          	endbr32 
    1264:	55                   	push   %ebp
    1265:	89 e5                	mov    %esp,%ebp
    1267:	53                   	push   %ebx
    1268:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    126b:	0f be 02             	movsbl (%edx),%eax
    126e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1271:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1274:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1279:	77 1a                	ja     1295 <atoi+0x35>
    127b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    127f:	90                   	nop
    n = n*10 + *s++ - '0';
    1280:	83 c2 01             	add    $0x1,%edx
    1283:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1286:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    128a:	0f be 02             	movsbl (%edx),%eax
    128d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1290:	80 fb 09             	cmp    $0x9,%bl
    1293:	76 eb                	jbe    1280 <atoi+0x20>
  return n;
}
    1295:	89 c8                	mov    %ecx,%eax
    1297:	5b                   	pop    %ebx
    1298:	5d                   	pop    %ebp
    1299:	c3                   	ret    
    129a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000012a0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    12a0:	f3 0f 1e fb          	endbr32 
    12a4:	55                   	push   %ebp
    12a5:	89 e5                	mov    %esp,%ebp
    12a7:	57                   	push   %edi
    12a8:	8b 45 10             	mov    0x10(%ebp),%eax
    12ab:	8b 55 08             	mov    0x8(%ebp),%edx
    12ae:	56                   	push   %esi
    12af:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    12b2:	85 c0                	test   %eax,%eax
    12b4:	7e 0f                	jle    12c5 <memmove+0x25>
    12b6:	01 d0                	add    %edx,%eax
  dst = vdst;
    12b8:	89 d7                	mov    %edx,%edi
    12ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    12c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    12c1:	39 f8                	cmp    %edi,%eax
    12c3:	75 fb                	jne    12c0 <memmove+0x20>
  return vdst;
}
    12c5:	5e                   	pop    %esi
    12c6:	89 d0                	mov    %edx,%eax
    12c8:	5f                   	pop    %edi
    12c9:	5d                   	pop    %ebp
    12ca:	c3                   	ret    

000012cb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    12cb:	b8 01 00 00 00       	mov    $0x1,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <exit>:
SYSCALL(exit)
    12d3:	b8 02 00 00 00       	mov    $0x2,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <wait>:
SYSCALL(wait)
    12db:	b8 03 00 00 00       	mov    $0x3,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <pipe>:
SYSCALL(pipe)
    12e3:	b8 04 00 00 00       	mov    $0x4,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <read>:
SYSCALL(read)
    12eb:	b8 05 00 00 00       	mov    $0x5,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <write>:
SYSCALL(write)
    12f3:	b8 10 00 00 00       	mov    $0x10,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <close>:
SYSCALL(close)
    12fb:	b8 15 00 00 00       	mov    $0x15,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <kill>:
SYSCALL(kill)
    1303:	b8 06 00 00 00       	mov    $0x6,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <exec>:
SYSCALL(exec)
    130b:	b8 07 00 00 00       	mov    $0x7,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <open>:
SYSCALL(open)
    1313:	b8 0f 00 00 00       	mov    $0xf,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <mknod>:
SYSCALL(mknod)
    131b:	b8 11 00 00 00       	mov    $0x11,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <unlink>:
SYSCALL(unlink)
    1323:	b8 12 00 00 00       	mov    $0x12,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <fstat>:
SYSCALL(fstat)
    132b:	b8 08 00 00 00       	mov    $0x8,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <link>:
SYSCALL(link)
    1333:	b8 13 00 00 00       	mov    $0x13,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <mkdir>:
SYSCALL(mkdir)
    133b:	b8 14 00 00 00       	mov    $0x14,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <chdir>:
SYSCALL(chdir)
    1343:	b8 09 00 00 00       	mov    $0x9,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <dup>:
SYSCALL(dup)
    134b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <getpid>:
SYSCALL(getpid)
    1353:	b8 0b 00 00 00       	mov    $0xb,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <sbrk>:
SYSCALL(sbrk)
    135b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <sleep>:
SYSCALL(sleep)
    1363:	b8 0d 00 00 00       	mov    $0xd,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <uptime>:
SYSCALL(uptime)
    136b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <shm_open>:
SYSCALL(shm_open)
    1373:	b8 16 00 00 00       	mov    $0x16,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <shm_close>:
SYSCALL(shm_close)	
    137b:	b8 17 00 00 00       	mov    $0x17,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    
    1383:	66 90                	xchg   %ax,%ax
    1385:	66 90                	xchg   %ax,%ax
    1387:	66 90                	xchg   %ax,%ax
    1389:	66 90                	xchg   %ax,%ax
    138b:	66 90                	xchg   %ax,%ax
    138d:	66 90                	xchg   %ax,%ax
    138f:	90                   	nop

00001390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	57                   	push   %edi
    1394:	56                   	push   %esi
    1395:	53                   	push   %ebx
    1396:	83 ec 3c             	sub    $0x3c,%esp
    1399:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    139c:	89 d1                	mov    %edx,%ecx
{
    139e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    13a1:	85 d2                	test   %edx,%edx
    13a3:	0f 89 7f 00 00 00    	jns    1428 <printint+0x98>
    13a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    13ad:	74 79                	je     1428 <printint+0x98>
    neg = 1;
    13af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    13b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    13b8:	31 db                	xor    %ebx,%ebx
    13ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
    13bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    13c0:	89 c8                	mov    %ecx,%eax
    13c2:	31 d2                	xor    %edx,%edx
    13c4:	89 cf                	mov    %ecx,%edi
    13c6:	f7 75 c4             	divl   -0x3c(%ebp)
    13c9:	0f b6 92 04 18 00 00 	movzbl 0x1804(%edx),%edx
    13d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13d3:	89 d8                	mov    %ebx,%eax
    13d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13e1:	76 dd                	jbe    13c0 <printint+0x30>
  if(neg)
    13e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13e6:	85 c9                	test   %ecx,%ecx
    13e8:	74 0c                	je     13f6 <printint+0x66>
    buf[i++] = '-';
    13ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13fd:	eb 07                	jmp    1406 <printint+0x76>
    13ff:	90                   	nop
    1400:	0f b6 13             	movzbl (%ebx),%edx
    1403:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1406:	83 ec 04             	sub    $0x4,%esp
    1409:	88 55 d7             	mov    %dl,-0x29(%ebp)
    140c:	6a 01                	push   $0x1
    140e:	56                   	push   %esi
    140f:	57                   	push   %edi
    1410:	e8 de fe ff ff       	call   12f3 <write>
  while(--i >= 0)
    1415:	83 c4 10             	add    $0x10,%esp
    1418:	39 de                	cmp    %ebx,%esi
    141a:	75 e4                	jne    1400 <printint+0x70>
    putc(fd, buf[i]);
}
    141c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    141f:	5b                   	pop    %ebx
    1420:	5e                   	pop    %esi
    1421:	5f                   	pop    %edi
    1422:	5d                   	pop    %ebp
    1423:	c3                   	ret    
    1424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1428:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    142f:	eb 87                	jmp    13b8 <printint+0x28>
    1431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1438:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    143f:	90                   	nop

00001440 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1440:	f3 0f 1e fb          	endbr32 
    1444:	55                   	push   %ebp
    1445:	89 e5                	mov    %esp,%ebp
    1447:	57                   	push   %edi
    1448:	56                   	push   %esi
    1449:	53                   	push   %ebx
    144a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    144d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1450:	0f b6 1e             	movzbl (%esi),%ebx
    1453:	84 db                	test   %bl,%bl
    1455:	0f 84 b4 00 00 00    	je     150f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    145b:	8d 45 10             	lea    0x10(%ebp),%eax
    145e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1461:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1464:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1466:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1469:	eb 33                	jmp    149e <printf+0x5e>
    146b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    146f:	90                   	nop
    1470:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1473:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1478:	83 f8 25             	cmp    $0x25,%eax
    147b:	74 17                	je     1494 <printf+0x54>
  write(fd, &c, 1);
    147d:	83 ec 04             	sub    $0x4,%esp
    1480:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1483:	6a 01                	push   $0x1
    1485:	57                   	push   %edi
    1486:	ff 75 08             	pushl  0x8(%ebp)
    1489:	e8 65 fe ff ff       	call   12f3 <write>
    148e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1491:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1494:	0f b6 1e             	movzbl (%esi),%ebx
    1497:	83 c6 01             	add    $0x1,%esi
    149a:	84 db                	test   %bl,%bl
    149c:	74 71                	je     150f <printf+0xcf>
    c = fmt[i] & 0xff;
    149e:	0f be cb             	movsbl %bl,%ecx
    14a1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    14a4:	85 d2                	test   %edx,%edx
    14a6:	74 c8                	je     1470 <printf+0x30>
      }
    } else if(state == '%'){
    14a8:	83 fa 25             	cmp    $0x25,%edx
    14ab:	75 e7                	jne    1494 <printf+0x54>
      if(c == 'd'){
    14ad:	83 f8 64             	cmp    $0x64,%eax
    14b0:	0f 84 9a 00 00 00    	je     1550 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    14b6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    14bc:	83 f9 70             	cmp    $0x70,%ecx
    14bf:	74 5f                	je     1520 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    14c1:	83 f8 73             	cmp    $0x73,%eax
    14c4:	0f 84 d6 00 00 00    	je     15a0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    14ca:	83 f8 63             	cmp    $0x63,%eax
    14cd:	0f 84 8d 00 00 00    	je     1560 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14d3:	83 f8 25             	cmp    $0x25,%eax
    14d6:	0f 84 b4 00 00 00    	je     1590 <printf+0x150>
  write(fd, &c, 1);
    14dc:	83 ec 04             	sub    $0x4,%esp
    14df:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14e3:	6a 01                	push   $0x1
    14e5:	57                   	push   %edi
    14e6:	ff 75 08             	pushl  0x8(%ebp)
    14e9:	e8 05 fe ff ff       	call   12f3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    14ee:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    14f1:	83 c4 0c             	add    $0xc,%esp
    14f4:	6a 01                	push   $0x1
    14f6:	83 c6 01             	add    $0x1,%esi
    14f9:	57                   	push   %edi
    14fa:	ff 75 08             	pushl  0x8(%ebp)
    14fd:	e8 f1 fd ff ff       	call   12f3 <write>
  for(i = 0; fmt[i]; i++){
    1502:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1506:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1509:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    150b:	84 db                	test   %bl,%bl
    150d:	75 8f                	jne    149e <printf+0x5e>
    }
  }
}
    150f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1512:	5b                   	pop    %ebx
    1513:	5e                   	pop    %esi
    1514:	5f                   	pop    %edi
    1515:	5d                   	pop    %ebp
    1516:	c3                   	ret    
    1517:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    151e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1520:	83 ec 0c             	sub    $0xc,%esp
    1523:	b9 10 00 00 00       	mov    $0x10,%ecx
    1528:	6a 00                	push   $0x0
    152a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    152d:	8b 45 08             	mov    0x8(%ebp),%eax
    1530:	8b 13                	mov    (%ebx),%edx
    1532:	e8 59 fe ff ff       	call   1390 <printint>
        ap++;
    1537:	89 d8                	mov    %ebx,%eax
    1539:	83 c4 10             	add    $0x10,%esp
      state = 0;
    153c:	31 d2                	xor    %edx,%edx
        ap++;
    153e:	83 c0 04             	add    $0x4,%eax
    1541:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1544:	e9 4b ff ff ff       	jmp    1494 <printf+0x54>
    1549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1550:	83 ec 0c             	sub    $0xc,%esp
    1553:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1558:	6a 01                	push   $0x1
    155a:	eb ce                	jmp    152a <printf+0xea>
    155c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1560:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1563:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1566:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1568:	6a 01                	push   $0x1
        ap++;
    156a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    156d:	57                   	push   %edi
    156e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1571:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1574:	e8 7a fd ff ff       	call   12f3 <write>
        ap++;
    1579:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    157c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    157f:	31 d2                	xor    %edx,%edx
    1581:	e9 0e ff ff ff       	jmp    1494 <printf+0x54>
    1586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    158d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1590:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1593:	83 ec 04             	sub    $0x4,%esp
    1596:	e9 59 ff ff ff       	jmp    14f4 <printf+0xb4>
    159b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    159f:	90                   	nop
        s = (char*)*ap;
    15a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    15a3:	8b 18                	mov    (%eax),%ebx
        ap++;
    15a5:	83 c0 04             	add    $0x4,%eax
    15a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    15ab:	85 db                	test   %ebx,%ebx
    15ad:	74 17                	je     15c6 <printf+0x186>
        while(*s != 0){
    15af:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    15b2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    15b4:	84 c0                	test   %al,%al
    15b6:	0f 84 d8 fe ff ff    	je     1494 <printf+0x54>
    15bc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15bf:	89 de                	mov    %ebx,%esi
    15c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15c4:	eb 1a                	jmp    15e0 <printf+0x1a0>
          s = "(null)";
    15c6:	bb fc 17 00 00       	mov    $0x17fc,%ebx
        while(*s != 0){
    15cb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    15ce:	b8 28 00 00 00       	mov    $0x28,%eax
    15d3:	89 de                	mov    %ebx,%esi
    15d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15df:	90                   	nop
  write(fd, &c, 1);
    15e0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15e3:	83 c6 01             	add    $0x1,%esi
    15e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15e9:	6a 01                	push   $0x1
    15eb:	57                   	push   %edi
    15ec:	53                   	push   %ebx
    15ed:	e8 01 fd ff ff       	call   12f3 <write>
        while(*s != 0){
    15f2:	0f b6 06             	movzbl (%esi),%eax
    15f5:	83 c4 10             	add    $0x10,%esp
    15f8:	84 c0                	test   %al,%al
    15fa:	75 e4                	jne    15e0 <printf+0x1a0>
    15fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15ff:	31 d2                	xor    %edx,%edx
    1601:	e9 8e fe ff ff       	jmp    1494 <printf+0x54>
    1606:	66 90                	xchg   %ax,%ax
    1608:	66 90                	xchg   %ax,%ax
    160a:	66 90                	xchg   %ax,%ax
    160c:	66 90                	xchg   %ax,%ax
    160e:	66 90                	xchg   %ax,%ax

00001610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1610:	f3 0f 1e fb          	endbr32 
    1614:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1615:	a1 f4 1a 00 00       	mov    0x1af4,%eax
{
    161a:	89 e5                	mov    %esp,%ebp
    161c:	57                   	push   %edi
    161d:	56                   	push   %esi
    161e:	53                   	push   %ebx
    161f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1622:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1624:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1627:	39 c8                	cmp    %ecx,%eax
    1629:	73 15                	jae    1640 <free+0x30>
    162b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    162f:	90                   	nop
    1630:	39 d1                	cmp    %edx,%ecx
    1632:	72 14                	jb     1648 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1634:	39 d0                	cmp    %edx,%eax
    1636:	73 10                	jae    1648 <free+0x38>
{
    1638:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    163a:	8b 10                	mov    (%eax),%edx
    163c:	39 c8                	cmp    %ecx,%eax
    163e:	72 f0                	jb     1630 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1640:	39 d0                	cmp    %edx,%eax
    1642:	72 f4                	jb     1638 <free+0x28>
    1644:	39 d1                	cmp    %edx,%ecx
    1646:	73 f0                	jae    1638 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1648:	8b 73 fc             	mov    -0x4(%ebx),%esi
    164b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    164e:	39 fa                	cmp    %edi,%edx
    1650:	74 1e                	je     1670 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1652:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1655:	8b 50 04             	mov    0x4(%eax),%edx
    1658:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    165b:	39 f1                	cmp    %esi,%ecx
    165d:	74 28                	je     1687 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    165f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1661:	5b                   	pop    %ebx
  freep = p;
    1662:	a3 f4 1a 00 00       	mov    %eax,0x1af4
}
    1667:	5e                   	pop    %esi
    1668:	5f                   	pop    %edi
    1669:	5d                   	pop    %ebp
    166a:	c3                   	ret    
    166b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    166f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1670:	03 72 04             	add    0x4(%edx),%esi
    1673:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1676:	8b 10                	mov    (%eax),%edx
    1678:	8b 12                	mov    (%edx),%edx
    167a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    167d:	8b 50 04             	mov    0x4(%eax),%edx
    1680:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1683:	39 f1                	cmp    %esi,%ecx
    1685:	75 d8                	jne    165f <free+0x4f>
    p->s.size += bp->s.size;
    1687:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    168a:	a3 f4 1a 00 00       	mov    %eax,0x1af4
    p->s.size += bp->s.size;
    168f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1692:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1695:	89 10                	mov    %edx,(%eax)
}
    1697:	5b                   	pop    %ebx
    1698:	5e                   	pop    %esi
    1699:	5f                   	pop    %edi
    169a:	5d                   	pop    %ebp
    169b:	c3                   	ret    
    169c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000016a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    16a0:	f3 0f 1e fb          	endbr32 
    16a4:	55                   	push   %ebp
    16a5:	89 e5                	mov    %esp,%ebp
    16a7:	57                   	push   %edi
    16a8:	56                   	push   %esi
    16a9:	53                   	push   %ebx
    16aa:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16ad:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    16b0:	8b 3d f4 1a 00 00    	mov    0x1af4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    16b6:	8d 70 07             	lea    0x7(%eax),%esi
    16b9:	c1 ee 03             	shr    $0x3,%esi
    16bc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    16bf:	85 ff                	test   %edi,%edi
    16c1:	0f 84 a9 00 00 00    	je     1770 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16c7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    16c9:	8b 48 04             	mov    0x4(%eax),%ecx
    16cc:	39 f1                	cmp    %esi,%ecx
    16ce:	73 6d                	jae    173d <malloc+0x9d>
    16d0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    16d6:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16db:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    16de:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    16e5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    16e8:	eb 17                	jmp    1701 <malloc+0x61>
    16ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16f0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    16f2:	8b 4a 04             	mov    0x4(%edx),%ecx
    16f5:	39 f1                	cmp    %esi,%ecx
    16f7:	73 4f                	jae    1748 <malloc+0xa8>
    16f9:	8b 3d f4 1a 00 00    	mov    0x1af4,%edi
    16ff:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1701:	39 c7                	cmp    %eax,%edi
    1703:	75 eb                	jne    16f0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1705:	83 ec 0c             	sub    $0xc,%esp
    1708:	ff 75 e4             	pushl  -0x1c(%ebp)
    170b:	e8 4b fc ff ff       	call   135b <sbrk>
  if(p == (char*)-1)
    1710:	83 c4 10             	add    $0x10,%esp
    1713:	83 f8 ff             	cmp    $0xffffffff,%eax
    1716:	74 1b                	je     1733 <malloc+0x93>
  hp->s.size = nu;
    1718:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    171b:	83 ec 0c             	sub    $0xc,%esp
    171e:	83 c0 08             	add    $0x8,%eax
    1721:	50                   	push   %eax
    1722:	e8 e9 fe ff ff       	call   1610 <free>
  return freep;
    1727:	a1 f4 1a 00 00       	mov    0x1af4,%eax
      if((p = morecore(nunits)) == 0)
    172c:	83 c4 10             	add    $0x10,%esp
    172f:	85 c0                	test   %eax,%eax
    1731:	75 bd                	jne    16f0 <malloc+0x50>
        return 0;
  }
}
    1733:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1736:	31 c0                	xor    %eax,%eax
}
    1738:	5b                   	pop    %ebx
    1739:	5e                   	pop    %esi
    173a:	5f                   	pop    %edi
    173b:	5d                   	pop    %ebp
    173c:	c3                   	ret    
    if(p->s.size >= nunits){
    173d:	89 c2                	mov    %eax,%edx
    173f:	89 f8                	mov    %edi,%eax
    1741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1748:	39 ce                	cmp    %ecx,%esi
    174a:	74 54                	je     17a0 <malloc+0x100>
        p->s.size -= nunits;
    174c:	29 f1                	sub    %esi,%ecx
    174e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1751:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1754:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1757:	a3 f4 1a 00 00       	mov    %eax,0x1af4
}
    175c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    175f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1762:	5b                   	pop    %ebx
    1763:	5e                   	pop    %esi
    1764:	5f                   	pop    %edi
    1765:	5d                   	pop    %ebp
    1766:	c3                   	ret    
    1767:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    176e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1770:	c7 05 f4 1a 00 00 f8 	movl   $0x1af8,0x1af4
    1777:	1a 00 00 
    base.s.size = 0;
    177a:	bf f8 1a 00 00       	mov    $0x1af8,%edi
    base.s.ptr = freep = prevp = &base;
    177f:	c7 05 f8 1a 00 00 f8 	movl   $0x1af8,0x1af8
    1786:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1789:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    178b:	c7 05 fc 1a 00 00 00 	movl   $0x0,0x1afc
    1792:	00 00 00 
    if(p->s.size >= nunits){
    1795:	e9 36 ff ff ff       	jmp    16d0 <malloc+0x30>
    179a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    17a0:	8b 0a                	mov    (%edx),%ecx
    17a2:	89 08                	mov    %ecx,(%eax)
    17a4:	eb b1                	jmp    1757 <malloc+0xb7>
    17a6:	66 90                	xchg   %ax,%ax
    17a8:	66 90                	xchg   %ax,%ax
    17aa:	66 90                	xchg   %ax,%ax
    17ac:	66 90                	xchg   %ax,%ax
    17ae:	66 90                	xchg   %ax,%ax

000017b0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    17b0:	f3 0f 1e fb          	endbr32 
    17b4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    17b5:	b9 01 00 00 00       	mov    $0x1,%ecx
    17ba:	89 e5                	mov    %esp,%ebp
    17bc:	8b 55 08             	mov    0x8(%ebp),%edx
    17bf:	90                   	nop
    17c0:	89 c8                	mov    %ecx,%eax
    17c2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    17c5:	85 c0                	test   %eax,%eax
    17c7:	75 f7                	jne    17c0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    17c9:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    17ce:	5d                   	pop    %ebp
    17cf:	c3                   	ret    

000017d0 <urelease>:

void urelease (struct uspinlock *lk) {
    17d0:	f3 0f 1e fb          	endbr32 
    17d4:	55                   	push   %ebp
    17d5:	89 e5                	mov    %esp,%ebp
    17d7:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    17da:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    17df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    17e5:	5d                   	pop    %ebp
    17e6:	c3                   	ret    
