
_init:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	53                   	push   %ebx
    1012:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    1013:	83 ec 08             	sub    $0x8,%esp
    1016:	6a 02                	push   $0x2
    1018:	68 68 18 00 00       	push   $0x1868
    101d:	e8 71 03 00 00       	call   1393 <open>
    1022:	83 c4 10             	add    $0x10,%esp
    1025:	85 c0                	test   %eax,%eax
    1027:	0f 88 9b 00 00 00    	js     10c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
    102d:	83 ec 0c             	sub    $0xc,%esp
    1030:	6a 00                	push   $0x0
    1032:	e8 94 03 00 00       	call   13cb <dup>
  dup(0);  // stderr
    1037:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    103e:	e8 88 03 00 00       	call   13cb <dup>
    1043:	83 c4 10             	add    $0x10,%esp
    1046:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    104d:	8d 76 00             	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
    1050:	83 ec 08             	sub    $0x8,%esp
    1053:	68 70 18 00 00       	push   $0x1870
    1058:	6a 01                	push   $0x1
    105a:	e8 61 04 00 00       	call   14c0 <printf>
    pid = fork();
    105f:	e8 e7 02 00 00       	call   134b <fork>
    if(pid < 0){
    1064:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    1067:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    1069:	85 c0                	test   %eax,%eax
    106b:	78 24                	js     1091 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
    106d:	74 35                	je     10a4 <main+0xa4>
    106f:	90                   	nop
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
    1070:	e8 e6 02 00 00       	call   135b <wait>
    1075:	85 c0                	test   %eax,%eax
    1077:	78 d7                	js     1050 <main+0x50>
    1079:	39 c3                	cmp    %eax,%ebx
    107b:	74 d3                	je     1050 <main+0x50>
      printf(1, "zombie!\n");
    107d:	83 ec 08             	sub    $0x8,%esp
    1080:	68 af 18 00 00       	push   $0x18af
    1085:	6a 01                	push   $0x1
    1087:	e8 34 04 00 00       	call   14c0 <printf>
    108c:	83 c4 10             	add    $0x10,%esp
    108f:	eb df                	jmp    1070 <main+0x70>
      printf(1, "init: fork failed\n");
    1091:	53                   	push   %ebx
    1092:	53                   	push   %ebx
    1093:	68 83 18 00 00       	push   $0x1883
    1098:	6a 01                	push   $0x1
    109a:	e8 21 04 00 00       	call   14c0 <printf>
      exit();
    109f:	e8 af 02 00 00       	call   1353 <exit>
      exec("sh", argv);
    10a4:	50                   	push   %eax
    10a5:	50                   	push   %eax
    10a6:	68 ac 1b 00 00       	push   $0x1bac
    10ab:	68 96 18 00 00       	push   $0x1896
    10b0:	e8 d6 02 00 00       	call   138b <exec>
      printf(1, "init: exec sh failed\n");
    10b5:	5a                   	pop    %edx
    10b6:	59                   	pop    %ecx
    10b7:	68 99 18 00 00       	push   $0x1899
    10bc:	6a 01                	push   $0x1
    10be:	e8 fd 03 00 00       	call   14c0 <printf>
      exit();
    10c3:	e8 8b 02 00 00       	call   1353 <exit>
    mknod("console", 1, 1);
    10c8:	50                   	push   %eax
    10c9:	6a 01                	push   $0x1
    10cb:	6a 01                	push   $0x1
    10cd:	68 68 18 00 00       	push   $0x1868
    10d2:	e8 c4 02 00 00       	call   139b <mknod>
    open("console", O_RDWR);
    10d7:	58                   	pop    %eax
    10d8:	5a                   	pop    %edx
    10d9:	6a 02                	push   $0x2
    10db:	68 68 18 00 00       	push   $0x1868
    10e0:	e8 ae 02 00 00       	call   1393 <open>
    10e5:	83 c4 10             	add    $0x10,%esp
    10e8:	e9 40 ff ff ff       	jmp    102d <main+0x2d>
    10ed:	66 90                	xchg   %ax,%ax
    10ef:	90                   	nop

000010f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    10f0:	f3 0f 1e fb          	endbr32 
    10f4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    10f5:	31 c0                	xor    %eax,%eax
{
    10f7:	89 e5                	mov    %esp,%ebp
    10f9:	53                   	push   %ebx
    10fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
    10fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1107:	83 c0 01             	add    $0x1,%eax
    110a:	84 d2                	test   %dl,%dl
    110c:	75 f2                	jne    1100 <strcpy+0x10>
    ;
  return os;
}
    110e:	89 c8                	mov    %ecx,%eax
    1110:	5b                   	pop    %ebx
    1111:	5d                   	pop    %ebp
    1112:	c3                   	ret    
    1113:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1120:	f3 0f 1e fb          	endbr32 
    1124:	55                   	push   %ebp
    1125:	89 e5                	mov    %esp,%ebp
    1127:	53                   	push   %ebx
    1128:	8b 4d 08             	mov    0x8(%ebp),%ecx
    112b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    112e:	0f b6 01             	movzbl (%ecx),%eax
    1131:	0f b6 1a             	movzbl (%edx),%ebx
    1134:	84 c0                	test   %al,%al
    1136:	75 19                	jne    1151 <strcmp+0x31>
    1138:	eb 26                	jmp    1160 <strcmp+0x40>
    113a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1140:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1144:	83 c1 01             	add    $0x1,%ecx
    1147:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    114a:	0f b6 1a             	movzbl (%edx),%ebx
    114d:	84 c0                	test   %al,%al
    114f:	74 0f                	je     1160 <strcmp+0x40>
    1151:	38 d8                	cmp    %bl,%al
    1153:	74 eb                	je     1140 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1155:	29 d8                	sub    %ebx,%eax
}
    1157:	5b                   	pop    %ebx
    1158:	5d                   	pop    %ebp
    1159:	c3                   	ret    
    115a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1160:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1162:	29 d8                	sub    %ebx,%eax
}
    1164:	5b                   	pop    %ebx
    1165:	5d                   	pop    %ebp
    1166:	c3                   	ret    
    1167:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116e:	66 90                	xchg   %ax,%ax

