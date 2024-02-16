
_ls:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  close(fd);
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
    1011:	56                   	push   %esi
    1012:	53                   	push   %ebx
    1013:	51                   	push   %ecx
    1014:	83 ec 0c             	sub    $0xc,%esp
    1017:	8b 01                	mov    (%ecx),%eax
    1019:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;

  if(argc < 2){
    101c:	83 f8 01             	cmp    $0x1,%eax
    101f:	7e 28                	jle    1049 <main+0x49>
    1021:	8d 5a 04             	lea    0x4(%edx),%ebx
    1024:	8d 34 82             	lea    (%edx,%eax,4),%esi
    1027:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102e:	66 90                	xchg   %ax,%ax
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
    1030:	83 ec 0c             	sub    $0xc,%esp
    1033:	ff 33                	pushl  (%ebx)
    1035:	83 c3 04             	add    $0x4,%ebx
    1038:	e8 c3 00 00 00       	call   1100 <ls>
  for(i=1; i<argc; i++)
    103d:	83 c4 10             	add    $0x10,%esp
    1040:	39 f3                	cmp    %esi,%ebx
    1042:	75 ec                	jne    1030 <main+0x30>
  exit();
    1044:	e8 5a 05 00 00       	call   15a3 <exit>
    ls(".");
    1049:	83 ec 0c             	sub    $0xc,%esp
    104c:	68 00 1b 00 00       	push   $0x1b00
    1051:	e8 aa 00 00 00       	call   1100 <ls>
    exit();
    1056:	e8 48 05 00 00       	call   15a3 <exit>
    105b:	66 90                	xchg   %ax,%ax
    105d:	66 90                	xchg   %ax,%ax
    105f:	90                   	nop

00001060 <fmtname>:
{
    1060:	f3 0f 1e fb          	endbr32 
    1064:	55                   	push   %ebp
    1065:	89 e5                	mov    %esp,%ebp
    1067:	56                   	push   %esi
    1068:	53                   	push   %ebx
    1069:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    106c:	83 ec 0c             	sub    $0xc,%esp
    106f:	56                   	push   %esi
    1070:	e8 4b 03 00 00       	call   13c0 <strlen>
    1075:	83 c4 10             	add    $0x10,%esp
    1078:	01 f0                	add    %esi,%eax
    107a:	89 c3                	mov    %eax,%ebx
    107c:	73 0b                	jae    1089 <fmtname+0x29>
    107e:	eb 0e                	jmp    108e <fmtname+0x2e>
    1080:	8d 43 ff             	lea    -0x1(%ebx),%eax
    1083:	39 c6                	cmp    %eax,%esi
    1085:	77 0a                	ja     1091 <fmtname+0x31>
    1087:	89 c3                	mov    %eax,%ebx
    1089:	80 3b 2f             	cmpb   $0x2f,(%ebx)
    108c:	75 f2                	jne    1080 <fmtname+0x20>
    108e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
    1091:	83 ec 0c             	sub    $0xc,%esp
    1094:	53                   	push   %ebx
    1095:	e8 26 03 00 00       	call   13c0 <strlen>
    109a:	83 c4 10             	add    $0x10,%esp
    109d:	83 f8 0d             	cmp    $0xd,%eax
    10a0:	77 4a                	ja     10ec <fmtname+0x8c>
  memmove(buf, p, strlen(p));
    10a2:	83 ec 0c             	sub    $0xc,%esp
    10a5:	53                   	push   %ebx
    10a6:	e8 15 03 00 00       	call   13c0 <strlen>
    10ab:	83 c4 0c             	add    $0xc,%esp
    10ae:	50                   	push   %eax
    10af:	53                   	push   %ebx
    10b0:	68 74 1e 00 00       	push   $0x1e74
    10b5:	e8 b6 04 00 00       	call   1570 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    10ba:	89 1c 24             	mov    %ebx,(%esp)
    10bd:	e8 fe 02 00 00       	call   13c0 <strlen>
    10c2:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
    10c5:	bb 74 1e 00 00       	mov    $0x1e74,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
    10ca:	89 c6                	mov    %eax,%esi
    10cc:	e8 ef 02 00 00       	call   13c0 <strlen>
    10d1:	ba 0e 00 00 00       	mov    $0xe,%edx
    10d6:	83 c4 0c             	add    $0xc,%esp
    10d9:	29 f2                	sub    %esi,%edx
    10db:	05 74 1e 00 00       	add    $0x1e74,%eax
    10e0:	52                   	push   %edx
    10e1:	6a 20                	push   $0x20
    10e3:	50                   	push   %eax
    10e4:	e8 17 03 00 00       	call   1400 <memset>
  return buf;
    10e9:	83 c4 10             	add    $0x10,%esp
}
    10ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10ef:	89 d8                	mov    %ebx,%eax
    10f1:	5b                   	pop    %ebx
    10f2:	5e                   	pop    %esi
    10f3:	5d                   	pop    %ebp
    10f4:	c3                   	ret    
    10f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001100 <ls>:
{
    1100:	f3 0f 1e fb          	endbr32 
    1104:	55                   	push   %ebp
    1105:	89 e5                	mov    %esp,%ebp
    1107:	57                   	push   %edi
    1108:	56                   	push   %esi
    1109:	53                   	push   %ebx
    110a:	81 ec 64 02 00 00    	sub    $0x264,%esp
    1110:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
    1113:	6a 00                	push   $0x0
    1115:	57                   	push   %edi
    1116:	e8 c8 04 00 00       	call   15e3 <open>
    111b:	83 c4 10             	add    $0x10,%esp
    111e:	85 c0                	test   %eax,%eax
    1120:	0f 88 9a 01 00 00    	js     12c0 <ls+0x1c0>
  if(fstat(fd, &st) < 0){
    1126:	83 ec 08             	sub    $0x8,%esp
    1129:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
    112f:	89 c3                	mov    %eax,%ebx
    1131:	56                   	push   %esi
    1132:	50                   	push   %eax
    1133:	e8 c3 04 00 00       	call   15fb <fstat>
    1138:	83 c4 10             	add    $0x10,%esp
    113b:	85 c0                	test   %eax,%eax
    113d:	0f 88 bd 01 00 00    	js     1300 <ls+0x200>
  switch(st.type){
    1143:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
    114a:	66 83 f8 01          	cmp    $0x1,%ax
    114e:	74 60                	je     11b0 <ls+0xb0>
    1150:	66 83 f8 02          	cmp    $0x2,%ax
    1154:	74 1a                	je     1170 <ls+0x70>
  close(fd);
    1156:	83 ec 0c             	sub    $0xc,%esp
    1159:	53                   	push   %ebx
    115a:	e8 6c 04 00 00       	call   15cb <close>
    115f:	83 c4 10             	add    $0x10,%esp
}
    1162:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1165:	5b                   	pop    %ebx
    1166:	5e                   	pop    %esi
    1167:	5f                   	pop    %edi
    1168:	5d                   	pop    %ebp
    1169:	c3                   	ret    
    116a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    1170:	83 ec 0c             	sub    $0xc,%esp
    1173:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
    1179:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
    117f:	57                   	push   %edi
    1180:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
    1186:	e8 d5 fe ff ff       	call   1060 <fmtname>
    118b:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
    1191:	59                   	pop    %ecx
    1192:	5f                   	pop    %edi
    1193:	52                   	push   %edx
    1194:	56                   	push   %esi
    1195:	6a 02                	push   $0x2
    1197:	50                   	push   %eax
    1198:	68 e0 1a 00 00       	push   $0x1ae0
    119d:	6a 01                	push   $0x1
    119f:	e8 6c 05 00 00       	call   1710 <printf>
    break;
    11a4:	83 c4 20             	add    $0x20,%esp
    11a7:	eb ad                	jmp    1156 <ls+0x56>
    11a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
    11b0:	83 ec 0c             	sub    $0xc,%esp
    11b3:	57                   	push   %edi
    11b4:	e8 07 02 00 00       	call   13c0 <strlen>
    11b9:	83 c4 10             	add    $0x10,%esp
    11bc:	83 c0 10             	add    $0x10,%eax
    11bf:	3d 00 02 00 00       	cmp    $0x200,%eax
    11c4:	0f 87 16 01 00 00    	ja     12e0 <ls+0x1e0>
    strcpy(buf, path);
    11ca:	83 ec 08             	sub    $0x8,%esp
    11cd:	57                   	push   %edi
    11ce:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
    11d4:	57                   	push   %edi
    11d5:	e8 66 01 00 00       	call   1340 <strcpy>
    p = buf+strlen(buf);
    11da:	89 3c 24             	mov    %edi,(%esp)
    11dd:	e8 de 01 00 00       	call   13c0 <strlen>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    11e2:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
    11e5:	01 f8                	add    %edi,%eax
    *p++ = '/';
    11e7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
    11ea:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
    *p++ = '/';
    11f0:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
    11f6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
    11f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1200:	83 ec 04             	sub    $0x4,%esp
    1203:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
    1209:	6a 10                	push   $0x10
    120b:	50                   	push   %eax
    120c:	53                   	push   %ebx
    120d:	e8 a9 03 00 00       	call   15bb <read>
    1212:	83 c4 10             	add    $0x10,%esp
    1215:	83 f8 10             	cmp    $0x10,%eax
    1218:	0f 85 38 ff ff ff    	jne    1156 <ls+0x56>
      if(de.inum == 0)
    121e:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
    1225:	00 
    1226:	74 d8                	je     1200 <ls+0x100>
      memmove(p, de.name, DIRSIZ);
    1228:	83 ec 04             	sub    $0x4,%esp
    122b:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
    1231:	6a 0e                	push   $0xe
    1233:	50                   	push   %eax
    1234:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
    123a:	e8 31 03 00 00       	call   1570 <memmove>
      p[DIRSIZ] = 0;
    123f:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
    1245:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
    1249:	58                   	pop    %eax
    124a:	5a                   	pop    %edx
    124b:	56                   	push   %esi
    124c:	57                   	push   %edi
    124d:	e8 8e 02 00 00       	call   14e0 <stat>
    1252:	83 c4 10             	add    $0x10,%esp
    1255:	85 c0                	test   %eax,%eax
    1257:	0f 88 cb 00 00 00    	js     1328 <ls+0x228>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    125d:	83 ec 0c             	sub    $0xc,%esp
    1260:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
    1266:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
    126c:	57                   	push   %edi
    126d:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
    1274:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
    127a:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
    1280:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
    1286:	e8 d5 fd ff ff       	call   1060 <fmtname>
    128b:	5a                   	pop    %edx
    128c:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
    1292:	59                   	pop    %ecx
    1293:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
    1299:	51                   	push   %ecx
    129a:	52                   	push   %edx
    129b:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
    12a1:	50                   	push   %eax
    12a2:	68 e0 1a 00 00       	push   $0x1ae0
    12a7:	6a 01                	push   $0x1
    12a9:	e8 62 04 00 00       	call   1710 <printf>
    12ae:	83 c4 20             	add    $0x20,%esp
    12b1:	e9 4a ff ff ff       	jmp    1200 <ls+0x100>
    12b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12bd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(2, "ls: cannot open %s\n", path);
    12c0:	83 ec 04             	sub    $0x4,%esp
    12c3:	57                   	push   %edi
    12c4:	68 b8 1a 00 00       	push   $0x1ab8
    12c9:	6a 02                	push   $0x2
    12cb:	e8 40 04 00 00       	call   1710 <printf>
    return;
    12d0:	83 c4 10             	add    $0x10,%esp
}
    12d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12d6:	5b                   	pop    %ebx
    12d7:	5e                   	pop    %esi
    12d8:	5f                   	pop    %edi
    12d9:	5d                   	pop    %ebp
    12da:	c3                   	ret    
    12db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12df:	90                   	nop
      printf(1, "ls: path too long\n");
    12e0:	83 ec 08             	sub    $0x8,%esp
    12e3:	68 ed 1a 00 00       	push   $0x1aed
    12e8:	6a 01                	push   $0x1
    12ea:	e8 21 04 00 00       	call   1710 <printf>
      break;
    12ef:	83 c4 10             	add    $0x10,%esp
    12f2:	e9 5f fe ff ff       	jmp    1156 <ls+0x56>
    12f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    12fe:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot stat %s\n", path);
    1300:	83 ec 04             	sub    $0x4,%esp
    1303:	57                   	push   %edi
    1304:	68 cc 1a 00 00       	push   $0x1acc
    1309:	6a 02                	push   $0x2
    130b:	e8 00 04 00 00       	call   1710 <printf>
    close(fd);
    1310:	89 1c 24             	mov    %ebx,(%esp)
    1313:	e8 b3 02 00 00       	call   15cb <close>
    return;
    1318:	83 c4 10             	add    $0x10,%esp
}
    131b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    131e:	5b                   	pop    %ebx
    131f:	5e                   	pop    %esi
    1320:	5f                   	pop    %edi
    1321:	5d                   	pop    %ebp
    1322:	c3                   	ret    
    1323:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1327:	90                   	nop
        printf(1, "ls: cannot stat %s\n", buf);
    1328:	83 ec 04             	sub    $0x4,%esp
    132b:	57                   	push   %edi
    132c:	68 cc 1a 00 00       	push   $0x1acc
    1331:	6a 01                	push   $0x1
    1333:	e8 d8 03 00 00       	call   1710 <printf>
        continue;
    1338:	83 c4 10             	add    $0x10,%esp
    133b:	e9 c0 fe ff ff       	jmp    1200 <ls+0x100>

00001340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1340:	f3 0f 1e fb          	endbr32 
    1344:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1345:	31 c0                	xor    %eax,%eax
{
    1347:	89 e5                	mov    %esp,%ebp
    1349:	53                   	push   %ebx
    134a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    134d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1350:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1354:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1357:	83 c0 01             	add    $0x1,%eax
    135a:	84 d2                	test   %dl,%dl
    135c:	75 f2                	jne    1350 <strcpy+0x10>
    ;
  return os;
}
    135e:	89 c8                	mov    %ecx,%eax
    1360:	5b                   	pop    %ebx
    1361:	5d                   	pop    %ebp
    1362:	c3                   	ret    
    1363:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    136a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1370:	f3 0f 1e fb          	endbr32 
    1374:	55                   	push   %ebp
    1375:	89 e5                	mov    %esp,%ebp
    1377:	53                   	push   %ebx
    1378:	8b 4d 08             	mov    0x8(%ebp),%ecx
    137b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    137e:	0f b6 01             	movzbl (%ecx),%eax
    1381:	0f b6 1a             	movzbl (%edx),%ebx
    1384:	84 c0                	test   %al,%al
    1386:	75 19                	jne    13a1 <strcmp+0x31>
    1388:	eb 26                	jmp    13b0 <strcmp+0x40>
    138a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1390:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1394:	83 c1 01             	add    $0x1,%ecx
    1397:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    139a:	0f b6 1a             	movzbl (%edx),%ebx
    139d:	84 c0                	test   %al,%al
    139f:	74 0f                	je     13b0 <strcmp+0x40>
    13a1:	38 d8                	cmp    %bl,%al
    13a3:	74 eb                	je     1390 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    13a5:	29 d8                	sub    %ebx,%eax
}
    13a7:	5b                   	pop    %ebx
    13a8:	5d                   	pop    %ebp
    13a9:	c3                   	ret    
    13aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    13b2:	29 d8                	sub    %ebx,%eax
}
    13b4:	5b                   	pop    %ebx
    13b5:	5d                   	pop    %ebp
    13b6:	c3                   	ret    
    13b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13be:	66 90                	xchg   %ax,%ax

