
_forktest:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	55                   	push   %ebp
    1005:	89 e5                	mov    %esp,%ebp
    1007:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
    100a:	e8 41 00 00 00       	call   1050 <forktest>
  exit();
    100f:	e8 9f 03 00 00       	call   13b3 <exit>
    1014:	66 90                	xchg   %ax,%ax
    1016:	66 90                	xchg   %ax,%ax
    1018:	66 90                	xchg   %ax,%ax
    101a:	66 90                	xchg   %ax,%ax
    101c:	66 90                	xchg   %ax,%ax
    101e:	66 90                	xchg   %ax,%ax

00001020 <printf>:
{
    1020:	f3 0f 1e fb          	endbr32 
    1024:	55                   	push   %ebp
    1025:	89 e5                	mov    %esp,%ebp
    1027:	53                   	push   %ebx
    1028:	83 ec 10             	sub    $0x10,%esp
    102b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
    102e:	53                   	push   %ebx
    102f:	e8 9c 01 00 00       	call   11d0 <strlen>
    1034:	83 c4 0c             	add    $0xc,%esp
    1037:	50                   	push   %eax
    1038:	53                   	push   %ebx
    1039:	ff 75 08             	pushl  0x8(%ebp)
    103c:	e8 92 03 00 00       	call   13d3 <write>
}
    1041:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1044:	83 c4 10             	add    $0x10,%esp
    1047:	c9                   	leave  
    1048:	c3                   	ret    
    1049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001050 <forktest>:
{
    1050:	f3 0f 1e fb          	endbr32 
    1054:	55                   	push   %ebp
    1055:	89 e5                	mov    %esp,%ebp
    1057:	53                   	push   %ebx
  for(n=0; n<N; n++){
    1058:	31 db                	xor    %ebx,%ebx
{
    105a:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
    105d:	68 64 14 00 00       	push   $0x1464
    1062:	e8 69 01 00 00       	call   11d0 <strlen>
    1067:	83 c4 0c             	add    $0xc,%esp
    106a:	50                   	push   %eax
    106b:	68 64 14 00 00       	push   $0x1464
    1070:	6a 01                	push   $0x1
    1072:	e8 5c 03 00 00       	call   13d3 <write>
    1077:	83 c4 10             	add    $0x10,%esp
    107a:	eb 15                	jmp    1091 <forktest+0x41>
    107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
    1080:	74 58                	je     10da <forktest+0x8a>
  for(n=0; n<N; n++){
    1082:	83 c3 01             	add    $0x1,%ebx
    1085:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    108b:	0f 84 92 00 00 00    	je     1123 <forktest+0xd3>
    pid = fork();
    1091:	e8 15 03 00 00       	call   13ab <fork>
    if(pid < 0)
    1096:	85 c0                	test   %eax,%eax
    1098:	79 e6                	jns    1080 <forktest+0x30>
  for(; n > 0; n--){
    109a:	85 db                	test   %ebx,%ebx
    109c:	74 10                	je     10ae <forktest+0x5e>
    109e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
    10a0:	e8 16 03 00 00       	call   13bb <wait>
    10a5:	85 c0                	test   %eax,%eax
    10a7:	78 36                	js     10df <forktest+0x8f>
  for(; n > 0; n--){
    10a9:	83 eb 01             	sub    $0x1,%ebx
    10ac:	75 f2                	jne    10a0 <forktest+0x50>
  if(wait() != -1){
    10ae:	e8 08 03 00 00       	call   13bb <wait>
    10b3:	83 f8 ff             	cmp    $0xffffffff,%eax
    10b6:	75 49                	jne    1101 <forktest+0xb1>
  write(fd, s, strlen(s));
    10b8:	83 ec 0c             	sub    $0xc,%esp
    10bb:	68 96 14 00 00       	push   $0x1496
    10c0:	e8 0b 01 00 00       	call   11d0 <strlen>
    10c5:	83 c4 0c             	add    $0xc,%esp
    10c8:	50                   	push   %eax
    10c9:	68 96 14 00 00       	push   $0x1496
    10ce:	6a 01                	push   $0x1
    10d0:	e8 fe 02 00 00       	call   13d3 <write>
}
    10d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10d8:	c9                   	leave  
    10d9:	c3                   	ret    
      exit();
    10da:	e8 d4 02 00 00       	call   13b3 <exit>
  write(fd, s, strlen(s));
    10df:	83 ec 0c             	sub    $0xc,%esp
    10e2:	68 6f 14 00 00       	push   $0x146f
    10e7:	e8 e4 00 00 00       	call   11d0 <strlen>
    10ec:	83 c4 0c             	add    $0xc,%esp
    10ef:	50                   	push   %eax
    10f0:	68 6f 14 00 00       	push   $0x146f
    10f5:	6a 01                	push   $0x1
    10f7:	e8 d7 02 00 00       	call   13d3 <write>
      exit();
    10fc:	e8 b2 02 00 00       	call   13b3 <exit>
  write(fd, s, strlen(s));
    1101:	83 ec 0c             	sub    $0xc,%esp
    1104:	68 83 14 00 00       	push   $0x1483
    1109:	e8 c2 00 00 00       	call   11d0 <strlen>
    110e:	83 c4 0c             	add    $0xc,%esp
    1111:	50                   	push   %eax
    1112:	68 83 14 00 00       	push   $0x1483
    1117:	6a 01                	push   $0x1
    1119:	e8 b5 02 00 00       	call   13d3 <write>
    exit();
    111e:	e8 90 02 00 00       	call   13b3 <exit>
  write(fd, s, strlen(s));
    1123:	83 ec 0c             	sub    $0xc,%esp
    1126:	68 a4 14 00 00       	push   $0x14a4
    112b:	e8 a0 00 00 00       	call   11d0 <strlen>
    1130:	83 c4 0c             	add    $0xc,%esp
    1133:	50                   	push   %eax
    1134:	68 a4 14 00 00       	push   $0x14a4
    1139:	6a 01                	push   $0x1
    113b:	e8 93 02 00 00       	call   13d3 <write>
    exit();
    1140:	e8 6e 02 00 00       	call   13b3 <exit>
    1145:	66 90                	xchg   %ax,%ax
    1147:	66 90                	xchg   %ax,%ax
    1149:	66 90                	xchg   %ax,%ax
    114b:	66 90                	xchg   %ax,%ax
    114d:	66 90                	xchg   %ax,%ax
    114f:	90                   	nop

00001150 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1150:	f3 0f 1e fb          	endbr32 
    1154:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1155:	31 c0                	xor    %eax,%eax
{
    1157:	89 e5                	mov    %esp,%ebp
    1159:	53                   	push   %ebx
    115a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    115d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1160:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1164:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1167:	83 c0 01             	add    $0x1,%eax
    116a:	84 d2                	test   %dl,%dl
    116c:	75 f2                	jne    1160 <strcpy+0x10>
    ;
  return os;
}
    116e:	89 c8                	mov    %ecx,%eax
    1170:	5b                   	pop    %ebx
    1171:	5d                   	pop    %ebp
    1172:	c3                   	ret    
    1173:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1180:	f3 0f 1e fb          	endbr32 
    1184:	55                   	push   %ebp
    1185:	89 e5                	mov    %esp,%ebp
    1187:	53                   	push   %ebx
    1188:	8b 4d 08             	mov    0x8(%ebp),%ecx
    118b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    118e:	0f b6 01             	movzbl (%ecx),%eax
    1191:	0f b6 1a             	movzbl (%edx),%ebx
    1194:	84 c0                	test   %al,%al
    1196:	75 19                	jne    11b1 <strcmp+0x31>
    1198:	eb 26                	jmp    11c0 <strcmp+0x40>
    119a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11a0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    11a4:	83 c1 01             	add    $0x1,%ecx
    11a7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    11aa:	0f b6 1a             	movzbl (%edx),%ebx
    11ad:	84 c0                	test   %al,%al
    11af:	74 0f                	je     11c0 <strcmp+0x40>
    11b1:	38 d8                	cmp    %bl,%al
    11b3:	74 eb                	je     11a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    11b5:	29 d8                	sub    %ebx,%eax
}
    11b7:	5b                   	pop    %ebx
    11b8:	5d                   	pop    %ebp
    11b9:	c3                   	ret    
    11ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    11c2:	29 d8                	sub    %ebx,%eax
}
    11c4:	5b                   	pop    %ebx
    11c5:	5d                   	pop    %ebp
    11c6:	c3                   	ret    
    11c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ce:	66 90                	xchg   %ax,%ax

000011d0 <strlen>:

uint
strlen(char *s)
{
    11d0:	f3 0f 1e fb          	endbr32 
    11d4:	55                   	push   %ebp
    11d5:	89 e5                	mov    %esp,%ebp
    11d7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    11da:	80 3a 00             	cmpb   $0x0,(%edx)
    11dd:	74 21                	je     1200 <strlen+0x30>
    11df:	31 c0                	xor    %eax,%eax
    11e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11e8:	83 c0 01             	add    $0x1,%eax
    11eb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    11ef:	89 c1                	mov    %eax,%ecx
    11f1:	75 f5                	jne    11e8 <strlen+0x18>
    ;
  return n;
}
    11f3:	89 c8                	mov    %ecx,%eax
    11f5:	5d                   	pop    %ebp
    11f6:	c3                   	ret    
    11f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11fe:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    1200:	31 c9                	xor    %ecx,%ecx
}
    1202:	5d                   	pop    %ebp
    1203:	89 c8                	mov    %ecx,%eax
    1205:	c3                   	ret    
    1206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120d:	8d 76 00             	lea    0x0(%esi),%esi

00001210 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1210:	f3 0f 1e fb          	endbr32 
    1214:	55                   	push   %ebp
    1215:	89 e5                	mov    %esp,%ebp
    1217:	57                   	push   %edi
    1218:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    121b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    121e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1221:	89 d7                	mov    %edx,%edi
    1223:	fc                   	cld    
    1224:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1226:	89 d0                	mov    %edx,%eax
    1228:	5f                   	pop    %edi
    1229:	5d                   	pop    %ebp
    122a:	c3                   	ret    
    122b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    122f:	90                   	nop

00001230 <strchr>:

char*
strchr(const char *s, char c)
{
    1230:	f3 0f 1e fb          	endbr32 
    1234:	55                   	push   %ebp
    1235:	89 e5                	mov    %esp,%ebp
    1237:	8b 45 08             	mov    0x8(%ebp),%eax
    123a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    123e:	0f b6 10             	movzbl (%eax),%edx
    1241:	84 d2                	test   %dl,%dl
    1243:	75 16                	jne    125b <strchr+0x2b>
    1245:	eb 21                	jmp    1268 <strchr+0x38>
    1247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    124e:	66 90                	xchg   %ax,%ax
    1250:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1254:	83 c0 01             	add    $0x1,%eax
    1257:	84 d2                	test   %dl,%dl
    1259:	74 0d                	je     1268 <strchr+0x38>
    if(*s == c)
    125b:	38 d1                	cmp    %dl,%cl
    125d:	75 f1                	jne    1250 <strchr+0x20>
      return (char*)s;
  return 0;
}
    125f:	5d                   	pop    %ebp
    1260:	c3                   	ret    
    1261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1268:	31 c0                	xor    %eax,%eax
}
    126a:	5d                   	pop    %ebp
    126b:	c3                   	ret    
    126c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001270 <gets>:

char*
gets(char *buf, int max)
{
    1270:	f3 0f 1e fb          	endbr32 
    1274:	55                   	push   %ebp
    1275:	89 e5                	mov    %esp,%ebp
    1277:	57                   	push   %edi
    1278:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1279:	31 f6                	xor    %esi,%esi
{
    127b:	53                   	push   %ebx
    127c:	89 f3                	mov    %esi,%ebx
    127e:	83 ec 1c             	sub    $0x1c,%esp
    1281:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1284:	eb 33                	jmp    12b9 <gets+0x49>
    1286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    128d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1290:	83 ec 04             	sub    $0x4,%esp
    1293:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1296:	6a 01                	push   $0x1
    1298:	50                   	push   %eax
    1299:	6a 00                	push   $0x0
    129b:	e8 2b 01 00 00       	call   13cb <read>
    if(cc < 1)
    12a0:	83 c4 10             	add    $0x10,%esp
    12a3:	85 c0                	test   %eax,%eax
    12a5:	7e 1c                	jle    12c3 <gets+0x53>
      break;
    buf[i++] = c;
    12a7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    12ab:	83 c7 01             	add    $0x1,%edi
    12ae:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    12b1:	3c 0a                	cmp    $0xa,%al
    12b3:	74 23                	je     12d8 <gets+0x68>
    12b5:	3c 0d                	cmp    $0xd,%al
    12b7:	74 1f                	je     12d8 <gets+0x68>
  for(i=0; i+1 < max; ){
    12b9:	83 c3 01             	add    $0x1,%ebx
    12bc:	89 fe                	mov    %edi,%esi
    12be:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    12c1:	7c cd                	jl     1290 <gets+0x20>
    12c3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    12c5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    12c8:	c6 03 00             	movb   $0x0,(%ebx)
}
    12cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12ce:	5b                   	pop    %ebx
    12cf:	5e                   	pop    %esi
    12d0:	5f                   	pop    %edi
    12d1:	5d                   	pop    %ebp
    12d2:	c3                   	ret    
    12d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12d7:	90                   	nop
    12d8:	8b 75 08             	mov    0x8(%ebp),%esi
    12db:	8b 45 08             	mov    0x8(%ebp),%eax
    12de:	01 de                	add    %ebx,%esi
    12e0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    12e2:	c6 03 00             	movb   $0x0,(%ebx)
}
    12e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12e8:	5b                   	pop    %ebx
    12e9:	5e                   	pop    %esi
    12ea:	5f                   	pop    %edi
    12eb:	5d                   	pop    %ebp
    12ec:	c3                   	ret    
    12ed:	8d 76 00             	lea    0x0(%esi),%esi

000012f0 <stat>:

int
stat(char *n, struct stat *st)
{
    12f0:	f3 0f 1e fb          	endbr32 
    12f4:	55                   	push   %ebp
    12f5:	89 e5                	mov    %esp,%ebp
    12f7:	56                   	push   %esi
    12f8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    12f9:	83 ec 08             	sub    $0x8,%esp
    12fc:	6a 00                	push   $0x0
    12fe:	ff 75 08             	pushl  0x8(%ebp)
    1301:	e8 ed 00 00 00       	call   13f3 <open>
  if(fd < 0)
    1306:	83 c4 10             	add    $0x10,%esp
    1309:	85 c0                	test   %eax,%eax
    130b:	78 2b                	js     1338 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    130d:	83 ec 08             	sub    $0x8,%esp
    1310:	ff 75 0c             	pushl  0xc(%ebp)
    1313:	89 c3                	mov    %eax,%ebx
    1315:	50                   	push   %eax
    1316:	e8 f0 00 00 00       	call   140b <fstat>
  close(fd);
    131b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    131e:	89 c6                	mov    %eax,%esi
  close(fd);
    1320:	e8 b6 00 00 00       	call   13db <close>
  return r;
    1325:	83 c4 10             	add    $0x10,%esp
}
    1328:	8d 65 f8             	lea    -0x8(%ebp),%esp
    132b:	89 f0                	mov    %esi,%eax
    132d:	5b                   	pop    %ebx
    132e:	5e                   	pop    %esi
    132f:	5d                   	pop    %ebp
    1330:	c3                   	ret    
    1331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1338:	be ff ff ff ff       	mov    $0xffffffff,%esi
    133d:	eb e9                	jmp    1328 <stat+0x38>
    133f:	90                   	nop

00001340 <atoi>:

int
atoi(const char *s)
{
    1340:	f3 0f 1e fb          	endbr32 
    1344:	55                   	push   %ebp
    1345:	89 e5                	mov    %esp,%ebp
    1347:	53                   	push   %ebx
    1348:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    134b:	0f be 02             	movsbl (%edx),%eax
    134e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1351:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1354:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1359:	77 1a                	ja     1375 <atoi+0x35>
    135b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    135f:	90                   	nop
    n = n*10 + *s++ - '0';
    1360:	83 c2 01             	add    $0x1,%edx
    1363:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1366:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    136a:	0f be 02             	movsbl (%edx),%eax
    136d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1370:	80 fb 09             	cmp    $0x9,%bl
    1373:	76 eb                	jbe    1360 <atoi+0x20>
  return n;
}
    1375:	89 c8                	mov    %ecx,%eax
    1377:	5b                   	pop    %ebx
    1378:	5d                   	pop    %ebp
    1379:	c3                   	ret    
    137a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001380 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1380:	f3 0f 1e fb          	endbr32 
    1384:	55                   	push   %ebp
    1385:	89 e5                	mov    %esp,%ebp
    1387:	57                   	push   %edi
    1388:	8b 45 10             	mov    0x10(%ebp),%eax
    138b:	8b 55 08             	mov    0x8(%ebp),%edx
    138e:	56                   	push   %esi
    138f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1392:	85 c0                	test   %eax,%eax
    1394:	7e 0f                	jle    13a5 <memmove+0x25>
    1396:	01 d0                	add    %edx,%eax
  dst = vdst;
    1398:	89 d7                	mov    %edx,%edi
    139a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    13a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    13a1:	39 f8                	cmp    %edi,%eax
    13a3:	75 fb                	jne    13a0 <memmove+0x20>
  return vdst;
}
    13a5:	5e                   	pop    %esi
    13a6:	89 d0                	mov    %edx,%eax
    13a8:	5f                   	pop    %edi
    13a9:	5d                   	pop    %ebp
    13aa:	c3                   	ret    

000013ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13ab:	b8 01 00 00 00       	mov    $0x1,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    

000013b3 <exit>:
SYSCALL(exit)
    13b3:	b8 02 00 00 00       	mov    $0x2,%eax
    13b8:	cd 40                	int    $0x40
    13ba:	c3                   	ret    

000013bb <wait>:
SYSCALL(wait)
    13bb:	b8 03 00 00 00       	mov    $0x3,%eax
    13c0:	cd 40                	int    $0x40
    13c2:	c3                   	ret    

000013c3 <pipe>:
SYSCALL(pipe)
    13c3:	b8 04 00 00 00       	mov    $0x4,%eax
    13c8:	cd 40                	int    $0x40
    13ca:	c3                   	ret    

000013cb <read>:
SYSCALL(read)
    13cb:	b8 05 00 00 00       	mov    $0x5,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <write>:
SYSCALL(write)
    13d3:	b8 10 00 00 00       	mov    $0x10,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <close>:
SYSCALL(close)
    13db:	b8 15 00 00 00       	mov    $0x15,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    

000013e3 <kill>:
SYSCALL(kill)
    13e3:	b8 06 00 00 00       	mov    $0x6,%eax
    13e8:	cd 40                	int    $0x40
    13ea:	c3                   	ret    

000013eb <exec>:
SYSCALL(exec)
    13eb:	b8 07 00 00 00       	mov    $0x7,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    

000013f3 <open>:
SYSCALL(open)
    13f3:	b8 0f 00 00 00       	mov    $0xf,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <mknod>:
SYSCALL(mknod)
    13fb:	b8 11 00 00 00       	mov    $0x11,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    

00001403 <unlink>:
SYSCALL(unlink)
    1403:	b8 12 00 00 00       	mov    $0x12,%eax
    1408:	cd 40                	int    $0x40
    140a:	c3                   	ret    

0000140b <fstat>:
SYSCALL(fstat)
    140b:	b8 08 00 00 00       	mov    $0x8,%eax
    1410:	cd 40                	int    $0x40
    1412:	c3                   	ret    

00001413 <link>:
SYSCALL(link)
    1413:	b8 13 00 00 00       	mov    $0x13,%eax
    1418:	cd 40                	int    $0x40
    141a:	c3                   	ret    

0000141b <mkdir>:
SYSCALL(mkdir)
    141b:	b8 14 00 00 00       	mov    $0x14,%eax
    1420:	cd 40                	int    $0x40
    1422:	c3                   	ret    

00001423 <chdir>:
SYSCALL(chdir)
    1423:	b8 09 00 00 00       	mov    $0x9,%eax
    1428:	cd 40                	int    $0x40
    142a:	c3                   	ret    

0000142b <dup>:
SYSCALL(dup)
    142b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1430:	cd 40                	int    $0x40
    1432:	c3                   	ret    

00001433 <getpid>:
SYSCALL(getpid)
    1433:	b8 0b 00 00 00       	mov    $0xb,%eax
    1438:	cd 40                	int    $0x40
    143a:	c3                   	ret    

0000143b <sbrk>:
SYSCALL(sbrk)
    143b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1440:	cd 40                	int    $0x40
    1442:	c3                   	ret    

00001443 <sleep>:
SYSCALL(sleep)
    1443:	b8 0d 00 00 00       	mov    $0xd,%eax
    1448:	cd 40                	int    $0x40
    144a:	c3                   	ret    

0000144b <uptime>:
SYSCALL(uptime)
    144b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1450:	cd 40                	int    $0x40
    1452:	c3                   	ret    

00001453 <shm_open>:
SYSCALL(shm_open)
    1453:	b8 16 00 00 00       	mov    $0x16,%eax
    1458:	cd 40                	int    $0x40
    145a:	c3                   	ret    

0000145b <shm_close>:
SYSCALL(shm_close)	
    145b:	b8 17 00 00 00       	mov    $0x17,%eax
    1460:	cd 40                	int    $0x40
    1462:	c3                   	ret    