00001170 <strlen>:

uint
strlen(char *s)
{
    1170:	f3 0f 1e fb          	endbr32 
    1174:	55                   	push   %ebp
    1175:	89 e5                	mov    %esp,%ebp
    1177:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    117a:	80 3a 00             	cmpb   $0x0,(%edx)
    117d:	74 21                	je     11a0 <strlen+0x30>
    117f:	31 c0                	xor    %eax,%eax
    1181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1188:	83 c0 01             	add    $0x1,%eax
    118b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    118f:	89 c1                	mov    %eax,%ecx
    1191:	75 f5                	jne    1188 <strlen+0x18>
    ;
  return n;
}
    1193:	89 c8                	mov    %ecx,%eax
    1195:	5d                   	pop    %ebp
    1196:	c3                   	ret    
    1197:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    119e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    11a0:	31 c9                	xor    %ecx,%ecx
}
    11a2:	5d                   	pop    %ebp
    11a3:	89 c8                	mov    %ecx,%eax
    11a5:	c3                   	ret    
    11a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ad:	8d 76 00             	lea    0x0(%esi),%esi

000011b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    11b0:	f3 0f 1e fb          	endbr32 
    11b4:	55                   	push   %ebp
    11b5:	89 e5                	mov    %esp,%ebp
    11b7:	57                   	push   %edi
    11b8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    11bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    11be:	8b 45 0c             	mov    0xc(%ebp),%eax
    11c1:	89 d7                	mov    %edx,%edi
    11c3:	fc                   	cld    
    11c4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    11c6:	89 d0                	mov    %edx,%eax
    11c8:	5f                   	pop    %edi
    11c9:	5d                   	pop    %ebp
    11ca:	c3                   	ret    
    11cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11cf:	90                   	nop

000011d0 <strchr>:

char*
strchr(const char *s, char c)
{
    11d0:	f3 0f 1e fb          	endbr32 
    11d4:	55                   	push   %ebp
    11d5:	89 e5                	mov    %esp,%ebp
    11d7:	8b 45 08             	mov    0x8(%ebp),%eax
    11da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    11de:	0f b6 10             	movzbl (%eax),%edx
    11e1:	84 d2                	test   %dl,%dl
    11e3:	75 16                	jne    11fb <strchr+0x2b>
    11e5:	eb 21                	jmp    1208 <strchr+0x38>
    11e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ee:	66 90                	xchg   %ax,%ax
    11f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    11f4:	83 c0 01             	add    $0x1,%eax
    11f7:	84 d2                	test   %dl,%dl
    11f9:	74 0d                	je     1208 <strchr+0x38>
    if(*s == c)
    11fb:	38 d1                	cmp    %dl,%cl
    11fd:	75 f1                	jne    11f0 <strchr+0x20>
      return (char*)s;
  return 0;
}
    11ff:	5d                   	pop    %ebp
    1200:	c3                   	ret    
    1201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1208:	31 c0                	xor    %eax,%eax
}
    120a:	5d                   	pop    %ebp
    120b:	c3                   	ret    
    120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001210 <gets>:

char*
gets(char *buf, int max)
{
    1210:	f3 0f 1e fb          	endbr32 
    1214:	55                   	push   %ebp
    1215:	89 e5                	mov    %esp,%ebp
    1217:	57                   	push   %edi
    1218:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1219:	31 f6                	xor    %esi,%esi
{
    121b:	53                   	push   %ebx
    121c:	89 f3                	mov    %esi,%ebx
    121e:	83 ec 1c             	sub    $0x1c,%esp
    1221:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1224:	eb 33                	jmp    1259 <gets+0x49>
    1226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1230:	83 ec 04             	sub    $0x4,%esp
    1233:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1236:	6a 01                	push   $0x1
    1238:	50                   	push   %eax
    1239:	6a 00                	push   $0x0
    123b:	e8 2b 01 00 00       	call   136b <read>
    if(cc < 1)
    1240:	83 c4 10             	add    $0x10,%esp
    1243:	85 c0                	test   %eax,%eax
    1245:	7e 1c                	jle    1263 <gets+0x53>
      break;
    buf[i++] = c;
    1247:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    124b:	83 c7 01             	add    $0x1,%edi
    124e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1251:	3c 0a                	cmp    $0xa,%al
    1253:	74 23                	je     1278 <gets+0x68>
    1255:	3c 0d                	cmp    $0xd,%al
    1257:	74 1f                	je     1278 <gets+0x68>
  for(i=0; i+1 < max; ){
    1259:	83 c3 01             	add    $0x1,%ebx
    125c:	89 fe                	mov    %edi,%esi
    125e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1261:	7c cd                	jl     1230 <gets+0x20>
    1263:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1265:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1268:	c6 03 00             	movb   $0x0,(%ebx)
}
    126b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    126e:	5b                   	pop    %ebx
    126f:	5e                   	pop    %esi
    1270:	5f                   	pop    %edi
    1271:	5d                   	pop    %ebp
    1272:	c3                   	ret    
    1273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1277:	90                   	nop
    1278:	8b 75 08             	mov    0x8(%ebp),%esi
    127b:	8b 45 08             	mov    0x8(%ebp),%eax
    127e:	01 de                	add    %ebx,%esi
    1280:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1282:	c6 03 00             	movb   $0x0,(%ebx)
}
    1285:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1288:	5b                   	pop    %ebx
    1289:	5e                   	pop    %esi
    128a:	5f                   	pop    %edi
    128b:	5d                   	pop    %ebp
    128c:	c3                   	ret    
    128d:	8d 76 00             	lea    0x0(%esi),%esi

00001290 <stat>:

int
stat(char *n, struct stat *st)
{
    1290:	f3 0f 1e fb          	endbr32 
    1294:	55                   	push   %ebp
    1295:	89 e5                	mov    %esp,%ebp
    1297:	56                   	push   %esi
    1298:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1299:	83 ec 08             	sub    $0x8,%esp
    129c:	6a 00                	push   $0x0
    129e:	ff 75 08             	pushl  0x8(%ebp)
    12a1:	e8 ed 00 00 00       	call   1393 <open>
  if(fd < 0)
    12a6:	83 c4 10             	add    $0x10,%esp
    12a9:	85 c0                	test   %eax,%eax
    12ab:	78 2b                	js     12d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    12ad:	83 ec 08             	sub    $0x8,%esp
    12b0:	ff 75 0c             	pushl  0xc(%ebp)
    12b3:	89 c3                	mov    %eax,%ebx
    12b5:	50                   	push   %eax
    12b6:	e8 f0 00 00 00       	call   13ab <fstat>
  close(fd);
    12bb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    12be:	89 c6                	mov    %eax,%esi
  close(fd);
    12c0:	e8 b6 00 00 00       	call   137b <close>
  return r;
    12c5:	83 c4 10             	add    $0x10,%esp
}
    12c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    12cb:	89 f0                	mov    %esi,%eax
    12cd:	5b                   	pop    %ebx
    12ce:	5e                   	pop    %esi
    12cf:	5d                   	pop    %ebp
    12d0:	c3                   	ret    
    12d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    12d8:	be ff ff ff ff       	mov    $0xffffffff,%esi
    12dd:	eb e9                	jmp    12c8 <stat+0x38>
    12df:	90                   	nop

000012e0 <atoi>:

int
atoi(const char *s)
{
    12e0:	f3 0f 1e fb          	endbr32 
    12e4:	55                   	push   %ebp
    12e5:	89 e5                	mov    %esp,%ebp
    12e7:	53                   	push   %ebx
    12e8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    12eb:	0f be 02             	movsbl (%edx),%eax
    12ee:	8d 48 d0             	lea    -0x30(%eax),%ecx
    12f1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    12f4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    12f9:	77 1a                	ja     1315 <atoi+0x35>
    12fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12ff:	90                   	nop
    n = n*10 + *s++ - '0';
    1300:	83 c2 01             	add    $0x1,%edx
    1303:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1306:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    130a:	0f be 02             	movsbl (%edx),%eax
    130d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1310:	80 fb 09             	cmp    $0x9,%bl
    1313:	76 eb                	jbe    1300 <atoi+0x20>
  return n;
}
    1315:	89 c8                	mov    %ecx,%eax
    1317:	5b                   	pop    %ebx
    1318:	5d                   	pop    %ebp
    1319:	c3                   	ret    
    131a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001320 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1320:	f3 0f 1e fb          	endbr32 
    1324:	55                   	push   %ebp
    1325:	89 e5                	mov    %esp,%ebp
    1327:	57                   	push   %edi
    1328:	8b 45 10             	mov    0x10(%ebp),%eax
    132b:	8b 55 08             	mov    0x8(%ebp),%edx
    132e:	56                   	push   %esi
    132f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1332:	85 c0                	test   %eax,%eax
    1334:	7e 0f                	jle    1345 <memmove+0x25>
    1336:	01 d0                	add    %edx,%eax
  dst = vdst;
    1338:	89 d7                	mov    %edx,%edi
    133a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1340:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1341:	39 f8                	cmp    %edi,%eax
    1343:	75 fb                	jne    1340 <memmove+0x20>
  return vdst;
}
    1345:	5e                   	pop    %esi
    1346:	89 d0                	mov    %edx,%eax
    1348:	5f                   	pop    %edi
    1349:	5d                   	pop    %ebp
    134a:	c3                   	ret    