000013c0 <strlen>:

uint
strlen(char *s)
{
    13c0:	f3 0f 1e fb          	endbr32 
    13c4:	55                   	push   %ebp
    13c5:	89 e5                	mov    %esp,%ebp
    13c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    13ca:	80 3a 00             	cmpb   $0x0,(%edx)
    13cd:	74 21                	je     13f0 <strlen+0x30>
    13cf:	31 c0                	xor    %eax,%eax
    13d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13d8:	83 c0 01             	add    $0x1,%eax
    13db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    13df:	89 c1                	mov    %eax,%ecx
    13e1:	75 f5                	jne    13d8 <strlen+0x18>
    ;
  return n;
}
    13e3:	89 c8                	mov    %ecx,%eax
    13e5:	5d                   	pop    %ebp
    13e6:	c3                   	ret    
    13e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    13f0:	31 c9                	xor    %ecx,%ecx
}
    13f2:	5d                   	pop    %ebp
    13f3:	89 c8                	mov    %ecx,%eax
    13f5:	c3                   	ret    
    13f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    13fd:	8d 76 00             	lea    0x0(%esi),%esi

00001400 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1400:	f3 0f 1e fb          	endbr32 
    1404:	55                   	push   %ebp
    1405:	89 e5                	mov    %esp,%ebp
    1407:	57                   	push   %edi
    1408:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    140b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    140e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1411:	89 d7                	mov    %edx,%edi
    1413:	fc                   	cld    
    1414:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1416:	89 d0                	mov    %edx,%eax
    1418:	5f                   	pop    %edi
    1419:	5d                   	pop    %ebp
    141a:	c3                   	ret    
    141b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    141f:	90                   	nop

