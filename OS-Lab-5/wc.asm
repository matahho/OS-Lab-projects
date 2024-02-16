
_wc:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	57                   	push   %edi
    1012:	56                   	push   %esi
    1013:	be 01 00 00 00       	mov    $0x1,%esi
    1018:	53                   	push   %ebx
    1019:	51                   	push   %ecx
    101a:	83 ec 18             	sub    $0x18,%esp
    101d:	8b 01                	mov    (%ecx),%eax
    101f:	8b 59 04             	mov    0x4(%ecx),%ebx
    1022:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1025:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
    1028:	83 f8 01             	cmp    $0x1,%eax
    102b:	7e 52                	jle    107f <main+0x7f>
    102d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	6a 00                	push   $0x0
    1035:	ff 33                	pushl  (%ebx)
    1037:	e8 f7 03 00 00       	call   1433 <open>
    103c:	83 c4 10             	add    $0x10,%esp
    103f:	89 c7                	mov    %eax,%edi
    1041:	85 c0                	test   %eax,%eax
    1043:	78 26                	js     106b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
    1045:	83 ec 08             	sub    $0x8,%esp
    1048:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
    104a:	83 c6 01             	add    $0x1,%esi
    104d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
    1050:	50                   	push   %eax
    1051:	e8 4a 00 00 00       	call   10a0 <wc>
    close(fd);
    1056:	89 3c 24             	mov    %edi,(%esp)
    1059:	e8 bd 03 00 00       	call   141b <close>
  for(i = 1; i < argc; i++){
    105e:	83 c4 10             	add    $0x10,%esp
    1061:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
    1064:	75 ca                	jne    1030 <main+0x30>
  }
  exit();
    1066:	e8 88 03 00 00       	call   13f3 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
    106b:	50                   	push   %eax
    106c:	ff 33                	pushl  (%ebx)
    106e:	68 2b 19 00 00       	push   $0x192b
    1073:	6a 01                	push   $0x1
    1075:	e8 e6 04 00 00       	call   1560 <printf>
      exit();
    107a:	e8 74 03 00 00       	call   13f3 <exit>
    wc(0, "");
    107f:	52                   	push   %edx
    1080:	52                   	push   %edx
    1081:	68 1d 19 00 00       	push   $0x191d
    1086:	6a 00                	push   $0x0
    1088:	e8 13 00 00 00       	call   10a0 <wc>
    exit();
    108d:	e8 61 03 00 00       	call   13f3 <exit>
    1092:	66 90                	xchg   %ax,%ax
    1094:	66 90                	xchg   %ax,%ax
    1096:	66 90                	xchg   %ax,%ax
    1098:	66 90                	xchg   %ax,%ax
    109a:	66 90                	xchg   %ax,%ax
    109c:	66 90                	xchg   %ax,%ax
    109e:	66 90                	xchg   %ax,%ax