0000134b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    134b:	b8 01 00 00 00       	mov    $0x1,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <exit>:
SYSCALL(exit)
    1353:	b8 02 00 00 00       	mov    $0x2,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    

0000135b <wait>:
SYSCALL(wait)
    135b:	b8 03 00 00 00       	mov    $0x3,%eax
    1360:	cd 40                	int    $0x40
    1362:	c3                   	ret    

00001363 <pipe>:
SYSCALL(pipe)
    1363:	b8 04 00 00 00       	mov    $0x4,%eax
    1368:	cd 40                	int    $0x40
    136a:	c3                   	ret    

0000136b <read>:
SYSCALL(read)
    136b:	b8 05 00 00 00       	mov    $0x5,%eax
    1370:	cd 40                	int    $0x40
    1372:	c3                   	ret    

00001373 <write>:
SYSCALL(write)
    1373:	b8 10 00 00 00       	mov    $0x10,%eax
    1378:	cd 40                	int    $0x40
    137a:	c3                   	ret    

0000137b <close>:
SYSCALL(close)
    137b:	b8 15 00 00 00       	mov    $0x15,%eax
    1380:	cd 40                	int    $0x40
    1382:	c3                   	ret    

00001383 <kill>:
SYSCALL(kill)
    1383:	b8 06 00 00 00       	mov    $0x6,%eax
    1388:	cd 40                	int    $0x40
    138a:	c3                   	ret    

0000138b <exec>:
SYSCALL(exec)
    138b:	b8 07 00 00 00       	mov    $0x7,%eax
    1390:	cd 40                	int    $0x40
    1392:	c3                   	ret    

00001393 <open>:
SYSCALL(open)
    1393:	b8 0f 00 00 00       	mov    $0xf,%eax
    1398:	cd 40                	int    $0x40
    139a:	c3                   	ret    

0000139b <mknod>:
SYSCALL(mknod)
    139b:	b8 11 00 00 00       	mov    $0x11,%eax
    13a0:	cd 40                	int    $0x40
    13a2:	c3                   	ret    

000013a3 <unlink>:
SYSCALL(unlink)
    13a3:	b8 12 00 00 00       	mov    $0x12,%eax
    13a8:	cd 40                	int    $0x40
    13aa:	c3                   	ret    

000013ab <fstat>:
SYSCALL(fstat)
    13ab:	b8 08 00 00 00       	mov    $0x8,%eax
    13b0:	cd 40                	int    $0x40
    13b2:	c3                   	ret    

000013b3 <link>:
SYSCALL(link)
    13b3:	b8 13 00 00 00       	mov    $0x13,%eax
    13b8:	cd 40                	int    $0x40
    13ba:	c3                   	ret    

000013bb <mkdir>:
SYSCALL(mkdir)
    13bb:	b8 14 00 00 00       	mov    $0x14,%eax
    13c0:	cd 40                	int    $0x40
    13c2:	c3                   	ret    

000013c3 <chdir>:
SYSCALL(chdir)
    13c3:	b8 09 00 00 00       	mov    $0x9,%eax
    13c8:	cd 40                	int    $0x40
    13ca:	c3                   	ret    

000013cb <dup>:
SYSCALL(dup)
    13cb:	b8 0a 00 00 00       	mov    $0xa,%eax
    13d0:	cd 40                	int    $0x40
    13d2:	c3                   	ret    

000013d3 <getpid>:
SYSCALL(getpid)
    13d3:	b8 0b 00 00 00       	mov    $0xb,%eax
    13d8:	cd 40                	int    $0x40
    13da:	c3                   	ret    

000013db <sbrk>:
SYSCALL(sbrk)
    13db:	b8 0c 00 00 00       	mov    $0xc,%eax
    13e0:	cd 40                	int    $0x40
    13e2:	c3                   	ret    