00001420 <strchr>:

char*
strchr(const char *s, char c)
{
    1420:	f3 0f 1e fb          	endbr32 
    1424:	55                   	push   %ebp
    1425:	89 e5                	mov    %esp,%ebp
    1427:	8b 45 08             	mov    0x8(%ebp),%eax
    142a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    142e:	0f b6 10             	movzbl (%eax),%edx
    1431:	84 d2                	test   %dl,%dl
    1433:	75 16                	jne    144b <strchr+0x2b>
    1435:	eb 21                	jmp    1458 <strchr+0x38>
    1437:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    143e:	66 90                	xchg   %ax,%ax
    1440:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1444:	83 c0 01             	add    $0x1,%eax
    1447:	84 d2                	test   %dl,%dl
    1449:	74 0d                	je     1458 <strchr+0x38>
    if(*s == c)
    144b:	38 d1                	cmp    %dl,%cl
    144d:	75 f1                	jne    1440 <strchr+0x20>
      return (char*)s;
  return 0;
}
    144f:	5d                   	pop    %ebp
    1450:	c3                   	ret    
    1451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1458:	31 c0                	xor    %eax,%eax
}
    145a:	5d                   	pop    %ebp
    145b:	c3                   	ret    
    145c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001460 <gets>:

char*
gets(char *buf, int max)
{
    1460:	f3 0f 1e fb          	endbr32 
    1464:	55                   	push   %ebp
    1465:	89 e5                	mov    %esp,%ebp
    1467:	57                   	push   %edi
    1468:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1469:	31 f6                	xor    %esi,%esi
{
    146b:	53                   	push   %ebx
    146c:	89 f3                	mov    %esi,%ebx
    146e:	83 ec 1c             	sub    $0x1c,%esp
    1471:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1474:	eb 33                	jmp    14a9 <gets+0x49>
    1476:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    147d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1480:	83 ec 04             	sub    $0x4,%esp
    1483:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1486:	6a 01                	push   $0x1
    1488:	50                   	push   %eax
    1489:	6a 00                	push   $0x0
    148b:	e8 2b 01 00 00       	call   15bb <read>
    if(cc < 1)
    1490:	83 c4 10             	add    $0x10,%esp
    1493:	85 c0                	test   %eax,%eax
    1495:	7e 1c                	jle    14b3 <gets+0x53>
      break;
    buf[i++] = c;
    1497:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    149b:	83 c7 01             	add    $0x1,%edi
    149e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    14a1:	3c 0a                	cmp    $0xa,%al
    14a3:	74 23                	je     14c8 <gets+0x68>
    14a5:	3c 0d                	cmp    $0xd,%al
    14a7:	74 1f                	je     14c8 <gets+0x68>
  for(i=0; i+1 < max; ){
    14a9:	83 c3 01             	add    $0x1,%ebx
    14ac:	89 fe                	mov    %edi,%esi
    14ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    14b1:	7c cd                	jl     1480 <gets+0x20>
    14b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    14b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    14b8:	c6 03 00             	movb   $0x0,(%ebx)
}
    14bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14be:	5b                   	pop    %ebx
    14bf:	5e                   	pop    %esi
    14c0:	5f                   	pop    %edi
    14c1:	5d                   	pop    %ebp
    14c2:	c3                   	ret    
    14c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14c7:	90                   	nop
    14c8:	8b 75 08             	mov    0x8(%ebp),%esi
    14cb:	8b 45 08             	mov    0x8(%ebp),%eax
    14ce:	01 de                	add    %ebx,%esi
    14d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    14d2:	c6 03 00             	movb   $0x0,(%ebx)
}
    14d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14d8:	5b                   	pop    %ebx
    14d9:	5e                   	pop    %esi
    14da:	5f                   	pop    %edi
    14db:	5d                   	pop    %ebp
    14dc:	c3                   	ret    
    14dd:	8d 76 00             	lea    0x0(%esi),%esi

000014e0 <stat>:

int
stat(char *n, struct stat *st)
{
    14e0:	f3 0f 1e fb          	endbr32 
    14e4:	55                   	push   %ebp
    14e5:	89 e5                	mov    %esp,%ebp
    14e7:	56                   	push   %esi
    14e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    14e9:	83 ec 08             	sub    $0x8,%esp
    14ec:	6a 00                	push   $0x0
    14ee:	ff 75 08             	pushl  0x8(%ebp)
    14f1:	e8 ed 00 00 00       	call   15e3 <open>
  if(fd < 0)
    14f6:	83 c4 10             	add    $0x10,%esp
    14f9:	85 c0                	test   %eax,%eax
    14fb:	78 2b                	js     1528 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    14fd:	83 ec 08             	sub    $0x8,%esp
    1500:	ff 75 0c             	pushl  0xc(%ebp)
    1503:	89 c3                	mov    %eax,%ebx
    1505:	50                   	push   %eax
    1506:	e8 f0 00 00 00       	call   15fb <fstat>
  close(fd);
    150b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    150e:	89 c6                	mov    %eax,%esi
  close(fd);
    1510:	e8 b6 00 00 00       	call   15cb <close>
  return r;
    1515:	83 c4 10             	add    $0x10,%esp
}
    1518:	8d 65 f8             	lea    -0x8(%ebp),%esp
    151b:	89 f0                	mov    %esi,%eax
    151d:	5b                   	pop    %ebx
    151e:	5e                   	pop    %esi
    151f:	5d                   	pop    %ebp
    1520:	c3                   	ret    
    1521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1528:	be ff ff ff ff       	mov    $0xffffffff,%esi
    152d:	eb e9                	jmp    1518 <stat+0x38>
    152f:	90                   	nop

00001530 <atoi>:

int
atoi(const char *s)
{
    1530:	f3 0f 1e fb          	endbr32 
    1534:	55                   	push   %ebp
    1535:	89 e5                	mov    %esp,%ebp
    1537:	53                   	push   %ebx
    1538:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    153b:	0f be 02             	movsbl (%edx),%eax
    153e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1541:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1544:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1549:	77 1a                	ja     1565 <atoi+0x35>
    154b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    154f:	90                   	nop
    n = n*10 + *s++ - '0';
    1550:	83 c2 01             	add    $0x1,%edx
    1553:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1556:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    155a:	0f be 02             	movsbl (%edx),%eax
    155d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1560:	80 fb 09             	cmp    $0x9,%bl
    1563:	76 eb                	jbe    1550 <atoi+0x20>
  return n;
}
    1565:	89 c8                	mov    %ecx,%eax
    1567:	5b                   	pop    %ebx
    1568:	5d                   	pop    %ebp
    1569:	c3                   	ret    
    156a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001570 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1570:	f3 0f 1e fb          	endbr32 
    1574:	55                   	push   %ebp
    1575:	89 e5                	mov    %esp,%ebp
    1577:	57                   	push   %edi
    1578:	8b 45 10             	mov    0x10(%ebp),%eax
    157b:	8b 55 08             	mov    0x8(%ebp),%edx
    157e:	56                   	push   %esi
    157f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1582:	85 c0                	test   %eax,%eax
    1584:	7e 0f                	jle    1595 <memmove+0x25>
    1586:	01 d0                	add    %edx,%eax
  dst = vdst;
    1588:	89 d7                	mov    %edx,%edi
    158a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1590:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1591:	39 f8                	cmp    %edi,%eax
    1593:	75 fb                	jne    1590 <memmove+0x20>
  return vdst;
}
    1595:	5e                   	pop    %esi
    1596:	89 d0                	mov    %edx,%eax
    1598:	5f                   	pop    %edi
    1599:	5d                   	pop    %ebp
    159a:	c3                   	ret    