000010a0 <wc>:
{
    10a0:	f3 0f 1e fb          	endbr32 
    10a4:	55                   	push   %ebp
    10a5:	89 e5                	mov    %esp,%ebp
    10a7:	57                   	push   %edi
    10a8:	56                   	push   %esi
    10a9:	53                   	push   %ebx
  l = w = c = 0;
    10aa:	31 db                	xor    %ebx,%ebx
{
    10ac:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
    10af:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
    10b6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    10bd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    10c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
    10c8:	83 ec 04             	sub    $0x4,%esp
    10cb:	68 00 02 00 00       	push   $0x200
    10d0:	68 a0 1c 00 00       	push   $0x1ca0
    10d5:	ff 75 08             	pushl  0x8(%ebp)
    10d8:	e8 2e 03 00 00       	call   140b <read>
    10dd:	83 c4 10             	add    $0x10,%esp
    10e0:	89 c6                	mov    %eax,%esi
    10e2:	85 c0                	test   %eax,%eax
    10e4:	7e 62                	jle    1148 <wc+0xa8>
    for(i=0; i<n; i++){
    10e6:	31 ff                	xor    %edi,%edi
    10e8:	eb 14                	jmp    10fe <wc+0x5e>
    10ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
    10f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
    10f7:	83 c7 01             	add    $0x1,%edi
    10fa:	39 fe                	cmp    %edi,%esi
    10fc:	74 42                	je     1140 <wc+0xa0>
      if(buf[i] == '\n')
    10fe:	0f be 87 a0 1c 00 00 	movsbl 0x1ca0(%edi),%eax
        l++;
    1105:	31 c9                	xor    %ecx,%ecx
    1107:	3c 0a                	cmp    $0xa,%al
    1109:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
    110c:	83 ec 08             	sub    $0x8,%esp
    110f:	50                   	push   %eax
        l++;
    1110:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
    1112:	68 08 19 00 00       	push   $0x1908
    1117:	e8 54 01 00 00       	call   1270 <strchr>
    111c:	83 c4 10             	add    $0x10,%esp
    111f:	85 c0                	test   %eax,%eax
    1121:	75 cd                	jne    10f0 <wc+0x50>
      else if(!inword){
    1123:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1126:	85 d2                	test   %edx,%edx
    1128:	75 cd                	jne    10f7 <wc+0x57>
    for(i=0; i<n; i++){
    112a:	83 c7 01             	add    $0x1,%edi
        w++;
    112d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
    1131:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
    1138:	39 fe                	cmp    %edi,%esi
    113a:	75 c2                	jne    10fe <wc+0x5e>
    113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1140:	01 75 dc             	add    %esi,-0x24(%ebp)
    1143:	eb 83                	jmp    10c8 <wc+0x28>
    1145:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
    1148:	75 24                	jne    116e <wc+0xce>
  printf(1, "%d %d %d %s\n", l, w, c, name);
    114a:	83 ec 08             	sub    $0x8,%esp
    114d:	ff 75 0c             	pushl  0xc(%ebp)
    1150:	ff 75 dc             	pushl  -0x24(%ebp)
    1153:	ff 75 e0             	pushl  -0x20(%ebp)
    1156:	53                   	push   %ebx
    1157:	68 1e 19 00 00       	push   $0x191e
    115c:	6a 01                	push   $0x1
    115e:	e8 fd 03 00 00       	call   1560 <printf>
}
    1163:	83 c4 20             	add    $0x20,%esp
    1166:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1169:	5b                   	pop    %ebx
    116a:	5e                   	pop    %esi
    116b:	5f                   	pop    %edi
    116c:	5d                   	pop    %ebp
    116d:	c3                   	ret    
    printf(1, "wc: read error\n");
    116e:	50                   	push   %eax
    116f:	50                   	push   %eax
    1170:	68 0e 19 00 00       	push   $0x190e
    1175:	6a 01                	push   $0x1
    1177:	e8 e4 03 00 00       	call   1560 <printf>
    exit();
    117c:	e8 72 02 00 00       	call   13f3 <exit>
    1181:	66 90                	xchg   %ax,%ax
    1183:	66 90                	xchg   %ax,%ax
    1185:	66 90                	xchg   %ax,%ax
    1187:	66 90                	xchg   %ax,%ax
    1189:	66 90                	xchg   %ax,%ax
    118b:	66 90                	xchg   %ax,%ax
    118d:	66 90                	xchg   %ax,%ax
    118f:	90                   	nop

00001190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1190:	f3 0f 1e fb          	endbr32 
    1194:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1195:	31 c0                	xor    %eax,%eax
{
    1197:	89 e5                	mov    %esp,%ebp
    1199:	53                   	push   %ebx
    119a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    119d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    11a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    11a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    11a7:	83 c0 01             	add    $0x1,%eax
    11aa:	84 d2                	test   %dl,%dl
    11ac:	75 f2                	jne    11a0 <strcpy+0x10>
    ;
  return os;
}
    11ae:	89 c8                	mov    %ecx,%eax
    11b0:	5b                   	pop    %ebx
    11b1:	5d                   	pop    %ebp
    11b2:	c3                   	ret    
    11b3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000011c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    11c0:	f3 0f 1e fb          	endbr32 
    11c4:	55                   	push   %ebp
    11c5:	89 e5                	mov    %esp,%ebp
    11c7:	53                   	push   %ebx
    11c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    11cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    11ce:	0f b6 01             	movzbl (%ecx),%eax
    11d1:	0f b6 1a             	movzbl (%edx),%ebx
    11d4:	84 c0                	test   %al,%al
    11d6:	75 19                	jne    11f1 <strcmp+0x31>
    11d8:	eb 26                	jmp    1200 <strcmp+0x40>
    11da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    11e0:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    11e4:	83 c1 01             	add    $0x1,%ecx
    11e7:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    11ea:	0f b6 1a             	movzbl (%edx),%ebx
    11ed:	84 c0                	test   %al,%al
    11ef:	74 0f                	je     1200 <strcmp+0x40>
    11f1:	38 d8                	cmp    %bl,%al
    11f3:	74 eb                	je     11e0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    11f5:	29 d8                	sub    %ebx,%eax
}
    11f7:	5b                   	pop    %ebx
    11f8:	5d                   	pop    %ebp
    11f9:	c3                   	ret    
    11fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1200:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1202:	29 d8                	sub    %ebx,%eax
}
    1204:	5b                   	pop    %ebx
    1205:	5d                   	pop    %ebp
    1206:	c3                   	ret    
    1207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    120e:	66 90                	xchg   %ax,%ax

00001210 <strlen>:

uint
strlen(char *s)
{
    1210:	f3 0f 1e fb          	endbr32 
    1214:	55                   	push   %ebp
    1215:	89 e5                	mov    %esp,%ebp
    1217:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    121a:	80 3a 00             	cmpb   $0x0,(%edx)
    121d:	74 21                	je     1240 <strlen+0x30>
    121f:	31 c0                	xor    %eax,%eax
    1221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1228:	83 c0 01             	add    $0x1,%eax
    122b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    122f:	89 c1                	mov    %eax,%ecx
    1231:	75 f5                	jne    1228 <strlen+0x18>
    ;
  return n;
}
    1233:	89 c8                	mov    %ecx,%eax
    1235:	5d                   	pop    %ebp
    1236:	c3                   	ret    
    1237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    123e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    1240:	31 c9                	xor    %ecx,%ecx
}
    1242:	5d                   	pop    %ebp
    1243:	89 c8                	mov    %ecx,%eax
    1245:	c3                   	ret    
    1246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    124d:	8d 76 00             	lea    0x0(%esi),%esi

00001250 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1250:	f3 0f 1e fb          	endbr32 
    1254:	55                   	push   %ebp
    1255:	89 e5                	mov    %esp,%ebp
    1257:	57                   	push   %edi
    1258:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    125b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    125e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1261:	89 d7                	mov    %edx,%edi
    1263:	fc                   	cld    
    1264:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1266:	89 d0                	mov    %edx,%eax
    1268:	5f                   	pop    %edi
    1269:	5d                   	pop    %ebp
    126a:	c3                   	ret    
    126b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    126f:	90                   	nop

00001270 <strchr>:

char*
strchr(const char *s, char c)
{
    1270:	f3 0f 1e fb          	endbr32 
    1274:	55                   	push   %ebp
    1275:	89 e5                	mov    %esp,%ebp
    1277:	8b 45 08             	mov    0x8(%ebp),%eax
    127a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    127e:	0f b6 10             	movzbl (%eax),%edx
    1281:	84 d2                	test   %dl,%dl
    1283:	75 16                	jne    129b <strchr+0x2b>
    1285:	eb 21                	jmp    12a8 <strchr+0x38>
    1287:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    128e:	66 90                	xchg   %ax,%ax
    1290:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1294:	83 c0 01             	add    $0x1,%eax
    1297:	84 d2                	test   %dl,%dl
    1299:	74 0d                	je     12a8 <strchr+0x38>
    if(*s == c)
    129b:	38 d1                	cmp    %dl,%cl
    129d:	75 f1                	jne    1290 <strchr+0x20>
      return (char*)s;
  return 0;
}
    129f:	5d                   	pop    %ebp
    12a0:	c3                   	ret    
    12a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    12a8:	31 c0                	xor    %eax,%eax
}
    12aa:	5d                   	pop    %ebp
    12ab:	c3                   	ret    
    12ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000012b0 <gets>:

char*
gets(char *buf, int max)
{
    12b0:	f3 0f 1e fb          	endbr32 
    12b4:	55                   	push   %ebp
    12b5:	89 e5                	mov    %esp,%ebp
    12b7:	57                   	push   %edi
    12b8:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    12b9:	31 f6                	xor    %esi,%esi
{
    12bb:	53                   	push   %ebx
    12bc:	89 f3                	mov    %esi,%ebx
    12be:	83 ec 1c             	sub    $0x1c,%esp
    12c1:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    12c4:	eb 33                	jmp    12f9 <gets+0x49>
    12c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12cd:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    12d0:	83 ec 04             	sub    $0x4,%esp
    12d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
    12d6:	6a 01                	push   $0x1
    12d8:	50                   	push   %eax
    12d9:	6a 00                	push   $0x0
    12db:	e8 2b 01 00 00       	call   140b <read>
    if(cc < 1)
    12e0:	83 c4 10             	add    $0x10,%esp
    12e3:	85 c0                	test   %eax,%eax
    12e5:	7e 1c                	jle    1303 <gets+0x53>
      break;
    buf[i++] = c;
    12e7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    12eb:	83 c7 01             	add    $0x1,%edi
    12ee:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    12f1:	3c 0a                	cmp    $0xa,%al
    12f3:	74 23                	je     1318 <gets+0x68>
    12f5:	3c 0d                	cmp    $0xd,%al
    12f7:	74 1f                	je     1318 <gets+0x68>
  for(i=0; i+1 < max; ){
    12f9:	83 c3 01             	add    $0x1,%ebx
    12fc:	89 fe                	mov    %edi,%esi
    12fe:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1301:	7c cd                	jl     12d0 <gets+0x20>
    1303:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1305:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1308:	c6 03 00             	movb   $0x0,(%ebx)
}
    130b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    130e:	5b                   	pop    %ebx
    130f:	5e                   	pop    %esi
    1310:	5f                   	pop    %edi
    1311:	5d                   	pop    %ebp
    1312:	c3                   	ret    
    1313:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1317:	90                   	nop
    1318:	8b 75 08             	mov    0x8(%ebp),%esi
    131b:	8b 45 08             	mov    0x8(%ebp),%eax
    131e:	01 de                	add    %ebx,%esi
    1320:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1322:	c6 03 00             	movb   $0x0,(%ebx)
}
    1325:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1328:	5b                   	pop    %ebx
    1329:	5e                   	pop    %esi
    132a:	5f                   	pop    %edi
    132b:	5d                   	pop    %ebp
    132c:	c3                   	ret    
    132d:	8d 76 00             	lea    0x0(%esi),%esi

00001330 <stat>:

int
stat(char *n, struct stat *st)
{
    1330:	f3 0f 1e fb          	endbr32 
    1334:	55                   	push   %ebp
    1335:	89 e5                	mov    %esp,%ebp
    1337:	56                   	push   %esi
    1338:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1339:	83 ec 08             	sub    $0x8,%esp
    133c:	6a 00                	push   $0x0
    133e:	ff 75 08             	pushl  0x8(%ebp)
    1341:	e8 ed 00 00 00       	call   1433 <open>
  if(fd < 0)
    1346:	83 c4 10             	add    $0x10,%esp
    1349:	85 c0                	test   %eax,%eax
    134b:	78 2b                	js     1378 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    134d:	83 ec 08             	sub    $0x8,%esp
    1350:	ff 75 0c             	pushl  0xc(%ebp)
    1353:	89 c3                	mov    %eax,%ebx
    1355:	50                   	push   %eax
    1356:	e8 f0 00 00 00       	call   144b <fstat>
  close(fd);
    135b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    135e:	89 c6                	mov    %eax,%esi
  close(fd);
    1360:	e8 b6 00 00 00       	call   141b <close>
  return r;
    1365:	83 c4 10             	add    $0x10,%esp
}
    1368:	8d 65 f8             	lea    -0x8(%ebp),%esp
    136b:	89 f0                	mov    %esi,%eax
    136d:	5b                   	pop    %ebx
    136e:	5e                   	pop    %esi
    136f:	5d                   	pop    %ebp
    1370:	c3                   	ret    
    1371:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1378:	be ff ff ff ff       	mov    $0xffffffff,%esi
    137d:	eb e9                	jmp    1368 <stat+0x38>
    137f:	90                   	nop

00001380 <atoi>:

int
atoi(const char *s)
{
    1380:	f3 0f 1e fb          	endbr32 
    1384:	55                   	push   %ebp
    1385:	89 e5                	mov    %esp,%ebp
    1387:	53                   	push   %ebx
    1388:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    138b:	0f be 02             	movsbl (%edx),%eax
    138e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1391:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1394:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1399:	77 1a                	ja     13b5 <atoi+0x35>
    139b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    139f:	90                   	nop
    n = n*10 + *s++ - '0';
    13a0:	83 c2 01             	add    $0x1,%edx
    13a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    13a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    13aa:	0f be 02             	movsbl (%edx),%eax
    13ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
    13b0:	80 fb 09             	cmp    $0x9,%bl
    13b3:	76 eb                	jbe    13a0 <atoi+0x20>
  return n;
}
    13b5:	89 c8                	mov    %ecx,%eax
    13b7:	5b                   	pop    %ebx
    13b8:	5d                   	pop    %ebp
    13b9:	c3                   	ret    
    13ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013c0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    13c0:	f3 0f 1e fb          	endbr32 
    13c4:	55                   	push   %ebp
    13c5:	89 e5                	mov    %esp,%ebp
    13c7:	57                   	push   %edi
    13c8:	8b 45 10             	mov    0x10(%ebp),%eax
    13cb:	8b 55 08             	mov    0x8(%ebp),%edx
    13ce:	56                   	push   %esi
    13cf:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    13d2:	85 c0                	test   %eax,%eax
    13d4:	7e 0f                	jle    13e5 <memmove+0x25>
    13d6:	01 d0                	add    %edx,%eax
  dst = vdst;
    13d8:	89 d7                	mov    %edx,%edi
    13da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    13e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    13e1:	39 f8                	cmp    %edi,%eax
    13e3:	75 fb                	jne    13e0 <memmove+0x20>
  return vdst;
}
    13e5:	5e                   	pop    %esi
    13e6:	89 d0                	mov    %edx,%eax
    13e8:	5f                   	pop    %edi
    13e9:	5d                   	pop    %ebp
    13ea:	c3                   	ret    