000013e3 <sleep>:
SYSCALL(sleep)
    13e3:	b8 0d 00 00 00       	mov    $0xd,%eax
    13e8:	cd 40                	int    $0x40
    13ea:	c3                   	ret    

000013eb <uptime>:
SYSCALL(uptime)
    13eb:	b8 0e 00 00 00       	mov    $0xe,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    

000013f3 <shm_open>:
SYSCALL(shm_open)
    13f3:	b8 16 00 00 00       	mov    $0x16,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <shm_close>:
SYSCALL(shm_close)	
    13fb:	b8 17 00 00 00       	mov    $0x17,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    
    1403:	66 90                	xchg   %ax,%ax
    1405:	66 90                	xchg   %ax,%ax
    1407:	66 90                	xchg   %ax,%ax
    1409:	66 90                	xchg   %ax,%ax
    140b:	66 90                	xchg   %ax,%ax
    140d:	66 90                	xchg   %ax,%ax
    140f:	90                   	nop

00001410 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	57                   	push   %edi
    1414:	56                   	push   %esi
    1415:	53                   	push   %ebx
    1416:	83 ec 3c             	sub    $0x3c,%esp
    1419:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    141c:	89 d1                	mov    %edx,%ecx
{
    141e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1421:	85 d2                	test   %edx,%edx
    1423:	0f 89 7f 00 00 00    	jns    14a8 <printint+0x98>
    1429:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    142d:	74 79                	je     14a8 <printint+0x98>
    neg = 1;
    142f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1436:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1438:	31 db                	xor    %ebx,%ebx
    143a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    143d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1440:	89 c8                	mov    %ecx,%eax
    1442:	31 d2                	xor    %edx,%edx
    1444:	89 cf                	mov    %ecx,%edi
    1446:	f7 75 c4             	divl   -0x3c(%ebp)
    1449:	0f b6 92 c0 18 00 00 	movzbl 0x18c0(%edx),%edx
    1450:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1453:	89 d8                	mov    %ebx,%eax
    1455:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1458:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    145b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    145e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1461:	76 dd                	jbe    1440 <printint+0x30>
  if(neg)
    1463:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1466:	85 c9                	test   %ecx,%ecx
    1468:	74 0c                	je     1476 <printint+0x66>
    buf[i++] = '-';
    146a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    146f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1471:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1476:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1479:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    147d:	eb 07                	jmp    1486 <printint+0x76>
    147f:	90                   	nop
    1480:	0f b6 13             	movzbl (%ebx),%edx
    1483:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1486:	83 ec 04             	sub    $0x4,%esp
    1489:	88 55 d7             	mov    %dl,-0x29(%ebp)
    148c:	6a 01                	push   $0x1
    148e:	56                   	push   %esi
    148f:	57                   	push   %edi
    1490:	e8 de fe ff ff       	call   1373 <write>
  while(--i >= 0)
    1495:	83 c4 10             	add    $0x10,%esp
    1498:	39 de                	cmp    %ebx,%esi
    149a:	75 e4                	jne    1480 <printint+0x70>
    putc(fd, buf[i]);
}
    149c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    149f:	5b                   	pop    %ebx
    14a0:	5e                   	pop    %esi
    14a1:	5f                   	pop    %edi
    14a2:	5d                   	pop    %ebp
    14a3:	c3                   	ret    
    14a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    14a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    14af:	eb 87                	jmp    1438 <printint+0x28>
    14b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14bf:	90                   	nop