0000159b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    159b:	b8 01 00 00 00       	mov    $0x1,%eax
    15a0:	cd 40                	int    $0x40
    15a2:	c3                   	ret    

000015a3 <exit>:
SYSCALL(exit)
    15a3:	b8 02 00 00 00       	mov    $0x2,%eax
    15a8:	cd 40                	int    $0x40
    15aa:	c3                   	ret    

000015ab <wait>:
SYSCALL(wait)
    15ab:	b8 03 00 00 00       	mov    $0x3,%eax
    15b0:	cd 40                	int    $0x40
    15b2:	c3                   	ret    

000015b3 <pipe>:
SYSCALL(pipe)
    15b3:	b8 04 00 00 00       	mov    $0x4,%eax
    15b8:	cd 40                	int    $0x40
    15ba:	c3                   	ret    

000015bb <read>:
SYSCALL(read)
    15bb:	b8 05 00 00 00       	mov    $0x5,%eax
    15c0:	cd 40                	int    $0x40
    15c2:	c3                   	ret    

000015c3 <write>:
SYSCALL(write)
    15c3:	b8 10 00 00 00       	mov    $0x10,%eax
    15c8:	cd 40                	int    $0x40
    15ca:	c3                   	ret    

000015cb <close>:
SYSCALL(close)
    15cb:	b8 15 00 00 00       	mov    $0x15,%eax
    15d0:	cd 40                	int    $0x40
    15d2:	c3                   	ret    