000013eb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    13eb:	b8 01 00 00 00       	mov    $0x1,%eax
    13f0:	cd 40                	int    $0x40
    13f2:	c3                   	ret    

000013f3 <exit>:
SYSCALL(exit)
    13f3:	b8 02 00 00 00       	mov    $0x2,%eax
    13f8:	cd 40                	int    $0x40
    13fa:	c3                   	ret    

000013fb <wait>:
SYSCALL(wait)
    13fb:	b8 03 00 00 00       	mov    $0x3,%eax
    1400:	cd 40                	int    $0x40
    1402:	c3                   	ret    

00001403 <pipe>:
SYSCALL(pipe)
    1403:	b8 04 00 00 00       	mov    $0x4,%eax
    1408:	cd 40                	int    $0x40
    140a:	c3                   	ret    

0000140b <read>:
SYSCALL(read)
    140b:	b8 05 00 00 00       	mov    $0x5,%eax
    1410:	cd 40                	int    $0x40
    1412:	c3                   	ret    

00001413 <write>:
SYSCALL(write)
    1413:	b8 10 00 00 00       	mov    $0x10,%eax
    1418:	cd 40                	int    $0x40
    141a:	c3                   	ret    

0000141b <close>:
SYSCALL(close)
    141b:	b8 15 00 00 00       	mov    $0x15,%eax
    1420:	cd 40                	int    $0x40
    1422:	c3                   	ret    

00001423 <kill>:
SYSCALL(kill)
    1423:	b8 06 00 00 00       	mov    $0x6,%eax
    1428:	cd 40                	int    $0x40
    142a:	c3                   	ret    

0000142b <exec>:
SYSCALL(exec)
    142b:	b8 07 00 00 00       	mov    $0x7,%eax
    1430:	cd 40                	int    $0x40
    1432:	c3                   	ret    

00001433 <open>:
SYSCALL(open)
    1433:	b8 0f 00 00 00       	mov    $0xf,%eax
    1438:	cd 40                	int    $0x40
    143a:	c3                   	ret    

0000143b <mknod>:
SYSCALL(mknod)
    143b:	b8 11 00 00 00       	mov    $0x11,%eax
    1440:	cd 40                	int    $0x40
    1442:	c3                   	ret    

00001443 <unlink>:
SYSCALL(unlink)
    1443:	b8 12 00 00 00       	mov    $0x12,%eax
    1448:	cd 40                	int    $0x40
    144a:	c3                   	ret    