000014c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    14c0:	f3 0f 1e fb          	endbr32 
    14c4:	55                   	push   %ebp
    14c5:	89 e5                	mov    %esp,%ebp
    14c7:	57                   	push   %edi
    14c8:	56                   	push   %esi
    14c9:	53                   	push   %ebx
    14ca:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    14cd:	8b 75 0c             	mov    0xc(%ebp),%esi
    14d0:	0f b6 1e             	movzbl (%esi),%ebx
    14d3:	84 db                	test   %bl,%bl
    14d5:	0f 84 b4 00 00 00    	je     158f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    14db:	8d 45 10             	lea    0x10(%ebp),%eax
    14de:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    14e1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    14e4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    14e6:	89 45 d0             	mov    %eax,-0x30(%ebp)
    14e9:	eb 33                	jmp    151e <printf+0x5e>
    14eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14ef:	90                   	nop
    14f0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    14f3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    14f8:	83 f8 25             	cmp    $0x25,%eax
    14fb:	74 17                	je     1514 <printf+0x54>
  write(fd, &c, 1);
    14fd:	83 ec 04             	sub    $0x4,%esp
    1500:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1503:	6a 01                	push   $0x1
    1505:	57                   	push   %edi
    1506:	ff 75 08             	pushl  0x8(%ebp)
    1509:	e8 65 fe ff ff       	call   1373 <write>
    150e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1511:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1514:	0f b6 1e             	movzbl (%esi),%ebx
    1517:	83 c6 01             	add    $0x1,%esi
    151a:	84 db                	test   %bl,%bl
    151c:	74 71                	je     158f <printf+0xcf>
    c = fmt[i] & 0xff;
    151e:	0f be cb             	movsbl %bl,%ecx
    1521:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1524:	85 d2                	test   %edx,%edx
    1526:	74 c8                	je     14f0 <printf+0x30>
      }
    } else if(state == '%'){
    1528:	83 fa 25             	cmp    $0x25,%edx
    152b:	75 e7                	jne    1514 <printf+0x54>
      if(c == 'd'){
    152d:	83 f8 64             	cmp    $0x64,%eax
    1530:	0f 84 9a 00 00 00    	je     15d0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1536:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    153c:	83 f9 70             	cmp    $0x70,%ecx
    153f:	74 5f                	je     15a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1541:	83 f8 73             	cmp    $0x73,%eax
    1544:	0f 84 d6 00 00 00    	je     1620 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    154a:	83 f8 63             	cmp    $0x63,%eax
    154d:	0f 84 8d 00 00 00    	je     15e0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1553:	83 f8 25             	cmp    $0x25,%eax
    1556:	0f 84 b4 00 00 00    	je     1610 <printf+0x150>
  write(fd, &c, 1);
    155c:	83 ec 04             	sub    $0x4,%esp
    155f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1563:	6a 01                	push   $0x1
    1565:	57                   	push   %edi
    1566:	ff 75 08             	pushl  0x8(%ebp)
    1569:	e8 05 fe ff ff       	call   1373 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    156e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1571:	83 c4 0c             	add    $0xc,%esp
    1574:	6a 01                	push   $0x1
    1576:	83 c6 01             	add    $0x1,%esi
    1579:	57                   	push   %edi
    157a:	ff 75 08             	pushl  0x8(%ebp)
    157d:	e8 f1 fd ff ff       	call   1373 <write>
  for(i = 0; fmt[i]; i++){
    1582:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1586:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1589:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    158b:	84 db                	test   %bl,%bl
    158d:	75 8f                	jne    151e <printf+0x5e>
    }
  }
}
    158f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1592:	5b                   	pop    %ebx
    1593:	5e                   	pop    %esi
    1594:	5f                   	pop    %edi
    1595:	5d                   	pop    %ebp
    1596:	c3                   	ret    
    1597:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    159e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    15a0:	83 ec 0c             	sub    $0xc,%esp
    15a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    15a8:	6a 00                	push   $0x0
    15aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    15ad:	8b 45 08             	mov    0x8(%ebp),%eax
    15b0:	8b 13                	mov    (%ebx),%edx
    15b2:	e8 59 fe ff ff       	call   1410 <printint>
        ap++;
    15b7:	89 d8                	mov    %ebx,%eax
    15b9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15bc:	31 d2                	xor    %edx,%edx
        ap++;
    15be:	83 c0 04             	add    $0x4,%eax
    15c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
    15c4:	e9 4b ff ff ff       	jmp    1514 <printf+0x54>
    15c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    15d0:	83 ec 0c             	sub    $0xc,%esp
    15d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
    15d8:	6a 01                	push   $0x1
    15da:	eb ce                	jmp    15aa <printf+0xea>
    15dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    15e0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    15e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    15e6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    15e8:	6a 01                	push   $0x1
        ap++;
    15ea:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    15ed:	57                   	push   %edi
    15ee:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    15f1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15f4:	e8 7a fd ff ff       	call   1373 <write>
        ap++;
    15f9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    15fc:	83 c4 10             	add    $0x10,%esp
      state = 0;
    15ff:	31 d2                	xor    %edx,%edx
    1601:	e9 0e ff ff ff       	jmp    1514 <printf+0x54>
    1606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    160d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1610:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1613:	83 ec 04             	sub    $0x4,%esp
    1616:	e9 59 ff ff ff       	jmp    1574 <printf+0xb4>
    161b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    161f:	90                   	nop
        s = (char*)*ap;
    1620:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1623:	8b 18                	mov    (%eax),%ebx
        ap++;
    1625:	83 c0 04             	add    $0x4,%eax
    1628:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    162b:	85 db                	test   %ebx,%ebx
    162d:	74 17                	je     1646 <printf+0x186>
        while(*s != 0){
    162f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1632:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1634:	84 c0                	test   %al,%al
    1636:	0f 84 d8 fe ff ff    	je     1514 <printf+0x54>
    163c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    163f:	89 de                	mov    %ebx,%esi
    1641:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1644:	eb 1a                	jmp    1660 <printf+0x1a0>
          s = "(null)";
    1646:	bb b8 18 00 00       	mov    $0x18b8,%ebx
        while(*s != 0){
    164b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    164e:	b8 28 00 00 00       	mov    $0x28,%eax
    1653:	89 de                	mov    %ebx,%esi
    1655:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1658:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    165f:	90                   	nop
  write(fd, &c, 1);
    1660:	83 ec 04             	sub    $0x4,%esp
          s++;
    1663:	83 c6 01             	add    $0x1,%esi
    1666:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1669:	6a 01                	push   $0x1
    166b:	57                   	push   %edi
    166c:	53                   	push   %ebx
    166d:	e8 01 fd ff ff       	call   1373 <write>
        while(*s != 0){
    1672:	0f b6 06             	movzbl (%esi),%eax
    1675:	83 c4 10             	add    $0x10,%esp
    1678:	84 c0                	test   %al,%al
    167a:	75 e4                	jne    1660 <printf+0x1a0>
    167c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    167f:	31 d2                	xor    %edx,%edx
    1681:	e9 8e fe ff ff       	jmp    1514 <printf+0x54>
    1686:	66 90                	xchg   %ax,%ax
    1688:	66 90                	xchg   %ax,%ax
    168a:	66 90                	xchg   %ax,%ax
    168c:	66 90                	xchg   %ax,%ax
    168e:	66 90                	xchg   %ax,%ax

00001690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1690:	f3 0f 1e fb          	endbr32 
    1694:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1695:	a1 b4 1b 00 00       	mov    0x1bb4,%eax
{
    169a:	89 e5                	mov    %esp,%ebp
    169c:	57                   	push   %edi
    169d:	56                   	push   %esi
    169e:	53                   	push   %ebx
    169f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16a2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    16a4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16a7:	39 c8                	cmp    %ecx,%eax
    16a9:	73 15                	jae    16c0 <free+0x30>
    16ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16af:	90                   	nop
    16b0:	39 d1                	cmp    %edx,%ecx
    16b2:	72 14                	jb     16c8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16b4:	39 d0                	cmp    %edx,%eax
    16b6:	73 10                	jae    16c8 <free+0x38>
{
    16b8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16ba:	8b 10                	mov    (%eax),%edx
    16bc:	39 c8                	cmp    %ecx,%eax
    16be:	72 f0                	jb     16b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    16c0:	39 d0                	cmp    %edx,%eax
    16c2:	72 f4                	jb     16b8 <free+0x28>
    16c4:	39 d1                	cmp    %edx,%ecx
    16c6:	73 f0                	jae    16b8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    16c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    16cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    16ce:	39 fa                	cmp    %edi,%edx
    16d0:	74 1e                	je     16f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    16d2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16d5:	8b 50 04             	mov    0x4(%eax),%edx
    16d8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    16db:	39 f1                	cmp    %esi,%ecx
    16dd:	74 28                	je     1707 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    16df:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    16e1:	5b                   	pop    %ebx
  freep = p;
    16e2:	a3 b4 1b 00 00       	mov    %eax,0x1bb4
}
    16e7:	5e                   	pop    %esi
    16e8:	5f                   	pop    %edi
    16e9:	5d                   	pop    %ebp
    16ea:	c3                   	ret    
    16eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16ef:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    16f0:	03 72 04             	add    0x4(%edx),%esi
    16f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    16f6:	8b 10                	mov    (%eax),%edx
    16f8:	8b 12                	mov    (%edx),%edx
    16fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    16fd:	8b 50 04             	mov    0x4(%eax),%edx
    1700:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1703:	39 f1                	cmp    %esi,%ecx
    1705:	75 d8                	jne    16df <free+0x4f>
    p->s.size += bp->s.size;
    1707:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    170a:	a3 b4 1b 00 00       	mov    %eax,0x1bb4
    p->s.size += bp->s.size;
    170f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1712:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1715:	89 10                	mov    %edx,(%eax)
}
    1717:	5b                   	pop    %ebx
    1718:	5e                   	pop    %esi
    1719:	5f                   	pop    %edi
    171a:	5d                   	pop    %ebp
    171b:	c3                   	ret    
    171c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1720:	f3 0f 1e fb          	endbr32 
    1724:	55                   	push   %ebp
    1725:	89 e5                	mov    %esp,%ebp
    1727:	57                   	push   %edi
    1728:	56                   	push   %esi
    1729:	53                   	push   %ebx
    172a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    172d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1730:	8b 3d b4 1b 00 00    	mov    0x1bb4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1736:	8d 70 07             	lea    0x7(%eax),%esi
    1739:	c1 ee 03             	shr    $0x3,%esi
    173c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    173f:	85 ff                	test   %edi,%edi
    1741:	0f 84 a9 00 00 00    	je     17f0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1747:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1749:	8b 48 04             	mov    0x4(%eax),%ecx
    174c:	39 f1                	cmp    %esi,%ecx
    174e:	73 6d                	jae    17bd <malloc+0x9d>
    1750:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    1756:	bb 00 10 00 00       	mov    $0x1000,%ebx
    175b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    175e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1765:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1768:	eb 17                	jmp    1781 <malloc+0x61>
    176a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1770:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1772:	8b 4a 04             	mov    0x4(%edx),%ecx
    1775:	39 f1                	cmp    %esi,%ecx
    1777:	73 4f                	jae    17c8 <malloc+0xa8>
    1779:	8b 3d b4 1b 00 00    	mov    0x1bb4,%edi
    177f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1781:	39 c7                	cmp    %eax,%edi
    1783:	75 eb                	jne    1770 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1785:	83 ec 0c             	sub    $0xc,%esp
    1788:	ff 75 e4             	pushl  -0x1c(%ebp)
    178b:	e8 4b fc ff ff       	call   13db <sbrk>
  if(p == (char*)-1)
    1790:	83 c4 10             	add    $0x10,%esp
    1793:	83 f8 ff             	cmp    $0xffffffff,%eax
    1796:	74 1b                	je     17b3 <malloc+0x93>
  hp->s.size = nu;
    1798:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    179b:	83 ec 0c             	sub    $0xc,%esp
    179e:	83 c0 08             	add    $0x8,%eax
    17a1:	50                   	push   %eax
    17a2:	e8 e9 fe ff ff       	call   1690 <free>
  return freep;
    17a7:	a1 b4 1b 00 00       	mov    0x1bb4,%eax
      if((p = morecore(nunits)) == 0)
    17ac:	83 c4 10             	add    $0x10,%esp
    17af:	85 c0                	test   %eax,%eax
    17b1:	75 bd                	jne    1770 <malloc+0x50>
        return 0;
  }
}
    17b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    17b6:	31 c0                	xor    %eax,%eax
}
    17b8:	5b                   	pop    %ebx
    17b9:	5e                   	pop    %esi
    17ba:	5f                   	pop    %edi
    17bb:	5d                   	pop    %ebp
    17bc:	c3                   	ret    
    if(p->s.size >= nunits){
    17bd:	89 c2                	mov    %eax,%edx
    17bf:	89 f8                	mov    %edi,%eax
    17c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    17c8:	39 ce                	cmp    %ecx,%esi
    17ca:	74 54                	je     1820 <malloc+0x100>
        p->s.size -= nunits;
    17cc:	29 f1                	sub    %esi,%ecx
    17ce:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    17d1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    17d4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    17d7:	a3 b4 1b 00 00       	mov    %eax,0x1bb4
}
    17dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    17df:	8d 42 08             	lea    0x8(%edx),%eax
}
    17e2:	5b                   	pop    %ebx
    17e3:	5e                   	pop    %esi
    17e4:	5f                   	pop    %edi
    17e5:	5d                   	pop    %ebp
    17e6:	c3                   	ret    
    17e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17ee:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    17f0:	c7 05 b4 1b 00 00 b8 	movl   $0x1bb8,0x1bb4
    17f7:	1b 00 00 
    base.s.size = 0;
    17fa:	bf b8 1b 00 00       	mov    $0x1bb8,%edi
    base.s.ptr = freep = prevp = &base;
    17ff:	c7 05 b8 1b 00 00 b8 	movl   $0x1bb8,0x1bb8
    1806:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1809:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    180b:	c7 05 bc 1b 00 00 00 	movl   $0x0,0x1bbc
    1812:	00 00 00 
    if(p->s.size >= nunits){
    1815:	e9 36 ff ff ff       	jmp    1750 <malloc+0x30>
    181a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1820:	8b 0a                	mov    (%edx),%ecx
    1822:	89 08                	mov    %ecx,(%eax)
    1824:	eb b1                	jmp    17d7 <malloc+0xb7>
    1826:	66 90                	xchg   %ax,%ax
    1828:	66 90                	xchg   %ax,%ax
    182a:	66 90                	xchg   %ax,%ax
    182c:	66 90                	xchg   %ax,%ax
    182e:	66 90                	xchg   %ax,%ax

00001830 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1830:	f3 0f 1e fb          	endbr32 
    1834:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1835:	b9 01 00 00 00       	mov    $0x1,%ecx
    183a:	89 e5                	mov    %esp,%ebp
    183c:	8b 55 08             	mov    0x8(%ebp),%edx
    183f:	90                   	nop
    1840:	89 c8                	mov    %ecx,%eax
    1842:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1845:	85 c0                	test   %eax,%eax
    1847:	75 f7                	jne    1840 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1849:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    184e:	5d                   	pop    %ebp
    184f:	c3                   	ret    

00001850 <urelease>:

void urelease (struct uspinlock *lk) {
    1850:	f3 0f 1e fb          	endbr32 
    1854:	55                   	push   %ebp
    1855:	89 e5                	mov    %esp,%ebp
    1857:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    185a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    185f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1865:	5d                   	pop    %ebp
    1866:	c3                   	ret    