000015d3 <kill>:
SYSCALL(kill)
    15d3:	b8 06 00 00 00       	mov    $0x6,%eax
    15d8:	cd 40                	int    $0x40
    15da:	c3                   	ret    

000015db <exec>:
SYSCALL(exec)
    15db:	b8 07 00 00 00       	mov    $0x7,%eax
    15e0:	cd 40                	int    $0x40
    15e2:	c3                   	ret    

000015e3 <open>:
SYSCALL(open)
    15e3:	b8 0f 00 00 00       	mov    $0xf,%eax
    15e8:	cd 40                	int    $0x40
    15ea:	c3                   	ret    

000015eb <mknod>:
SYSCALL(mknod)
    15eb:	b8 11 00 00 00       	mov    $0x11,%eax
    15f0:	cd 40                	int    $0x40
    15f2:	c3                   	ret    

000015f3 <unlink>:
SYSCALL(unlink)
    15f3:	b8 12 00 00 00       	mov    $0x12,%eax
    15f8:	cd 40                	int    $0x40
    15fa:	c3                   	ret    

000015fb <fstat>:
SYSCALL(fstat)
    15fb:	b8 08 00 00 00       	mov    $0x8,%eax
    1600:	cd 40                	int    $0x40
    1602:	c3                   	ret    

00001603 <link>:
SYSCALL(link)
    1603:	b8 13 00 00 00       	mov    $0x13,%eax
    1608:	cd 40                	int    $0x40
    160a:	c3                   	ret    

0000160b <mkdir>:
SYSCALL(mkdir)
    160b:	b8 14 00 00 00       	mov    $0x14,%eax
    1610:	cd 40                	int    $0x40
    1612:	c3                   	ret    

00001613 <chdir>:
SYSCALL(chdir)
    1613:	b8 09 00 00 00       	mov    $0x9,%eax
    1618:	cd 40                	int    $0x40
    161a:	c3                   	ret    

0000161b <dup>:
SYSCALL(dup)
    161b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1620:	cd 40                	int    $0x40
    1622:	c3                   	ret    

00001623 <getpid>:
SYSCALL(getpid)
    1623:	b8 0b 00 00 00       	mov    $0xb,%eax
    1628:	cd 40                	int    $0x40
    162a:	c3                   	ret    

0000162b <sbrk>:
SYSCALL(sbrk)
    162b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1630:	cd 40                	int    $0x40
    1632:	c3                   	ret    

00001633 <sleep>:
SYSCALL(sleep)
    1633:	b8 0d 00 00 00       	mov    $0xd,%eax
    1638:	cd 40                	int    $0x40
    163a:	c3                   	ret    

0000163b <uptime>:
SYSCALL(uptime)
    163b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1640:	cd 40                	int    $0x40
    1642:	c3                   	ret    

00001643 <shm_open>:
SYSCALL(shm_open)
    1643:	b8 16 00 00 00       	mov    $0x16,%eax
    1648:	cd 40                	int    $0x40
    164a:	c3                   	ret    

0000164b <shm_close>:
SYSCALL(shm_close)	
    164b:	b8 17 00 00 00       	mov    $0x17,%eax
    1650:	cd 40                	int    $0x40
    1652:	c3                   	ret    
    1653:	66 90                	xchg   %ax,%ax
    1655:	66 90                	xchg   %ax,%ax
    1657:	66 90                	xchg   %ax,%ax
    1659:	66 90                	xchg   %ax,%ax
    165b:	66 90                	xchg   %ax,%ax
    165d:	66 90                	xchg   %ax,%ax
    165f:	90                   	nop