0000144b <fstat>:
SYSCALL(fstat)
    144b:	b8 08 00 00 00       	mov    $0x8,%eax
    1450:	cd 40                	int    $0x40
    1452:	c3                   	ret    

00001453 <link>:
SYSCALL(link)
    1453:	b8 13 00 00 00       	mov    $0x13,%eax
    1458:	cd 40                	int    $0x40
    145a:	c3                   	ret    

0000145b <mkdir>:
SYSCALL(mkdir)
    145b:	b8 14 00 00 00       	mov    $0x14,%eax
    1460:	cd 40                	int    $0x40
    1462:	c3                   	ret    

00001463 <chdir>:
SYSCALL(chdir)
    1463:	b8 09 00 00 00       	mov    $0x9,%eax
    1468:	cd 40                	int    $0x40
    146a:	c3                   	ret    

0000146b <dup>:
SYSCALL(dup)
    146b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1470:	cd 40                	int    $0x40
    1472:	c3                   	ret    

00001473 <getpid>:
SYSCALL(getpid)
    1473:	b8 0b 00 00 00       	mov    $0xb,%eax
    1478:	cd 40                	int    $0x40
    147a:	c3                   	ret    

0000147b <sbrk>:
SYSCALL(sbrk)
    147b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1480:	cd 40                	int    $0x40
    1482:	c3                   	ret    

00001483 <sleep>:
SYSCALL(sleep)
    1483:	b8 0d 00 00 00       	mov    $0xd,%eax
    1488:	cd 40                	int    $0x40
    148a:	c3                   	ret    

0000148b <uptime>:
SYSCALL(uptime)
    148b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1490:	cd 40                	int    $0x40
    1492:	c3                   	ret    

00001493 <shm_open>:
SYSCALL(shm_open)
    1493:	b8 16 00 00 00       	mov    $0x16,%eax
    1498:	cd 40                	int    $0x40
    149a:	c3                   	ret    

0000149b <shm_close>:
SYSCALL(shm_close)	
    149b:	b8 17 00 00 00       	mov    $0x17,%eax
    14a0:	cd 40                	int    $0x40
    14a2:	c3                   	ret    
    14a3:	66 90                	xchg   %ax,%ax
    14a5:	66 90                	xchg   %ax,%ax
    14a7:	66 90                	xchg   %ax,%ax
    14a9:	66 90                	xchg   %ax,%ax
    14ab:	66 90                	xchg   %ax,%ax
    14ad:	66 90                	xchg   %ax,%ax
    14af:	90                   	nop

000014b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    14b0:	55                   	push   %ebp
    14b1:	89 e5                	mov    %esp,%ebp
    14b3:	57                   	push   %edi
    14b4:	56                   	push   %esi
    14b5:	53                   	push   %ebx
    14b6:	83 ec 3c             	sub    $0x3c,%esp
    14b9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    14bc:	89 d1                	mov    %edx,%ecx
{
    14be:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    14c1:	85 d2                	test   %edx,%edx
    14c3:	0f 89 7f 00 00 00    	jns    1548 <printint+0x98>
    14c9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    14cd:	74 79                	je     1548 <printint+0x98>
    neg = 1;
    14cf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    14d6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    14d8:	31 db                	xor    %ebx,%ebx
    14da:	8d 75 d7             	lea    -0x29(%ebp),%esi
    14dd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    14e0:	89 c8                	mov    %ecx,%eax
    14e2:	31 d2                	xor    %edx,%edx
    14e4:	89 cf                	mov    %ecx,%edi
    14e6:	f7 75 c4             	divl   -0x3c(%ebp)
    14e9:	0f b6 92 48 19 00 00 	movzbl 0x1948(%edx),%edx
    14f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    14f3:	89 d8                	mov    %ebx,%eax
    14f5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    14f8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    14fb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    14fe:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1501:	76 dd                	jbe    14e0 <printint+0x30>
  if(neg)
    1503:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1506:	85 c9                	test   %ecx,%ecx
    1508:	74 0c                	je     1516 <printint+0x66>
    buf[i++] = '-';
    150a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    150f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1511:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1516:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1519:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    151d:	eb 07                	jmp    1526 <printint+0x76>
    151f:	90                   	nop
    1520:	0f b6 13             	movzbl (%ebx),%edx
    1523:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1526:	83 ec 04             	sub    $0x4,%esp
    1529:	88 55 d7             	mov    %dl,-0x29(%ebp)
    152c:	6a 01                	push   $0x1
    152e:	56                   	push   %esi
    152f:	57                   	push   %edi
    1530:	e8 de fe ff ff       	call   1413 <write>
  while(--i >= 0)
    1535:	83 c4 10             	add    $0x10,%esp
    1538:	39 de                	cmp    %ebx,%esi
    153a:	75 e4                	jne    1520 <printint+0x70>
    putc(fd, buf[i]);
}
    153c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    153f:	5b                   	pop    %ebx
    1540:	5e                   	pop    %esi
    1541:	5f                   	pop    %edi
    1542:	5d                   	pop    %ebp
    1543:	c3                   	ret    
    1544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1548:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    154f:	eb 87                	jmp    14d8 <printint+0x28>
    1551:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1558:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    155f:	90                   	nop

00001560 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1560:	f3 0f 1e fb          	endbr32 
    1564:	55                   	push   %ebp
    1565:	89 e5                	mov    %esp,%ebp
    1567:	57                   	push   %edi
    1568:	56                   	push   %esi
    1569:	53                   	push   %ebx
    156a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    156d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1570:	0f b6 1e             	movzbl (%esi),%ebx
    1573:	84 db                	test   %bl,%bl
    1575:	0f 84 b4 00 00 00    	je     162f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    157b:	8d 45 10             	lea    0x10(%ebp),%eax
    157e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1581:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1584:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1586:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1589:	eb 33                	jmp    15be <printf+0x5e>
    158b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    158f:	90                   	nop
    1590:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1593:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1598:	83 f8 25             	cmp    $0x25,%eax
    159b:	74 17                	je     15b4 <printf+0x54>
  write(fd, &c, 1);
    159d:	83 ec 04             	sub    $0x4,%esp
    15a0:	88 5d e7             	mov    %bl,-0x19(%ebp)
    15a3:	6a 01                	push   $0x1
    15a5:	57                   	push   %edi
    15a6:	ff 75 08             	pushl  0x8(%ebp)
    15a9:	e8 65 fe ff ff       	call   1413 <write>
    15ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    15b1:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    15b4:	0f b6 1e             	movzbl (%esi),%ebx
    15b7:	83 c6 01             	add    $0x1,%esi
    15ba:	84 db                	test   %bl,%bl
    15bc:	74 71                	je     162f <printf+0xcf>
    c = fmt[i] & 0xff;
    15be:	0f be cb             	movsbl %bl,%ecx
    15c1:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    15c4:	85 d2                	test   %edx,%edx
    15c6:	74 c8                	je     1590 <printf+0x30>
      }
    } else if(state == '%'){
    15c8:	83 fa 25             	cmp    $0x25,%edx
    15cb:	75 e7                	jne    15b4 <printf+0x54>
      if(c == 'd'){
    15cd:	83 f8 64             	cmp    $0x64,%eax
    15d0:	0f 84 9a 00 00 00    	je     1670 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    15d6:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    15dc:	83 f9 70             	cmp    $0x70,%ecx
    15df:	74 5f                	je     1640 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    15e1:	83 f8 73             	cmp    $0x73,%eax
    15e4:	0f 84 d6 00 00 00    	je     16c0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    15ea:	83 f8 63             	cmp    $0x63,%eax
    15ed:	0f 84 8d 00 00 00    	je     1680 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    15f3:	83 f8 25             	cmp    $0x25,%eax
    15f6:	0f 84 b4 00 00 00    	je     16b0 <printf+0x150>
  write(fd, &c, 1);
    15fc:	83 ec 04             	sub    $0x4,%esp
    15ff:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1603:	6a 01                	push   $0x1
    1605:	57                   	push   %edi
    1606:	ff 75 08             	pushl  0x8(%ebp)
    1609:	e8 05 fe ff ff       	call   1413 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    160e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1611:	83 c4 0c             	add    $0xc,%esp
    1614:	6a 01                	push   $0x1
    1616:	83 c6 01             	add    $0x1,%esi
    1619:	57                   	push   %edi
    161a:	ff 75 08             	pushl  0x8(%ebp)
    161d:	e8 f1 fd ff ff       	call   1413 <write>
  for(i = 0; fmt[i]; i++){
    1622:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1626:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1629:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    162b:	84 db                	test   %bl,%bl
    162d:	75 8f                	jne    15be <printf+0x5e>
    }
  }
}
    162f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1632:	5b                   	pop    %ebx
    1633:	5e                   	pop    %esi
    1634:	5f                   	pop    %edi
    1635:	5d                   	pop    %ebp
    1636:	c3                   	ret    
    1637:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    163e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1640:	83 ec 0c             	sub    $0xc,%esp
    1643:	b9 10 00 00 00       	mov    $0x10,%ecx
    1648:	6a 00                	push   $0x0
    164a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    164d:	8b 45 08             	mov    0x8(%ebp),%eax
    1650:	8b 13                	mov    (%ebx),%edx
    1652:	e8 59 fe ff ff       	call   14b0 <printint>
        ap++;
    1657:	89 d8                	mov    %ebx,%eax
    1659:	83 c4 10             	add    $0x10,%esp
      state = 0;
    165c:	31 d2                	xor    %edx,%edx
        ap++;
    165e:	83 c0 04             	add    $0x4,%eax
    1661:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1664:	e9 4b ff ff ff       	jmp    15b4 <printf+0x54>
    1669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1670:	83 ec 0c             	sub    $0xc,%esp
    1673:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1678:	6a 01                	push   $0x1
    167a:	eb ce                	jmp    164a <printf+0xea>
    167c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1680:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1683:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1686:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1688:	6a 01                	push   $0x1
        ap++;
    168a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    168d:	57                   	push   %edi
    168e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1691:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1694:	e8 7a fd ff ff       	call   1413 <write>
        ap++;
    1699:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    169c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    169f:	31 d2                	xor    %edx,%edx
    16a1:	e9 0e ff ff ff       	jmp    15b4 <printf+0x54>
    16a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16ad:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    16b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    16b3:	83 ec 04             	sub    $0x4,%esp
    16b6:	e9 59 ff ff ff       	jmp    1614 <printf+0xb4>
    16bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16bf:	90                   	nop
        s = (char*)*ap;
    16c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    16c3:	8b 18                	mov    (%eax),%ebx
        ap++;
    16c5:	83 c0 04             	add    $0x4,%eax
    16c8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    16cb:	85 db                	test   %ebx,%ebx
    16cd:	74 17                	je     16e6 <printf+0x186>
        while(*s != 0){
    16cf:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    16d2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    16d4:	84 c0                	test   %al,%al
    16d6:	0f 84 d8 fe ff ff    	je     15b4 <printf+0x54>
    16dc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    16df:	89 de                	mov    %ebx,%esi
    16e1:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16e4:	eb 1a                	jmp    1700 <printf+0x1a0>
          s = "(null)";
    16e6:	bb 3f 19 00 00       	mov    $0x193f,%ebx
        while(*s != 0){
    16eb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    16ee:	b8 28 00 00 00       	mov    $0x28,%eax
    16f3:	89 de                	mov    %ebx,%esi
    16f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    16f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    16ff:	90                   	nop
  write(fd, &c, 1);
    1700:	83 ec 04             	sub    $0x4,%esp
          s++;
    1703:	83 c6 01             	add    $0x1,%esi
    1706:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1709:	6a 01                	push   $0x1
    170b:	57                   	push   %edi
    170c:	53                   	push   %ebx
    170d:	e8 01 fd ff ff       	call   1413 <write>
        while(*s != 0){
    1712:	0f b6 06             	movzbl (%esi),%eax
    1715:	83 c4 10             	add    $0x10,%esp
    1718:	84 c0                	test   %al,%al
    171a:	75 e4                	jne    1700 <printf+0x1a0>
    171c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    171f:	31 d2                	xor    %edx,%edx
    1721:	e9 8e fe ff ff       	jmp    15b4 <printf+0x54>
    1726:	66 90                	xchg   %ax,%ax
    1728:	66 90                	xchg   %ax,%ax
    172a:	66 90                	xchg   %ax,%ax
    172c:	66 90                	xchg   %ax,%ax
    172e:	66 90                	xchg   %ax,%ax

00001730 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1730:	f3 0f 1e fb          	endbr32 
    1734:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1735:	a1 80 1c 00 00       	mov    0x1c80,%eax
{
    173a:	89 e5                	mov    %esp,%ebp
    173c:	57                   	push   %edi
    173d:	56                   	push   %esi
    173e:	53                   	push   %ebx
    173f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1742:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    1744:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1747:	39 c8                	cmp    %ecx,%eax
    1749:	73 15                	jae    1760 <free+0x30>
    174b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    174f:	90                   	nop
    1750:	39 d1                	cmp    %edx,%ecx
    1752:	72 14                	jb     1768 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1754:	39 d0                	cmp    %edx,%eax
    1756:	73 10                	jae    1768 <free+0x38>
{
    1758:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    175a:	8b 10                	mov    (%eax),%edx
    175c:	39 c8                	cmp    %ecx,%eax
    175e:	72 f0                	jb     1750 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1760:	39 d0                	cmp    %edx,%eax
    1762:	72 f4                	jb     1758 <free+0x28>
    1764:	39 d1                	cmp    %edx,%ecx
    1766:	73 f0                	jae    1758 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1768:	8b 73 fc             	mov    -0x4(%ebx),%esi
    176b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    176e:	39 fa                	cmp    %edi,%edx
    1770:	74 1e                	je     1790 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1772:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1775:	8b 50 04             	mov    0x4(%eax),%edx
    1778:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    177b:	39 f1                	cmp    %esi,%ecx
    177d:	74 28                	je     17a7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    177f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1781:	5b                   	pop    %ebx
  freep = p;
    1782:	a3 80 1c 00 00       	mov    %eax,0x1c80
}
    1787:	5e                   	pop    %esi
    1788:	5f                   	pop    %edi
    1789:	5d                   	pop    %ebp
    178a:	c3                   	ret    
    178b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    178f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1790:	03 72 04             	add    0x4(%edx),%esi
    1793:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1796:	8b 10                	mov    (%eax),%edx
    1798:	8b 12                	mov    (%edx),%edx
    179a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    179d:	8b 50 04             	mov    0x4(%eax),%edx
    17a0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    17a3:	39 f1                	cmp    %esi,%ecx
    17a5:	75 d8                	jne    177f <free+0x4f>
    p->s.size += bp->s.size;
    17a7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    17aa:	a3 80 1c 00 00       	mov    %eax,0x1c80
    p->s.size += bp->s.size;
    17af:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    17b2:	8b 53 f8             	mov    -0x8(%ebx),%edx
    17b5:	89 10                	mov    %edx,(%eax)
}
    17b7:	5b                   	pop    %ebx
    17b8:	5e                   	pop    %esi
    17b9:	5f                   	pop    %edi
    17ba:	5d                   	pop    %ebp
    17bb:	c3                   	ret    
    17bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000017c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    17c0:	f3 0f 1e fb          	endbr32 
    17c4:	55                   	push   %ebp
    17c5:	89 e5                	mov    %esp,%ebp
    17c7:	57                   	push   %edi
    17c8:	56                   	push   %esi
    17c9:	53                   	push   %ebx
    17ca:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17cd:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    17d0:	8b 3d 80 1c 00 00    	mov    0x1c80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    17d6:	8d 70 07             	lea    0x7(%eax),%esi
    17d9:	c1 ee 03             	shr    $0x3,%esi
    17dc:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    17df:	85 ff                	test   %edi,%edi
    17e1:	0f 84 a9 00 00 00    	je     1890 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    17e7:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    17e9:	8b 48 04             	mov    0x4(%eax),%ecx
    17ec:	39 f1                	cmp    %esi,%ecx
    17ee:	73 6d                	jae    185d <malloc+0x9d>
    17f0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    17f6:	bb 00 10 00 00       	mov    $0x1000,%ebx
    17fb:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    17fe:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    1805:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    1808:	eb 17                	jmp    1821 <malloc+0x61>
    180a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1810:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    1812:	8b 4a 04             	mov    0x4(%edx),%ecx
    1815:	39 f1                	cmp    %esi,%ecx
    1817:	73 4f                	jae    1868 <malloc+0xa8>
    1819:	8b 3d 80 1c 00 00    	mov    0x1c80,%edi
    181f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1821:	39 c7                	cmp    %eax,%edi
    1823:	75 eb                	jne    1810 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    1825:	83 ec 0c             	sub    $0xc,%esp
    1828:	ff 75 e4             	pushl  -0x1c(%ebp)
    182b:	e8 4b fc ff ff       	call   147b <sbrk>
  if(p == (char*)-1)
    1830:	83 c4 10             	add    $0x10,%esp
    1833:	83 f8 ff             	cmp    $0xffffffff,%eax
    1836:	74 1b                	je     1853 <malloc+0x93>
  hp->s.size = nu;
    1838:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    183b:	83 ec 0c             	sub    $0xc,%esp
    183e:	83 c0 08             	add    $0x8,%eax
    1841:	50                   	push   %eax
    1842:	e8 e9 fe ff ff       	call   1730 <free>
  return freep;
    1847:	a1 80 1c 00 00       	mov    0x1c80,%eax
      if((p = morecore(nunits)) == 0)
    184c:	83 c4 10             	add    $0x10,%esp
    184f:	85 c0                	test   %eax,%eax
    1851:	75 bd                	jne    1810 <malloc+0x50>
        return 0;
  }
}
    1853:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1856:	31 c0                	xor    %eax,%eax
}
    1858:	5b                   	pop    %ebx
    1859:	5e                   	pop    %esi
    185a:	5f                   	pop    %edi
    185b:	5d                   	pop    %ebp
    185c:	c3                   	ret    
    if(p->s.size >= nunits){
    185d:	89 c2                	mov    %eax,%edx
    185f:	89 f8                	mov    %edi,%eax
    1861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1868:	39 ce                	cmp    %ecx,%esi
    186a:	74 54                	je     18c0 <malloc+0x100>
        p->s.size -= nunits;
    186c:	29 f1                	sub    %esi,%ecx
    186e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1871:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1874:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1877:	a3 80 1c 00 00       	mov    %eax,0x1c80
}
    187c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    187f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1882:	5b                   	pop    %ebx
    1883:	5e                   	pop    %esi
    1884:	5f                   	pop    %edi
    1885:	5d                   	pop    %ebp
    1886:	c3                   	ret    
    1887:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    188e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1890:	c7 05 80 1c 00 00 84 	movl   $0x1c84,0x1c80
    1897:	1c 00 00 
    base.s.size = 0;
    189a:	bf 84 1c 00 00       	mov    $0x1c84,%edi
    base.s.ptr = freep = prevp = &base;
    189f:	c7 05 84 1c 00 00 84 	movl   $0x1c84,0x1c84
    18a6:	1c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18a9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    18ab:	c7 05 88 1c 00 00 00 	movl   $0x0,0x1c88
    18b2:	00 00 00 
    if(p->s.size >= nunits){
    18b5:	e9 36 ff ff ff       	jmp    17f0 <malloc+0x30>
    18ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    18c0:	8b 0a                	mov    (%edx),%ecx
    18c2:	89 08                	mov    %ecx,(%eax)
    18c4:	eb b1                	jmp    1877 <malloc+0xb7>
    18c6:	66 90                	xchg   %ax,%ax
    18c8:	66 90                	xchg   %ax,%ax
    18ca:	66 90                	xchg   %ax,%ax
    18cc:	66 90                	xchg   %ax,%ax
    18ce:	66 90                	xchg   %ax,%ax

000018d0 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    18d0:	f3 0f 1e fb          	endbr32 
    18d4:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    18d5:	b9 01 00 00 00       	mov    $0x1,%ecx
    18da:	89 e5                	mov    %esp,%ebp
    18dc:	8b 55 08             	mov    0x8(%ebp),%edx
    18df:	90                   	nop
    18e0:	89 c8                	mov    %ecx,%eax
    18e2:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    18e5:	85 c0                	test   %eax,%eax
    18e7:	75 f7                	jne    18e0 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    18e9:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    18ee:	5d                   	pop    %ebp
    18ef:	c3                   	ret    

000018f0 <urelease>:

void urelease (struct uspinlock *lk) {
    18f0:	f3 0f 1e fb          	endbr32 
    18f4:	55                   	push   %ebp
    18f5:	89 e5                	mov    %esp,%ebp
    18f7:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    18fa:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    18ff:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1905:	5d                   	pop    %ebp
    1906:	c3                   	ret    