00001660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1660:	55                   	push   %ebp
    1661:	89 e5                	mov    %esp,%ebp
    1663:	57                   	push   %edi
    1664:	56                   	push   %esi
    1665:	53                   	push   %ebx
    1666:	83 ec 3c             	sub    $0x3c,%esp
    1669:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    166c:	89 d1                	mov    %edx,%ecx
{
    166e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1671:	85 d2                	test   %edx,%edx
    1673:	0f 89 7f 00 00 00    	jns    16f8 <printint+0x98>
    1679:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    167d:	74 79                	je     16f8 <printint+0x98>
    neg = 1;
    167f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1686:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1688:	31 db                	xor    %ebx,%ebx
    168a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    168d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1690:	89 c8                	mov    %ecx,%eax
    1692:	31 d2                	xor    %edx,%edx
    1694:	89 cf                	mov    %ecx,%edi
    1696:	f7 75 c4             	divl   -0x3c(%ebp)
    1699:	0f b6 92 0c 1b 00 00 	movzbl 0x1b0c(%edx),%edx
    16a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    16a3:	89 d8                	mov    %ebx,%eax
    16a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    16a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    16ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    16ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    16b1:	76 dd                	jbe    1690 <printint+0x30>
  if(neg)
    16b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    16b6:	85 c9                	test   %ecx,%ecx
    16b8:	74 0c                	je     16c6 <printint+0x66>
    buf[i++] = '-';
    16ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    16bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    16c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    16c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    16c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    16cd:	eb 07                	jmp    16d6 <printint+0x76>
    16cf:	90                   	nop
    16d0:	0f b6 13             	movzbl (%ebx),%edx
    16d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    16d6:	83 ec 04             	sub    $0x4,%esp
    16d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    16dc:	6a 01                	push   $0x1
    16de:	56                   	push   %esi
    16df:	57                   	push   %edi
    16e0:	e8 de fe ff ff       	call   15c3 <write>
  while(--i >= 0)
    16e5:	83 c4 10             	add    $0x10,%esp
    16e8:	39 de                	cmp    %ebx,%esi
    16ea:	75 e4                	jne    16d0 <printint+0x70>
    putc(fd, buf[i]);
}
    16ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    16ef:	5b                   	pop    %ebx
    16f0:	5e                   	pop    %esi
    16f1:	5f                   	pop    %edi
    16f2:	5d                   	pop    %ebp
    16f3:	c3                   	ret    
    16f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    16f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    16ff:	eb 87                	jmp    1688 <printint+0x28>
    1701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1708:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    170f:	90                   	nop

00001710 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1710:	f3 0f 1e fb          	endbr32 
    1714:	55                   	push   %ebp
    1715:	89 e5                	mov    %esp,%ebp
    1717:	57                   	push   %edi
    1718:	56                   	push   %esi
    1719:	53                   	push   %ebx
    171a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    171d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1720:	0f b6 1e             	movzbl (%esi),%ebx
    1723:	84 db                	test   %bl,%bl
    1725:	0f 84 b4 00 00 00    	je     17df <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    172b:	8d 45 10             	lea    0x10(%ebp),%eax
    172e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1731:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1734:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1736:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1739:	eb 33                	jmp    176e <printf+0x5e>
    173b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    173f:	90                   	nop
    1740:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1743:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1748:	83 f8 25             	cmp    $0x25,%eax
    174b:	74 17                	je     1764 <printf+0x54>
  write(fd, &c, 1);
    174d:	83 ec 04             	sub    $0x4,%esp
    1750:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1753:	6a 01                	push   $0x1
    1755:	57                   	push   %edi
    1756:	ff 75 08             	pushl  0x8(%ebp)
    1759:	e8 65 fe ff ff       	call   15c3 <write>
    175e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1761:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1764:	0f b6 1e             	movzbl (%esi),%ebx
    1767:	83 c6 01             	add    $0x1,%esi
    176a:	84 db                	test   %bl,%bl
    176c:	74 71                	je     17df <printf+0xcf>
    c = fmt[i] & 0xff;
    176e:	0f be cb             	movsbl %bl,%ecx
    1771:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1774:	85 d2                	test   %edx,%edx
    1776:	74 c8                	je     1740 <printf+0x30>
      }
    } else if(state == '%'){
    1778:	83 fa 25             	cmp    $0x25,%edx
    177b:	75 e7                	jne    1764 <printf+0x54>
      if(c == 'd'){
    177d:	83 f8 64             	cmp    $0x64,%eax
    1780:	0f 84 9a 00 00 00    	je     1820 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1786:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    178c:	83 f9 70             	cmp    $0x70,%ecx
    178f:	74 5f                	je     17f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1791:	83 f8 73             	cmp    $0x73,%eax
    1794:	0f 84 d6 00 00 00    	je     1870 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    179a:	83 f8 63             	cmp    $0x63,%eax
    179d:	0f 84 8d 00 00 00    	je     1830 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    17a3:	83 f8 25             	cmp    $0x25,%eax
    17a6:	0f 84 b4 00 00 00    	je     1860 <printf+0x150>
  write(fd, &c, 1);
    17ac:	83 ec 04             	sub    $0x4,%esp
    17af:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    17b3:	6a 01                	push   $0x1
    17b5:	57                   	push   %edi
    17b6:	ff 75 08             	pushl  0x8(%ebp)
    17b9:	e8 05 fe ff ff       	call   15c3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    17be:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    17c1:	83 c4 0c             	add    $0xc,%esp
    17c4:	6a 01                	push   $0x1
    17c6:	83 c6 01             	add    $0x1,%esi
    17c9:	57                   	push   %edi
    17ca:	ff 75 08             	pushl  0x8(%ebp)
    17cd:	e8 f1 fd ff ff       	call   15c3 <write>
  for(i = 0; fmt[i]; i++){
    17d2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    17d6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    17d9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    17db:	84 db                	test   %bl,%bl
    17dd:	75 8f                	jne    176e <printf+0x5e>
    }
  }
}
    17df:	8d 65 f4             	lea    -0xc(%ebp),%esp
    17e2:	5b                   	pop    %ebx
    17e3:	5e                   	pop    %esi
    17e4:	5f                   	pop    %edi
    17e5:	5d                   	pop    %ebp
    17e6:	c3                   	ret    
    17e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    17f0:	83 ec 0c             	sub    $0xc,%esp
    17f3:	b9 10 00 00 00       	mov    $0x10,%ecx
    17f8:	6a 00                	push   $0x0
    17fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    17fd:	8b 45 08             	mov    0x8(%ebp),%eax
    1800:	8b 13                	mov    (%ebx),%edx
    1802:	e8 59 fe ff ff       	call   1660 <printint>
        ap++;
    1807:	89 d8                	mov    %ebx,%eax
    1809:	83 c4 10             	add    $0x10,%esp
      state = 0;
    180c:	31 d2                	xor    %edx,%edx
        ap++;
    180e:	83 c0 04             	add    $0x4,%eax
    1811:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1814:	e9 4b ff ff ff       	jmp    1764 <printf+0x54>
    1819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1820:	83 ec 0c             	sub    $0xc,%esp
    1823:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1828:	6a 01                	push   $0x1
    182a:	eb ce                	jmp    17fa <printf+0xea>
    182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1830:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1833:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1836:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1838:	6a 01                	push   $0x1
        ap++;
    183a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    183d:	57                   	push   %edi
    183e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1841:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1844:	e8 7a fd ff ff       	call   15c3 <write>
        ap++;
    1849:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    184c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    184f:	31 d2                	xor    %edx,%edx
    1851:	e9 0e ff ff ff       	jmp    1764 <printf+0x54>
    1856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    185d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1860:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1863:	83 ec 04             	sub    $0x4,%esp
    1866:	e9 59 ff ff ff       	jmp    17c4 <printf+0xb4>
    186b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    186f:	90                   	nop
        s = (char*)*ap;
    1870:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1873:	8b 18                	mov    (%eax),%ebx
        ap++;
    1875:	83 c0 04             	add    $0x4,%eax
    1878:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    187b:	85 db                	test   %ebx,%ebx
    187d:	74 17                	je     1896 <printf+0x186>
        while(*s != 0){
    187f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1882:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1884:	84 c0                	test   %al,%al
    1886:	0f 84 d8 fe ff ff    	je     1764 <printf+0x54>
    188c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    188f:	89 de                	mov    %ebx,%esi
    1891:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1894:	eb 1a                	jmp    18b0 <printf+0x1a0>
          s = "(null)";
    1896:	bb 02 1b 00 00       	mov    $0x1b02,%ebx
        while(*s != 0){
    189b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    189e:	b8 28 00 00 00       	mov    $0x28,%eax
    18a3:	89 de                	mov    %ebx,%esi
    18a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    18a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    18af:	90                   	nop
  write(fd, &c, 1);
    18b0:	83 ec 04             	sub    $0x4,%esp
          s++;
    18b3:	83 c6 01             	add    $0x1,%esi
    18b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    18b9:	6a 01                	push   $0x1
    18bb:	57                   	push   %edi
    18bc:	53                   	push   %ebx
    18bd:	e8 01 fd ff ff       	call   15c3 <write>
        while(*s != 0){
    18c2:	0f b6 06             	movzbl (%esi),%eax
    18c5:	83 c4 10             	add    $0x10,%esp
    18c8:	84 c0                	test   %al,%al
    18ca:	75 e4                	jne    18b0 <printf+0x1a0>
    18cc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    18cf:	31 d2                	xor    %edx,%edx
    18d1:	e9 8e fe ff ff       	jmp    1764 <printf+0x54>
    18d6:	66 90                	xchg   %ax,%ax
    18d8:	66 90                	xchg   %ax,%ax
    18da:	66 90                	xchg   %ax,%ax
    18dc:	66 90                	xchg   %ax,%ax
    18de:	66 90                	xchg   %ax,%ax

000018e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    18e0:	f3 0f 1e fb          	endbr32 
    18e4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18e5:	a1 84 1e 00 00       	mov    0x1e84,%eax
{
    18ea:	89 e5                	mov    %esp,%ebp
    18ec:	57                   	push   %edi
    18ed:	56                   	push   %esi
    18ee:	53                   	push   %ebx
    18ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
    18f2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    18f4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    18f7:	39 c8                	cmp    %ecx,%eax
    18f9:	73 15                	jae    1910 <free+0x30>
    18fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    18ff:	90                   	nop
    1900:	39 d1                	cmp    %edx,%ecx
    1902:	72 14                	jb     1918 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1904:	39 d0                	cmp    %edx,%eax
    1906:	73 10                	jae    1918 <free+0x38>
{
    1908:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    190a:	8b 10                	mov    (%eax),%edx
    190c:	39 c8                	cmp    %ecx,%eax
    190e:	72 f0                	jb     1900 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1910:	39 d0                	cmp    %edx,%eax
    1912:	72 f4                	jb     1908 <free+0x28>
    1914:	39 d1                	cmp    %edx,%ecx
    1916:	73 f0                	jae    1908 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1918:	8b 73 fc             	mov    -0x4(%ebx),%esi
    191b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    191e:	39 fa                	cmp    %edi,%edx
    1920:	74 1e                	je     1940 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1922:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1925:	8b 50 04             	mov    0x4(%eax),%edx
    1928:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    192b:	39 f1                	cmp    %esi,%ecx
    192d:	74 28                	je     1957 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    192f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1931:	5b                   	pop    %ebx
  freep = p;
    1932:	a3 84 1e 00 00       	mov    %eax,0x1e84
}
    1937:	5e                   	pop    %esi
    1938:	5f                   	pop    %edi
    1939:	5d                   	pop    %ebp
    193a:	c3                   	ret    
    193b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    193f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1940:	03 72 04             	add    0x4(%edx),%esi
    1943:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1946:	8b 10                	mov    (%eax),%edx
    1948:	8b 12                	mov    (%edx),%edx
    194a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    194d:	8b 50 04             	mov    0x4(%eax),%edx
    1950:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1953:	39 f1                	cmp    %esi,%ecx
    1955:	75 d8                	jne    192f <free+0x4f>
    p->s.size += bp->s.size;
    1957:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    195a:	a3 84 1e 00 00       	mov    %eax,0x1e84
    p->s.size += bp->s.size;
    195f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1962:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1965:	89 10                	mov    %edx,(%eax)
}
    1967:	5b                   	pop    %ebx
    1968:	5e                   	pop    %esi
    1969:	5f                   	pop    %edi
    196a:	5d                   	pop    %ebp
    196b:	c3                   	ret    
    196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001970 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1970:	f3 0f 1e fb          	endbr32 
    1974:	55                   	push   %ebp
    1975:	89 e5                	mov    %esp,%ebp
    1977:	57                   	push   %edi
    1978:	56                   	push   %esi
    1979:	53                   	push   %ebx
    197a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    197d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1980:	8b 3d 84 1e 00 00    	mov    0x1e84,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1986:	8d 70 07             	lea    0x7(%eax),%esi
    1989:	c1 ee 03             	shr    $0x3,%esi
    198c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    198f:	85 ff                	test   %edi,%edi
    1991:	0f 84 a9 00 00 00    	je     1a40 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1997:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1999:	8b 48 04             	mov    0x4(%eax),%ecx
    199c:	39 f1                	cmp    %esi,%ecx
    199e:	73 6d                	jae    1a0d <malloc+0x9d>
    19a0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    19a6:	bb 00 10 00 00       	mov    $0x1000,%ebx
    19ab:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    19ae:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    19b5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    19b8:	eb 17                	jmp    19d1 <malloc+0x61>
    19ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    19c0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    19c2:	8b 4a 04             	mov    0x4(%edx),%ecx
    19c5:	39 f1                	cmp    %esi,%ecx
    19c7:	73 4f                	jae    1a18 <malloc+0xa8>
    19c9:	8b 3d 84 1e 00 00    	mov    0x1e84,%edi
    19cf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    19d1:	39 c7                	cmp    %eax,%edi
    19d3:	75 eb                	jne    19c0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    19d5:	83 ec 0c             	sub    $0xc,%esp
    19d8:	ff 75 e4             	pushl  -0x1c(%ebp)
    19db:	e8 4b fc ff ff       	call   162b <sbrk>
  if(p == (char*)-1)
    19e0:	83 c4 10             	add    $0x10,%esp
    19e3:	83 f8 ff             	cmp    $0xffffffff,%eax
    19e6:	74 1b                	je     1a03 <malloc+0x93>
  hp->s.size = nu;
    19e8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    19eb:	83 ec 0c             	sub    $0xc,%esp
    19ee:	83 c0 08             	add    $0x8,%eax
    19f1:	50                   	push   %eax
    19f2:	e8 e9 fe ff ff       	call   18e0 <free>
  return freep;
    19f7:	a1 84 1e 00 00       	mov    0x1e84,%eax
      if((p = morecore(nunits)) == 0)
    19fc:	83 c4 10             	add    $0x10,%esp
    19ff:	85 c0                	test   %eax,%eax
    1a01:	75 bd                	jne    19c0 <malloc+0x50>
        return 0;
  }
}
    1a03:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1a06:	31 c0                	xor    %eax,%eax
}
    1a08:	5b                   	pop    %ebx
    1a09:	5e                   	pop    %esi
    1a0a:	5f                   	pop    %edi
    1a0b:	5d                   	pop    %ebp
    1a0c:	c3                   	ret    
    if(p->s.size >= nunits){
    1a0d:	89 c2                	mov    %eax,%edx
    1a0f:	89 f8                	mov    %edi,%eax
    1a11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1a18:	39 ce                	cmp    %ecx,%esi
    1a1a:	74 54                	je     1a70 <malloc+0x100>
        p->s.size -= nunits;
    1a1c:	29 f1                	sub    %esi,%ecx
    1a1e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1a21:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1a24:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1a27:	a3 84 1e 00 00       	mov    %eax,0x1e84
}
    1a2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1a2f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1a32:	5b                   	pop    %ebx
    1a33:	5e                   	pop    %esi
    1a34:	5f                   	pop    %edi
    1a35:	5d                   	pop    %ebp
    1a36:	c3                   	ret    
    1a37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1a3e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1a40:	c7 05 84 1e 00 00 88 	movl   $0x1e88,0x1e84
    1a47:	1e 00 00 
    base.s.size = 0;
    1a4a:	bf 88 1e 00 00       	mov    $0x1e88,%edi
    base.s.ptr = freep = prevp = &base;
    1a4f:	c7 05 88 1e 00 00 88 	movl   $0x1e88,0x1e88
    1a56:	1e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1a59:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    1a5b:	c7 05 8c 1e 00 00 00 	movl   $0x0,0x1e8c
    1a62:	00 00 00 
    if(p->s.size >= nunits){
    1a65:	e9 36 ff ff ff       	jmp    19a0 <malloc+0x30>
    1a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1a70:	8b 0a                	mov    (%edx),%ecx
    1a72:	89 08                	mov    %ecx,(%eax)
    1a74:	eb b1                	jmp    1a27 <malloc+0xb7>
    1a76:	66 90                	xchg   %ax,%ax
    1a78:	66 90                	xchg   %ax,%ax
    1a7a:	66 90                	xchg   %ax,%ax
    1a7c:	66 90                	xchg   %ax,%ax
    1a7e:	66 90                	xchg   %ax,%ax

00001a80 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    1a80:	f3 0f 1e fb          	endbr32 
    1a84:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    1a85:	b9 01 00 00 00       	mov    $0x1,%ecx
    1a8a:	89 e5                	mov    %esp,%ebp
    1a8c:	8b 55 08             	mov    0x8(%ebp),%edx
    1a8f:	90                   	nop
    1a90:	89 c8                	mov    %ecx,%eax
    1a92:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    1a95:	85 c0                	test   %eax,%eax
    1a97:	75 f7                	jne    1a90 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    1a99:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    1a9e:	5d                   	pop    %ebp
    1a9f:	c3                   	ret    

00001aa0 <urelease>:

void urelease (struct uspinlock *lk) {
    1aa0:	f3 0f 1e fb          	endbr32 
    1aa4:	55                   	push   %ebp
    1aa5:	89 e5                	mov    %esp,%ebp
    1aa7:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    1aaa:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    1aaf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    1ab5:	5d                   	pop    %ebp
    1ab6:	c3                   	ret    
