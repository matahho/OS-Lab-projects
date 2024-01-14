
_sh:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:
  return 0;
}

int
main(void)
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	51                   	push   %ecx
    1012:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    1015:	eb 12                	jmp    1029 <main+0x29>
    1017:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    101e:	66 90                	xchg   %ax,%ax
    if(fd >= 3){
    1020:	83 f8 02             	cmp    $0x2,%eax
    1023:	0f 8f b7 00 00 00    	jg     10e0 <main+0xe0>
  while((fd = open("console", O_RDWR)) >= 0){
    1029:	83 ec 08             	sub    $0x8,%esp
    102c:	6a 02                	push   $0x2
    102e:	68 49 23 00 00       	push   $0x2349
    1033:	e8 9b 0d 00 00       	call   1dd3 <open>
    1038:	83 c4 10             	add    $0x10,%esp
    103b:	85 c0                	test   %eax,%eax
    103d:	79 e1                	jns    1020 <main+0x20>
    103f:	eb 32                	jmp    1073 <main+0x73>
    1041:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    1048:	80 3d c2 29 00 00 20 	cmpb   $0x20,0x29c2
    104f:	74 51                	je     10a2 <main+0xa2>
    1051:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
    1058:	e8 2e 0d 00 00       	call   1d8b <fork>
  if(pid == -1)
    105d:	83 f8 ff             	cmp    $0xffffffff,%eax
    1060:	0f 84 9d 00 00 00    	je     1103 <main+0x103>
    if(fork1() == 0)
    1066:	85 c0                	test   %eax,%eax
    1068:	0f 84 80 00 00 00    	je     10ee <main+0xee>
    wait();
    106e:	e8 28 0d 00 00       	call   1d9b <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
    1073:	83 ec 08             	sub    $0x8,%esp
    1076:	6a 64                	push   $0x64
    1078:	68 c0 29 00 00       	push   $0x29c0
    107d:	e8 8e 00 00 00       	call   1110 <getcmd>
    1082:	83 c4 10             	add    $0x10,%esp
    1085:	85 c0                	test   %eax,%eax
    1087:	78 14                	js     109d <main+0x9d>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
    1089:	80 3d c0 29 00 00 63 	cmpb   $0x63,0x29c0
    1090:	75 c6                	jne    1058 <main+0x58>
    1092:	80 3d c1 29 00 00 64 	cmpb   $0x64,0x29c1
    1099:	75 bd                	jne    1058 <main+0x58>
    109b:	eb ab                	jmp    1048 <main+0x48>
  exit();
    109d:	e8 f1 0c 00 00       	call   1d93 <exit>
      buf[strlen(buf)-1] = 0;  // chop \n
    10a2:	83 ec 0c             	sub    $0xc,%esp
    10a5:	68 c0 29 00 00       	push   $0x29c0
    10aa:	e8 01 0b 00 00       	call   1bb0 <strlen>
      if(chdir(buf+3) < 0)
    10af:	c7 04 24 c3 29 00 00 	movl   $0x29c3,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
    10b6:	c6 80 bf 29 00 00 00 	movb   $0x0,0x29bf(%eax)
      if(chdir(buf+3) < 0)
    10bd:	e8 41 0d 00 00       	call   1e03 <chdir>
    10c2:	83 c4 10             	add    $0x10,%esp
    10c5:	85 c0                	test   %eax,%eax
    10c7:	79 aa                	jns    1073 <main+0x73>
        printf(2, "cannot cd %s\n", buf+3);
    10c9:	50                   	push   %eax
    10ca:	68 c3 29 00 00       	push   $0x29c3
    10cf:	68 51 23 00 00       	push   $0x2351
    10d4:	6a 02                	push   $0x2
    10d6:	e8 25 0e 00 00       	call   1f00 <printf>
    10db:	83 c4 10             	add    $0x10,%esp
    10de:	eb 93                	jmp    1073 <main+0x73>
      close(fd);
    10e0:	83 ec 0c             	sub    $0xc,%esp
    10e3:	50                   	push   %eax
    10e4:	e8 d2 0c 00 00       	call   1dbb <close>
      break;
    10e9:	83 c4 10             	add    $0x10,%esp
    10ec:	eb 85                	jmp    1073 <main+0x73>
      runcmd(parsecmd(buf));
    10ee:	83 ec 0c             	sub    $0xc,%esp
    10f1:	68 c0 29 00 00       	push   $0x29c0
    10f6:	e8 c5 09 00 00       	call   1ac0 <parsecmd>
    10fb:	89 04 24             	mov    %eax,(%esp)
    10fe:	e8 7d 00 00 00       	call   1180 <runcmd>
    panic("fork");
    1103:	83 ec 0c             	sub    $0xc,%esp
    1106:	68 d2 22 00 00       	push   $0x22d2
    110b:	e8 50 00 00 00       	call   1160 <panic>

00001110 <getcmd>:
{
    1110:	f3 0f 1e fb          	endbr32 
    1114:	55                   	push   %ebp
    1115:	89 e5                	mov    %esp,%ebp
    1117:	56                   	push   %esi
    1118:	53                   	push   %ebx
    1119:	8b 75 0c             	mov    0xc(%ebp),%esi
    111c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
    111f:	83 ec 08             	sub    $0x8,%esp
    1122:	68 a8 22 00 00       	push   $0x22a8
    1127:	6a 02                	push   $0x2
    1129:	e8 d2 0d 00 00       	call   1f00 <printf>
  memset(buf, 0, nbuf);
    112e:	83 c4 0c             	add    $0xc,%esp
    1131:	56                   	push   %esi
    1132:	6a 00                	push   $0x0
    1134:	53                   	push   %ebx
    1135:	e8 b6 0a 00 00       	call   1bf0 <memset>
  gets(buf, nbuf);
    113a:	58                   	pop    %eax
    113b:	5a                   	pop    %edx
    113c:	56                   	push   %esi
    113d:	53                   	push   %ebx
    113e:	e8 0d 0b 00 00       	call   1c50 <gets>
  if(buf[0] == 0) // EOF
    1143:	83 c4 10             	add    $0x10,%esp
    1146:	31 c0                	xor    %eax,%eax
    1148:	80 3b 00             	cmpb   $0x0,(%ebx)
    114b:	0f 94 c0             	sete   %al
}
    114e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1151:	5b                   	pop    %ebx
  if(buf[0] == 0) // EOF
    1152:	f7 d8                	neg    %eax
}
    1154:	5e                   	pop    %esi
    1155:	5d                   	pop    %ebp
    1156:	c3                   	ret    
    1157:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    115e:	66 90                	xchg   %ax,%ax

00001160 <panic>:
{
    1160:	f3 0f 1e fb          	endbr32 
    1164:	55                   	push   %ebp
    1165:	89 e5                	mov    %esp,%ebp
    1167:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
    116a:	ff 75 08             	pushl  0x8(%ebp)
    116d:	68 45 23 00 00       	push   $0x2345
    1172:	6a 02                	push   $0x2
    1174:	e8 87 0d 00 00       	call   1f00 <printf>
  exit();
    1179:	e8 15 0c 00 00       	call   1d93 <exit>
    117e:	66 90                	xchg   %ax,%ax

00001180 <runcmd>:
{
    1180:	f3 0f 1e fb          	endbr32 
    1184:	55                   	push   %ebp
    1185:	89 e5                	mov    %esp,%ebp
    1187:	53                   	push   %ebx
    1188:	83 ec 14             	sub    $0x14,%esp
    118b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
    118e:	85 db                	test   %ebx,%ebx
    1190:	74 7e                	je     1210 <runcmd+0x90>
  switch(cmd->type){
    1192:	83 3b 05             	cmpl   $0x5,(%ebx)
    1195:	0f 87 04 01 00 00    	ja     129f <runcmd+0x11f>
    119b:	8b 03                	mov    (%ebx),%eax
    119d:	3e ff 24 85 60 23 00 	notrack jmp *0x2360(,%eax,4)
    11a4:	00 
    if(pipe(p) < 0)
    11a5:	83 ec 0c             	sub    $0xc,%esp
    11a8:	8d 45 f0             	lea    -0x10(%ebp),%eax
    11ab:	50                   	push   %eax
    11ac:	e8 f2 0b 00 00       	call   1da3 <pipe>
    11b1:	83 c4 10             	add    $0x10,%esp
    11b4:	85 c0                	test   %eax,%eax
    11b6:	0f 88 05 01 00 00    	js     12c1 <runcmd+0x141>
  pid = fork();
    11bc:	e8 ca 0b 00 00       	call   1d8b <fork>
  if(pid == -1)
    11c1:	83 f8 ff             	cmp    $0xffffffff,%eax
    11c4:	0f 84 60 01 00 00    	je     132a <runcmd+0x1aa>
    if(fork1() == 0){
    11ca:	85 c0                	test   %eax,%eax
    11cc:	0f 84 fc 00 00 00    	je     12ce <runcmd+0x14e>
  pid = fork();
    11d2:	e8 b4 0b 00 00       	call   1d8b <fork>
  if(pid == -1)
    11d7:	83 f8 ff             	cmp    $0xffffffff,%eax
    11da:	0f 84 4a 01 00 00    	je     132a <runcmd+0x1aa>
    if(fork1() == 0){
    11e0:	85 c0                	test   %eax,%eax
    11e2:	0f 84 14 01 00 00    	je     12fc <runcmd+0x17c>
    close(p[0]);
    11e8:	83 ec 0c             	sub    $0xc,%esp
    11eb:	ff 75 f0             	pushl  -0x10(%ebp)
    11ee:	e8 c8 0b 00 00       	call   1dbb <close>
    close(p[1]);
    11f3:	58                   	pop    %eax
    11f4:	ff 75 f4             	pushl  -0xc(%ebp)
    11f7:	e8 bf 0b 00 00       	call   1dbb <close>
    wait();
    11fc:	e8 9a 0b 00 00       	call   1d9b <wait>
    wait();
    1201:	e8 95 0b 00 00       	call   1d9b <wait>
    break;
    1206:	83 c4 10             	add    $0x10,%esp
    1209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
    1210:	e8 7e 0b 00 00       	call   1d93 <exit>
  pid = fork();
    1215:	e8 71 0b 00 00       	call   1d8b <fork>
  if(pid == -1)
    121a:	83 f8 ff             	cmp    $0xffffffff,%eax
    121d:	0f 84 07 01 00 00    	je     132a <runcmd+0x1aa>
    if(fork1() == 0)
    1223:	85 c0                	test   %eax,%eax
    1225:	75 e9                	jne    1210 <runcmd+0x90>
    1227:	eb 6b                	jmp    1294 <runcmd+0x114>
    if(ecmd->argv[0] == 0)
    1229:	8b 43 04             	mov    0x4(%ebx),%eax
    122c:	85 c0                	test   %eax,%eax
    122e:	74 e0                	je     1210 <runcmd+0x90>
    exec(ecmd->argv[0], ecmd->argv);
    1230:	8d 53 04             	lea    0x4(%ebx),%edx
    1233:	51                   	push   %ecx
    1234:	51                   	push   %ecx
    1235:	52                   	push   %edx
    1236:	50                   	push   %eax
    1237:	e8 8f 0b 00 00       	call   1dcb <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    123c:	83 c4 0c             	add    $0xc,%esp
    123f:	ff 73 04             	pushl  0x4(%ebx)
    1242:	68 b2 22 00 00       	push   $0x22b2
    1247:	6a 02                	push   $0x2
    1249:	e8 b2 0c 00 00       	call   1f00 <printf>
    break;
    124e:	83 c4 10             	add    $0x10,%esp
    1251:	eb bd                	jmp    1210 <runcmd+0x90>
  pid = fork();
    1253:	e8 33 0b 00 00       	call   1d8b <fork>
  if(pid == -1)
    1258:	83 f8 ff             	cmp    $0xffffffff,%eax
    125b:	0f 84 c9 00 00 00    	je     132a <runcmd+0x1aa>
    if(fork1() == 0)
    1261:	85 c0                	test   %eax,%eax
    1263:	74 2f                	je     1294 <runcmd+0x114>
    wait();
    1265:	e8 31 0b 00 00       	call   1d9b <wait>
    runcmd(lcmd->right);
    126a:	83 ec 0c             	sub    $0xc,%esp
    126d:	ff 73 08             	pushl  0x8(%ebx)
    1270:	e8 0b ff ff ff       	call   1180 <runcmd>
    close(rcmd->fd);
    1275:	83 ec 0c             	sub    $0xc,%esp
    1278:	ff 73 14             	pushl  0x14(%ebx)
    127b:	e8 3b 0b 00 00       	call   1dbb <close>
    if(open(rcmd->file, rcmd->mode) < 0){
    1280:	58                   	pop    %eax
    1281:	5a                   	pop    %edx
    1282:	ff 73 10             	pushl  0x10(%ebx)
    1285:	ff 73 08             	pushl  0x8(%ebx)
    1288:	e8 46 0b 00 00       	call   1dd3 <open>
    128d:	83 c4 10             	add    $0x10,%esp
    1290:	85 c0                	test   %eax,%eax
    1292:	78 18                	js     12ac <runcmd+0x12c>
      runcmd(bcmd->cmd);
    1294:	83 ec 0c             	sub    $0xc,%esp
    1297:	ff 73 04             	pushl  0x4(%ebx)
    129a:	e8 e1 fe ff ff       	call   1180 <runcmd>
    panic("runcmd");
    129f:	83 ec 0c             	sub    $0xc,%esp
    12a2:	68 ab 22 00 00       	push   $0x22ab
    12a7:	e8 b4 fe ff ff       	call   1160 <panic>
      printf(2, "open %s failed\n", rcmd->file);
    12ac:	51                   	push   %ecx
    12ad:	ff 73 08             	pushl  0x8(%ebx)
    12b0:	68 c2 22 00 00       	push   $0x22c2
    12b5:	6a 02                	push   $0x2
    12b7:	e8 44 0c 00 00       	call   1f00 <printf>
      exit();
    12bc:	e8 d2 0a 00 00       	call   1d93 <exit>
      panic("pipe");
    12c1:	83 ec 0c             	sub    $0xc,%esp
    12c4:	68 d7 22 00 00       	push   $0x22d7
    12c9:	e8 92 fe ff ff       	call   1160 <panic>
      close(1);
    12ce:	83 ec 0c             	sub    $0xc,%esp
    12d1:	6a 01                	push   $0x1
    12d3:	e8 e3 0a 00 00       	call   1dbb <close>
      dup(p[1]);
    12d8:	58                   	pop    %eax
    12d9:	ff 75 f4             	pushl  -0xc(%ebp)
    12dc:	e8 2a 0b 00 00       	call   1e0b <dup>
      close(p[0]);
    12e1:	58                   	pop    %eax
    12e2:	ff 75 f0             	pushl  -0x10(%ebp)
    12e5:	e8 d1 0a 00 00       	call   1dbb <close>
      close(p[1]);
    12ea:	58                   	pop    %eax
    12eb:	ff 75 f4             	pushl  -0xc(%ebp)
    12ee:	e8 c8 0a 00 00       	call   1dbb <close>
      runcmd(pcmd->left);
    12f3:	5a                   	pop    %edx
    12f4:	ff 73 04             	pushl  0x4(%ebx)
    12f7:	e8 84 fe ff ff       	call   1180 <runcmd>
      close(0);
    12fc:	83 ec 0c             	sub    $0xc,%esp
    12ff:	6a 00                	push   $0x0
    1301:	e8 b5 0a 00 00       	call   1dbb <close>
      dup(p[0]);
    1306:	5a                   	pop    %edx
    1307:	ff 75 f0             	pushl  -0x10(%ebp)
    130a:	e8 fc 0a 00 00       	call   1e0b <dup>
      close(p[0]);
    130f:	59                   	pop    %ecx
    1310:	ff 75 f0             	pushl  -0x10(%ebp)
    1313:	e8 a3 0a 00 00       	call   1dbb <close>
      close(p[1]);
    1318:	58                   	pop    %eax
    1319:	ff 75 f4             	pushl  -0xc(%ebp)
    131c:	e8 9a 0a 00 00       	call   1dbb <close>
      runcmd(pcmd->right);
    1321:	58                   	pop    %eax
    1322:	ff 73 08             	pushl  0x8(%ebx)
    1325:	e8 56 fe ff ff       	call   1180 <runcmd>
    panic("fork");
    132a:	83 ec 0c             	sub    $0xc,%esp
    132d:	68 d2 22 00 00       	push   $0x22d2
    1332:	e8 29 fe ff ff       	call   1160 <panic>
    1337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    133e:	66 90                	xchg   %ax,%ax

00001340 <fork1>:
{
    1340:	f3 0f 1e fb          	endbr32 
    1344:	55                   	push   %ebp
    1345:	89 e5                	mov    %esp,%ebp
    1347:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
    134a:	e8 3c 0a 00 00       	call   1d8b <fork>
  if(pid == -1)
    134f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1352:	74 02                	je     1356 <fork1+0x16>
  return pid;
}
    1354:	c9                   	leave  
    1355:	c3                   	ret    
    panic("fork");
    1356:	83 ec 0c             	sub    $0xc,%esp
    1359:	68 d2 22 00 00       	push   $0x22d2
    135e:	e8 fd fd ff ff       	call   1160 <panic>
    1363:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    136a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001370 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
    1370:	f3 0f 1e fb          	endbr32 
    1374:	55                   	push   %ebp
    1375:	89 e5                	mov    %esp,%ebp
    1377:	53                   	push   %ebx
    1378:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    137b:	6a 54                	push   $0x54
    137d:	e8 de 0d 00 00       	call   2160 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    1382:	83 c4 0c             	add    $0xc,%esp
    1385:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
    1387:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1389:	6a 00                	push   $0x0
    138b:	50                   	push   %eax
    138c:	e8 5f 08 00 00       	call   1bf0 <memset>
  cmd->type = EXEC;
    1391:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
    1397:	89 d8                	mov    %ebx,%eax
    1399:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    139c:	c9                   	leave  
    139d:	c3                   	ret    
    139e:	66 90                	xchg   %ax,%ax

000013a0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
    13a0:	f3 0f 1e fb          	endbr32 
    13a4:	55                   	push   %ebp
    13a5:	89 e5                	mov    %esp,%ebp
    13a7:	53                   	push   %ebx
    13a8:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13ab:	6a 18                	push   $0x18
    13ad:	e8 ae 0d 00 00       	call   2160 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    13b2:	83 c4 0c             	add    $0xc,%esp
    13b5:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
    13b7:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    13b9:	6a 00                	push   $0x0
    13bb:	50                   	push   %eax
    13bc:	e8 2f 08 00 00       	call   1bf0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
    13c1:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
    13c4:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
    13ca:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
    13cd:	8b 45 0c             	mov    0xc(%ebp),%eax
    13d0:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
    13d3:	8b 45 10             	mov    0x10(%ebp),%eax
    13d6:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
    13d9:	8b 45 14             	mov    0x14(%ebp),%eax
    13dc:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
    13df:	8b 45 18             	mov    0x18(%ebp),%eax
    13e2:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
    13e5:	89 d8                	mov    %ebx,%eax
    13e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13ea:	c9                   	leave  
    13eb:	c3                   	ret    
    13ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000013f0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
    13f0:	f3 0f 1e fb          	endbr32 
    13f4:	55                   	push   %ebp
    13f5:	89 e5                	mov    %esp,%ebp
    13f7:	53                   	push   %ebx
    13f8:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
    13fb:	6a 0c                	push   $0xc
    13fd:	e8 5e 0d 00 00       	call   2160 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    1402:	83 c4 0c             	add    $0xc,%esp
    1405:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
    1407:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1409:	6a 00                	push   $0x0
    140b:	50                   	push   %eax
    140c:	e8 df 07 00 00       	call   1bf0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
    1411:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
    1414:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
    141a:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
    141d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1420:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
    1423:	89 d8                	mov    %ebx,%eax
    1425:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1428:	c9                   	leave  
    1429:	c3                   	ret    
    142a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001430 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
    1430:	f3 0f 1e fb          	endbr32 
    1434:	55                   	push   %ebp
    1435:	89 e5                	mov    %esp,%ebp
    1437:	53                   	push   %ebx
    1438:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    143b:	6a 0c                	push   $0xc
    143d:	e8 1e 0d 00 00       	call   2160 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    1442:	83 c4 0c             	add    $0xc,%esp
    1445:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
    1447:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1449:	6a 00                	push   $0x0
    144b:	50                   	push   %eax
    144c:	e8 9f 07 00 00       	call   1bf0 <memset>
  cmd->type = LIST;
  cmd->left = left;
    1451:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
    1454:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
    145a:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
    145d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1460:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
    1463:	89 d8                	mov    %ebx,%eax
    1465:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1468:	c9                   	leave  
    1469:	c3                   	ret    
    146a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001470 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
    1470:	f3 0f 1e fb          	endbr32 
    1474:	55                   	push   %ebp
    1475:	89 e5                	mov    %esp,%ebp
    1477:	53                   	push   %ebx
    1478:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
    147b:	6a 08                	push   $0x8
    147d:	e8 de 0c 00 00       	call   2160 <malloc>
  memset(cmd, 0, sizeof(*cmd));
    1482:	83 c4 0c             	add    $0xc,%esp
    1485:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
    1487:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
    1489:	6a 00                	push   $0x0
    148b:	50                   	push   %eax
    148c:	e8 5f 07 00 00       	call   1bf0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
    1491:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
    1494:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
    149a:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
    149d:	89 d8                	mov    %ebx,%eax
    149f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    14a2:	c9                   	leave  
    14a3:	c3                   	ret    
    14a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14af:	90                   	nop

000014b0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
    14b0:	f3 0f 1e fb          	endbr32 
    14b4:	55                   	push   %ebp
    14b5:	89 e5                	mov    %esp,%ebp
    14b7:	57                   	push   %edi
    14b8:	56                   	push   %esi
    14b9:	53                   	push   %ebx
    14ba:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
    14bd:	8b 45 08             	mov    0x8(%ebp),%eax
{
    14c0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    14c3:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
    14c6:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
    14c8:	39 df                	cmp    %ebx,%edi
    14ca:	72 0b                	jb     14d7 <gettoken+0x27>
    14cc:	eb 21                	jmp    14ef <gettoken+0x3f>
    14ce:	66 90                	xchg   %ax,%ax
    s++;
    14d0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
    14d3:	39 fb                	cmp    %edi,%ebx
    14d5:	74 18                	je     14ef <gettoken+0x3f>
    14d7:	0f be 07             	movsbl (%edi),%eax
    14da:	83 ec 08             	sub    $0x8,%esp
    14dd:	50                   	push   %eax
    14de:	68 b0 29 00 00       	push   $0x29b0
    14e3:	e8 28 07 00 00       	call   1c10 <strchr>
    14e8:	83 c4 10             	add    $0x10,%esp
    14eb:	85 c0                	test   %eax,%eax
    14ed:	75 e1                	jne    14d0 <gettoken+0x20>
  if(q)
    14ef:	85 f6                	test   %esi,%esi
    14f1:	74 02                	je     14f5 <gettoken+0x45>
    *q = s;
    14f3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
    14f5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
    14f8:	3c 3c                	cmp    $0x3c,%al
    14fa:	0f 8f d0 00 00 00    	jg     15d0 <gettoken+0x120>
    1500:	3c 3a                	cmp    $0x3a,%al
    1502:	0f 8f b4 00 00 00    	jg     15bc <gettoken+0x10c>
    1508:	84 c0                	test   %al,%al
    150a:	75 44                	jne    1550 <gettoken+0xa0>
    150c:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    150e:	8b 55 14             	mov    0x14(%ebp),%edx
    1511:	85 d2                	test   %edx,%edx
    1513:	74 05                	je     151a <gettoken+0x6a>
    *eq = s;
    1515:	8b 45 14             	mov    0x14(%ebp),%eax
    1518:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
    151a:	39 df                	cmp    %ebx,%edi
    151c:	72 09                	jb     1527 <gettoken+0x77>
    151e:	eb 1f                	jmp    153f <gettoken+0x8f>
    s++;
    1520:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
    1523:	39 fb                	cmp    %edi,%ebx
    1525:	74 18                	je     153f <gettoken+0x8f>
    1527:	0f be 07             	movsbl (%edi),%eax
    152a:	83 ec 08             	sub    $0x8,%esp
    152d:	50                   	push   %eax
    152e:	68 b0 29 00 00       	push   $0x29b0
    1533:	e8 d8 06 00 00       	call   1c10 <strchr>
    1538:	83 c4 10             	add    $0x10,%esp
    153b:	85 c0                	test   %eax,%eax
    153d:	75 e1                	jne    1520 <gettoken+0x70>
  *ps = s;
    153f:	8b 45 08             	mov    0x8(%ebp),%eax
    1542:	89 38                	mov    %edi,(%eax)
  return ret;
}
    1544:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1547:	89 f0                	mov    %esi,%eax
    1549:	5b                   	pop    %ebx
    154a:	5e                   	pop    %esi
    154b:	5f                   	pop    %edi
    154c:	5d                   	pop    %ebp
    154d:	c3                   	ret    
    154e:	66 90                	xchg   %ax,%ax
  switch(*s){
    1550:	79 5e                	jns    15b0 <gettoken+0x100>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    1552:	39 fb                	cmp    %edi,%ebx
    1554:	77 34                	ja     158a <gettoken+0xda>
  if(eq)
    1556:	8b 45 14             	mov    0x14(%ebp),%eax
    1559:	be 61 00 00 00       	mov    $0x61,%esi
    155e:	85 c0                	test   %eax,%eax
    1560:	75 b3                	jne    1515 <gettoken+0x65>
    1562:	eb db                	jmp    153f <gettoken+0x8f>
    1564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    1568:	0f be 07             	movsbl (%edi),%eax
    156b:	83 ec 08             	sub    $0x8,%esp
    156e:	50                   	push   %eax
    156f:	68 a8 29 00 00       	push   $0x29a8
    1574:	e8 97 06 00 00       	call   1c10 <strchr>
    1579:	83 c4 10             	add    $0x10,%esp
    157c:	85 c0                	test   %eax,%eax
    157e:	75 22                	jne    15a2 <gettoken+0xf2>
      s++;
    1580:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
    1583:	39 fb                	cmp    %edi,%ebx
    1585:	74 cf                	je     1556 <gettoken+0xa6>
    1587:	0f b6 07             	movzbl (%edi),%eax
    158a:	83 ec 08             	sub    $0x8,%esp
    158d:	0f be f0             	movsbl %al,%esi
    1590:	56                   	push   %esi
    1591:	68 b0 29 00 00       	push   $0x29b0
    1596:	e8 75 06 00 00       	call   1c10 <strchr>
    159b:	83 c4 10             	add    $0x10,%esp
    159e:	85 c0                	test   %eax,%eax
    15a0:	74 c6                	je     1568 <gettoken+0xb8>
    ret = 'a';
    15a2:	be 61 00 00 00       	mov    $0x61,%esi
    15a7:	e9 62 ff ff ff       	jmp    150e <gettoken+0x5e>
    15ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
    15b0:	3c 26                	cmp    $0x26,%al
    15b2:	74 08                	je     15bc <gettoken+0x10c>
    15b4:	8d 48 d8             	lea    -0x28(%eax),%ecx
    15b7:	80 f9 01             	cmp    $0x1,%cl
    15ba:	77 96                	ja     1552 <gettoken+0xa2>
  ret = *s;
    15bc:	0f be f0             	movsbl %al,%esi
    s++;
    15bf:	83 c7 01             	add    $0x1,%edi
    break;
    15c2:	e9 47 ff ff ff       	jmp    150e <gettoken+0x5e>
    15c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15ce:	66 90                	xchg   %ax,%ax
  switch(*s){
    15d0:	3c 3e                	cmp    $0x3e,%al
    15d2:	75 1c                	jne    15f0 <gettoken+0x140>
    if(*s == '>'){
    15d4:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    s++;
    15d8:	8d 47 01             	lea    0x1(%edi),%eax
    if(*s == '>'){
    15db:	74 1c                	je     15f9 <gettoken+0x149>
    s++;
    15dd:	89 c7                	mov    %eax,%edi
    15df:	be 3e 00 00 00       	mov    $0x3e,%esi
    15e4:	e9 25 ff ff ff       	jmp    150e <gettoken+0x5e>
    15e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
    15f0:	3c 7c                	cmp    $0x7c,%al
    15f2:	74 c8                	je     15bc <gettoken+0x10c>
    15f4:	e9 59 ff ff ff       	jmp    1552 <gettoken+0xa2>
      s++;
    15f9:	83 c7 02             	add    $0x2,%edi
      ret = '+';
    15fc:	be 2b 00 00 00       	mov    $0x2b,%esi
    1601:	e9 08 ff ff ff       	jmp    150e <gettoken+0x5e>
    1606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    160d:	8d 76 00             	lea    0x0(%esi),%esi

00001610 <peek>:

int
peek(char **ps, char *es, char *toks)
{
    1610:	f3 0f 1e fb          	endbr32 
    1614:	55                   	push   %ebp
    1615:	89 e5                	mov    %esp,%ebp
    1617:	57                   	push   %edi
    1618:	56                   	push   %esi
    1619:	53                   	push   %ebx
    161a:	83 ec 0c             	sub    $0xc,%esp
    161d:	8b 7d 08             	mov    0x8(%ebp),%edi
    1620:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
    1623:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
    1625:	39 f3                	cmp    %esi,%ebx
    1627:	72 0e                	jb     1637 <peek+0x27>
    1629:	eb 24                	jmp    164f <peek+0x3f>
    162b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    162f:	90                   	nop
    s++;
    1630:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
    1633:	39 de                	cmp    %ebx,%esi
    1635:	74 18                	je     164f <peek+0x3f>
    1637:	0f be 03             	movsbl (%ebx),%eax
    163a:	83 ec 08             	sub    $0x8,%esp
    163d:	50                   	push   %eax
    163e:	68 b0 29 00 00       	push   $0x29b0
    1643:	e8 c8 05 00 00       	call   1c10 <strchr>
    1648:	83 c4 10             	add    $0x10,%esp
    164b:	85 c0                	test   %eax,%eax
    164d:	75 e1                	jne    1630 <peek+0x20>
  *ps = s;
    164f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
    1651:	0f be 03             	movsbl (%ebx),%eax
    1654:	31 d2                	xor    %edx,%edx
    1656:	84 c0                	test   %al,%al
    1658:	75 0e                	jne    1668 <peek+0x58>
}
    165a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    165d:	89 d0                	mov    %edx,%eax
    165f:	5b                   	pop    %ebx
    1660:	5e                   	pop    %esi
    1661:	5f                   	pop    %edi
    1662:	5d                   	pop    %ebp
    1663:	c3                   	ret    
    1664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
    1668:	83 ec 08             	sub    $0x8,%esp
    166b:	50                   	push   %eax
    166c:	ff 75 10             	pushl  0x10(%ebp)
    166f:	e8 9c 05 00 00       	call   1c10 <strchr>
    1674:	83 c4 10             	add    $0x10,%esp
    1677:	31 d2                	xor    %edx,%edx
    1679:	85 c0                	test   %eax,%eax
    167b:	0f 95 c2             	setne  %dl
}
    167e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1681:	5b                   	pop    %ebx
    1682:	89 d0                	mov    %edx,%eax
    1684:	5e                   	pop    %esi
    1685:	5f                   	pop    %edi
    1686:	5d                   	pop    %ebp
    1687:	c3                   	ret    
    1688:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    168f:	90                   	nop

00001690 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
    1690:	f3 0f 1e fb          	endbr32 
    1694:	55                   	push   %ebp
    1695:	89 e5                	mov    %esp,%ebp
    1697:	57                   	push   %edi
    1698:	56                   	push   %esi
    1699:	53                   	push   %ebx
    169a:	83 ec 1c             	sub    $0x1c,%esp
    169d:	8b 75 0c             	mov    0xc(%ebp),%esi
    16a0:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    16a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    16a7:	90                   	nop
    16a8:	83 ec 04             	sub    $0x4,%esp
    16ab:	68 f9 22 00 00       	push   $0x22f9
    16b0:	53                   	push   %ebx
    16b1:	56                   	push   %esi
    16b2:	e8 59 ff ff ff       	call   1610 <peek>
    16b7:	83 c4 10             	add    $0x10,%esp
    16ba:	85 c0                	test   %eax,%eax
    16bc:	74 6a                	je     1728 <parseredirs+0x98>
    tok = gettoken(ps, es, 0, 0);
    16be:	6a 00                	push   $0x0
    16c0:	6a 00                	push   $0x0
    16c2:	53                   	push   %ebx
    16c3:	56                   	push   %esi
    16c4:	e8 e7 fd ff ff       	call   14b0 <gettoken>
    16c9:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
    16cb:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    16ce:	50                   	push   %eax
    16cf:	8d 45 e0             	lea    -0x20(%ebp),%eax
    16d2:	50                   	push   %eax
    16d3:	53                   	push   %ebx
    16d4:	56                   	push   %esi
    16d5:	e8 d6 fd ff ff       	call   14b0 <gettoken>
    16da:	83 c4 20             	add    $0x20,%esp
    16dd:	83 f8 61             	cmp    $0x61,%eax
    16e0:	75 51                	jne    1733 <parseredirs+0xa3>
      panic("missing file for redirection");
    switch(tok){
    16e2:	83 ff 3c             	cmp    $0x3c,%edi
    16e5:	74 31                	je     1718 <parseredirs+0x88>
    16e7:	83 ff 3e             	cmp    $0x3e,%edi
    16ea:	74 05                	je     16f1 <parseredirs+0x61>
    16ec:	83 ff 2b             	cmp    $0x2b,%edi
    16ef:	75 b7                	jne    16a8 <parseredirs+0x18>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    16f1:	83 ec 0c             	sub    $0xc,%esp
    16f4:	6a 01                	push   $0x1
    16f6:	68 01 02 00 00       	push   $0x201
    16fb:	ff 75 e4             	pushl  -0x1c(%ebp)
    16fe:	ff 75 e0             	pushl  -0x20(%ebp)
    1701:	ff 75 08             	pushl  0x8(%ebp)
    1704:	e8 97 fc ff ff       	call   13a0 <redircmd>
      break;
    1709:	83 c4 20             	add    $0x20,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
    170c:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
    170f:	eb 97                	jmp    16a8 <parseredirs+0x18>
    1711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
    1718:	83 ec 0c             	sub    $0xc,%esp
    171b:	6a 00                	push   $0x0
    171d:	6a 00                	push   $0x0
    171f:	eb da                	jmp    16fb <parseredirs+0x6b>
    1721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  return cmd;
}
    1728:	8b 45 08             	mov    0x8(%ebp),%eax
    172b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    172e:	5b                   	pop    %ebx
    172f:	5e                   	pop    %esi
    1730:	5f                   	pop    %edi
    1731:	5d                   	pop    %ebp
    1732:	c3                   	ret    
      panic("missing file for redirection");
    1733:	83 ec 0c             	sub    $0xc,%esp
    1736:	68 dc 22 00 00       	push   $0x22dc
    173b:	e8 20 fa ff ff       	call   1160 <panic>

00001740 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
    1740:	f3 0f 1e fb          	endbr32 
    1744:	55                   	push   %ebp
    1745:	89 e5                	mov    %esp,%ebp
    1747:	57                   	push   %edi
    1748:	56                   	push   %esi
    1749:	53                   	push   %ebx
    174a:	83 ec 30             	sub    $0x30,%esp
    174d:	8b 75 08             	mov    0x8(%ebp),%esi
    1750:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    1753:	68 fc 22 00 00       	push   $0x22fc
    1758:	57                   	push   %edi
    1759:	56                   	push   %esi
    175a:	e8 b1 fe ff ff       	call   1610 <peek>
    175f:	83 c4 10             	add    $0x10,%esp
    1762:	85 c0                	test   %eax,%eax
    1764:	0f 85 96 00 00 00    	jne    1800 <parseexec+0xc0>
    176a:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
    176c:	e8 ff fb ff ff       	call   1370 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
    1771:	83 ec 04             	sub    $0x4,%esp
    1774:	57                   	push   %edi
    1775:	56                   	push   %esi
    1776:	50                   	push   %eax
  ret = execcmd();
    1777:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
    177a:	e8 11 ff ff ff       	call   1690 <parseredirs>
  while(!peek(ps, es, "|)&;")){
    177f:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
    1782:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
    1785:	eb 1c                	jmp    17a3 <parseexec+0x63>
    1787:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    178e:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
    1790:	83 ec 04             	sub    $0x4,%esp
    1793:	57                   	push   %edi
    1794:	56                   	push   %esi
    1795:	ff 75 d4             	pushl  -0x2c(%ebp)
    1798:	e8 f3 fe ff ff       	call   1690 <parseredirs>
    179d:	83 c4 10             	add    $0x10,%esp
    17a0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
    17a3:	83 ec 04             	sub    $0x4,%esp
    17a6:	68 13 23 00 00       	push   $0x2313
    17ab:	57                   	push   %edi
    17ac:	56                   	push   %esi
    17ad:	e8 5e fe ff ff       	call   1610 <peek>
    17b2:	83 c4 10             	add    $0x10,%esp
    17b5:	85 c0                	test   %eax,%eax
    17b7:	75 67                	jne    1820 <parseexec+0xe0>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
    17b9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    17bc:	50                   	push   %eax
    17bd:	8d 45 e0             	lea    -0x20(%ebp),%eax
    17c0:	50                   	push   %eax
    17c1:	57                   	push   %edi
    17c2:	56                   	push   %esi
    17c3:	e8 e8 fc ff ff       	call   14b0 <gettoken>
    17c8:	83 c4 10             	add    $0x10,%esp
    17cb:	85 c0                	test   %eax,%eax
    17cd:	74 51                	je     1820 <parseexec+0xe0>
    if(tok != 'a')
    17cf:	83 f8 61             	cmp    $0x61,%eax
    17d2:	75 6b                	jne    183f <parseexec+0xff>
    cmd->argv[argc] = q;
    17d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    17d7:	8b 55 d0             	mov    -0x30(%ebp),%edx
    17da:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
    17de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    17e1:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
    17e5:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
    17e8:	83 fb 0a             	cmp    $0xa,%ebx
    17eb:	75 a3                	jne    1790 <parseexec+0x50>
      panic("too many args");
    17ed:	83 ec 0c             	sub    $0xc,%esp
    17f0:	68 05 23 00 00       	push   $0x2305
    17f5:	e8 66 f9 ff ff       	call   1160 <panic>
    17fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
    1800:	83 ec 08             	sub    $0x8,%esp
    1803:	57                   	push   %edi
    1804:	56                   	push   %esi
    1805:	e8 66 01 00 00       	call   1970 <parseblock>
    180a:	83 c4 10             	add    $0x10,%esp
    180d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
    1810:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1813:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1816:	5b                   	pop    %ebx
    1817:	5e                   	pop    %esi
    1818:	5f                   	pop    %edi
    1819:	5d                   	pop    %ebp
    181a:	c3                   	ret    
    181b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    181f:	90                   	nop
  cmd->argv[argc] = 0;
    1820:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1823:	8d 04 98             	lea    (%eax,%ebx,4),%eax
    1826:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
    182d:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
    1834:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1837:	8d 65 f4             	lea    -0xc(%ebp),%esp
    183a:	5b                   	pop    %ebx
    183b:	5e                   	pop    %esi
    183c:	5f                   	pop    %edi
    183d:	5d                   	pop    %ebp
    183e:	c3                   	ret    
      panic("syntax");
    183f:	83 ec 0c             	sub    $0xc,%esp
    1842:	68 fe 22 00 00       	push   $0x22fe
    1847:	e8 14 f9 ff ff       	call   1160 <panic>
    184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001850 <parsepipe>:
{
    1850:	f3 0f 1e fb          	endbr32 
    1854:	55                   	push   %ebp
    1855:	89 e5                	mov    %esp,%ebp
    1857:	57                   	push   %edi
    1858:	56                   	push   %esi
    1859:	53                   	push   %ebx
    185a:	83 ec 14             	sub    $0x14,%esp
    185d:	8b 75 08             	mov    0x8(%ebp),%esi
    1860:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
    1863:	57                   	push   %edi
    1864:	56                   	push   %esi
    1865:	e8 d6 fe ff ff       	call   1740 <parseexec>
  if(peek(ps, es, "|")){
    186a:	83 c4 0c             	add    $0xc,%esp
    186d:	68 18 23 00 00       	push   $0x2318
  cmd = parseexec(ps, es);
    1872:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
    1874:	57                   	push   %edi
    1875:	56                   	push   %esi
    1876:	e8 95 fd ff ff       	call   1610 <peek>
    187b:	83 c4 10             	add    $0x10,%esp
    187e:	85 c0                	test   %eax,%eax
    1880:	75 0e                	jne    1890 <parsepipe+0x40>
}
    1882:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1885:	89 d8                	mov    %ebx,%eax
    1887:	5b                   	pop    %ebx
    1888:	5e                   	pop    %esi
    1889:	5f                   	pop    %edi
    188a:	5d                   	pop    %ebp
    188b:	c3                   	ret    
    188c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
    1890:	6a 00                	push   $0x0
    1892:	6a 00                	push   $0x0
    1894:	57                   	push   %edi
    1895:	56                   	push   %esi
    1896:	e8 15 fc ff ff       	call   14b0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
    189b:	58                   	pop    %eax
    189c:	5a                   	pop    %edx
    189d:	57                   	push   %edi
    189e:	56                   	push   %esi
    189f:	e8 ac ff ff ff       	call   1850 <parsepipe>
    18a4:	89 5d 08             	mov    %ebx,0x8(%ebp)
    18a7:	83 c4 10             	add    $0x10,%esp
    18aa:	89 45 0c             	mov    %eax,0xc(%ebp)
}
    18ad:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18b0:	5b                   	pop    %ebx
    18b1:	5e                   	pop    %esi
    18b2:	5f                   	pop    %edi
    18b3:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
    18b4:	e9 37 fb ff ff       	jmp    13f0 <pipecmd>
    18b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000018c0 <parseline>:
{
    18c0:	f3 0f 1e fb          	endbr32 
    18c4:	55                   	push   %ebp
    18c5:	89 e5                	mov    %esp,%ebp
    18c7:	57                   	push   %edi
    18c8:	56                   	push   %esi
    18c9:	53                   	push   %ebx
    18ca:	83 ec 14             	sub    $0x14,%esp
    18cd:	8b 75 08             	mov    0x8(%ebp),%esi
    18d0:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
    18d3:	57                   	push   %edi
    18d4:	56                   	push   %esi
    18d5:	e8 76 ff ff ff       	call   1850 <parsepipe>
  while(peek(ps, es, "&")){
    18da:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
    18dd:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
    18df:	eb 1f                	jmp    1900 <parseline+0x40>
    18e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
    18e8:	6a 00                	push   $0x0
    18ea:	6a 00                	push   $0x0
    18ec:	57                   	push   %edi
    18ed:	56                   	push   %esi
    18ee:	e8 bd fb ff ff       	call   14b0 <gettoken>
    cmd = backcmd(cmd);
    18f3:	89 1c 24             	mov    %ebx,(%esp)
    18f6:	e8 75 fb ff ff       	call   1470 <backcmd>
    18fb:	83 c4 10             	add    $0x10,%esp
    18fe:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
    1900:	83 ec 04             	sub    $0x4,%esp
    1903:	68 1a 23 00 00       	push   $0x231a
    1908:	57                   	push   %edi
    1909:	56                   	push   %esi
    190a:	e8 01 fd ff ff       	call   1610 <peek>
    190f:	83 c4 10             	add    $0x10,%esp
    1912:	85 c0                	test   %eax,%eax
    1914:	75 d2                	jne    18e8 <parseline+0x28>
  if(peek(ps, es, ";")){
    1916:	83 ec 04             	sub    $0x4,%esp
    1919:	68 16 23 00 00       	push   $0x2316
    191e:	57                   	push   %edi
    191f:	56                   	push   %esi
    1920:	e8 eb fc ff ff       	call   1610 <peek>
    1925:	83 c4 10             	add    $0x10,%esp
    1928:	85 c0                	test   %eax,%eax
    192a:	75 14                	jne    1940 <parseline+0x80>
}
    192c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    192f:	89 d8                	mov    %ebx,%eax
    1931:	5b                   	pop    %ebx
    1932:	5e                   	pop    %esi
    1933:	5f                   	pop    %edi
    1934:	5d                   	pop    %ebp
    1935:	c3                   	ret    
    1936:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    193d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
    1940:	6a 00                	push   $0x0
    1942:	6a 00                	push   $0x0
    1944:	57                   	push   %edi
    1945:	56                   	push   %esi
    1946:	e8 65 fb ff ff       	call   14b0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
    194b:	58                   	pop    %eax
    194c:	5a                   	pop    %edx
    194d:	57                   	push   %edi
    194e:	56                   	push   %esi
    194f:	e8 6c ff ff ff       	call   18c0 <parseline>
    1954:	89 5d 08             	mov    %ebx,0x8(%ebp)
    1957:	83 c4 10             	add    $0x10,%esp
    195a:	89 45 0c             	mov    %eax,0xc(%ebp)
}
    195d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1960:	5b                   	pop    %ebx
    1961:	5e                   	pop    %esi
    1962:	5f                   	pop    %edi
    1963:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
    1964:	e9 c7 fa ff ff       	jmp    1430 <listcmd>
    1969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001970 <parseblock>:
{
    1970:	f3 0f 1e fb          	endbr32 
    1974:	55                   	push   %ebp
    1975:	89 e5                	mov    %esp,%ebp
    1977:	57                   	push   %edi
    1978:	56                   	push   %esi
    1979:	53                   	push   %ebx
    197a:	83 ec 10             	sub    $0x10,%esp
    197d:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1980:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
    1983:	68 fc 22 00 00       	push   $0x22fc
    1988:	56                   	push   %esi
    1989:	53                   	push   %ebx
    198a:	e8 81 fc ff ff       	call   1610 <peek>
    198f:	83 c4 10             	add    $0x10,%esp
    1992:	85 c0                	test   %eax,%eax
    1994:	74 4a                	je     19e0 <parseblock+0x70>
  gettoken(ps, es, 0, 0);
    1996:	6a 00                	push   $0x0
    1998:	6a 00                	push   $0x0
    199a:	56                   	push   %esi
    199b:	53                   	push   %ebx
    199c:	e8 0f fb ff ff       	call   14b0 <gettoken>
  cmd = parseline(ps, es);
    19a1:	58                   	pop    %eax
    19a2:	5a                   	pop    %edx
    19a3:	56                   	push   %esi
    19a4:	53                   	push   %ebx
    19a5:	e8 16 ff ff ff       	call   18c0 <parseline>
  if(!peek(ps, es, ")"))
    19aa:	83 c4 0c             	add    $0xc,%esp
    19ad:	68 38 23 00 00       	push   $0x2338
  cmd = parseline(ps, es);
    19b2:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
    19b4:	56                   	push   %esi
    19b5:	53                   	push   %ebx
    19b6:	e8 55 fc ff ff       	call   1610 <peek>
    19bb:	83 c4 10             	add    $0x10,%esp
    19be:	85 c0                	test   %eax,%eax
    19c0:	74 2b                	je     19ed <parseblock+0x7d>
  gettoken(ps, es, 0, 0);
    19c2:	6a 00                	push   $0x0
    19c4:	6a 00                	push   $0x0
    19c6:	56                   	push   %esi
    19c7:	53                   	push   %ebx
    19c8:	e8 e3 fa ff ff       	call   14b0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
    19cd:	83 c4 0c             	add    $0xc,%esp
    19d0:	56                   	push   %esi
    19d1:	53                   	push   %ebx
    19d2:	57                   	push   %edi
    19d3:	e8 b8 fc ff ff       	call   1690 <parseredirs>
}
    19d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    19db:	5b                   	pop    %ebx
    19dc:	5e                   	pop    %esi
    19dd:	5f                   	pop    %edi
    19de:	5d                   	pop    %ebp
    19df:	c3                   	ret    
    panic("parseblock");
    19e0:	83 ec 0c             	sub    $0xc,%esp
    19e3:	68 1c 23 00 00       	push   $0x231c
    19e8:	e8 73 f7 ff ff       	call   1160 <panic>
    panic("syntax - missing )");
    19ed:	83 ec 0c             	sub    $0xc,%esp
    19f0:	68 27 23 00 00       	push   $0x2327
    19f5:	e8 66 f7 ff ff       	call   1160 <panic>
    19fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001a00 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
    1a00:	f3 0f 1e fb          	endbr32 
    1a04:	55                   	push   %ebp
    1a05:	89 e5                	mov    %esp,%ebp
    1a07:	53                   	push   %ebx
    1a08:	83 ec 04             	sub    $0x4,%esp
    1a0b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    1a0e:	85 db                	test   %ebx,%ebx
    1a10:	0f 84 9a 00 00 00    	je     1ab0 <nulterminate+0xb0>
    return 0;

  switch(cmd->type){
    1a16:	83 3b 05             	cmpl   $0x5,(%ebx)
    1a19:	77 6d                	ja     1a88 <nulterminate+0x88>
    1a1b:	8b 03                	mov    (%ebx),%eax
    1a1d:	3e ff 24 85 78 23 00 	notrack jmp *0x2378(,%eax,4)
    1a24:	00 
    1a25:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    1a28:	83 ec 0c             	sub    $0xc,%esp
    1a2b:	ff 73 04             	pushl  0x4(%ebx)
    1a2e:	e8 cd ff ff ff       	call   1a00 <nulterminate>
    nulterminate(lcmd->right);
    1a33:	58                   	pop    %eax
    1a34:	ff 73 08             	pushl  0x8(%ebx)
    1a37:	e8 c4 ff ff ff       	call   1a00 <nulterminate>
    break;
    1a3c:	83 c4 10             	add    $0x10,%esp
    1a3f:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
    1a41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1a44:	c9                   	leave  
    1a45:	c3                   	ret    
    1a46:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1a4d:	8d 76 00             	lea    0x0(%esi),%esi
    nulterminate(bcmd->cmd);
    1a50:	83 ec 0c             	sub    $0xc,%esp
    1a53:	ff 73 04             	pushl  0x4(%ebx)
    1a56:	e8 a5 ff ff ff       	call   1a00 <nulterminate>
    break;
    1a5b:	89 d8                	mov    %ebx,%eax
    1a5d:	83 c4 10             	add    $0x10,%esp
}
    1a60:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1a63:	c9                   	leave  
    1a64:	c3                   	ret    
    1a65:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
    1a68:	8b 4b 04             	mov    0x4(%ebx),%ecx
    1a6b:	8d 43 08             	lea    0x8(%ebx),%eax
    1a6e:	85 c9                	test   %ecx,%ecx
    1a70:	74 16                	je     1a88 <nulterminate+0x88>
    1a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    1a78:	8b 50 24             	mov    0x24(%eax),%edx
    1a7b:	83 c0 04             	add    $0x4,%eax
    1a7e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
    1a81:	8b 50 fc             	mov    -0x4(%eax),%edx
    1a84:	85 d2                	test   %edx,%edx
    1a86:	75 f0                	jne    1a78 <nulterminate+0x78>
  switch(cmd->type){
    1a88:	89 d8                	mov    %ebx,%eax
}
    1a8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1a8d:	c9                   	leave  
    1a8e:	c3                   	ret    
    1a8f:	90                   	nop
    nulterminate(rcmd->cmd);
    1a90:	83 ec 0c             	sub    $0xc,%esp
    1a93:	ff 73 04             	pushl  0x4(%ebx)
    1a96:	e8 65 ff ff ff       	call   1a00 <nulterminate>
    *rcmd->efile = 0;
    1a9b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
    1a9e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
    1aa1:	c6 00 00             	movb   $0x0,(%eax)
    break;
    1aa4:	89 d8                	mov    %ebx,%eax
}
    1aa6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1aa9:	c9                   	leave  
    1aaa:	c3                   	ret    
    1aab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1aaf:	90                   	nop
    return 0;
    1ab0:	31 c0                	xor    %eax,%eax
    1ab2:	eb 8d                	jmp    1a41 <nulterminate+0x41>
    1ab4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1abb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1abf:	90                   	nop

00001ac0 <parsecmd>:
{
    1ac0:	f3 0f 1e fb          	endbr32 
    1ac4:	55                   	push   %ebp
    1ac5:	89 e5                	mov    %esp,%ebp
    1ac7:	56                   	push   %esi
    1ac8:	53                   	push   %ebx
  es = s + strlen(s);
    1ac9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1acc:	83 ec 0c             	sub    $0xc,%esp
    1acf:	53                   	push   %ebx
    1ad0:	e8 db 00 00 00       	call   1bb0 <strlen>
  cmd = parseline(&s, es);
    1ad5:	59                   	pop    %ecx
    1ad6:	5e                   	pop    %esi
  es = s + strlen(s);
    1ad7:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
    1ad9:	8d 45 08             	lea    0x8(%ebp),%eax
    1adc:	53                   	push   %ebx
    1add:	50                   	push   %eax
    1ade:	e8 dd fd ff ff       	call   18c0 <parseline>
  peek(&s, es, "");
    1ae3:	83 c4 0c             	add    $0xc,%esp
  cmd = parseline(&s, es);
    1ae6:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
    1ae8:	8d 45 08             	lea    0x8(%ebp),%eax
    1aeb:	68 c1 22 00 00       	push   $0x22c1
    1af0:	53                   	push   %ebx
    1af1:	50                   	push   %eax
    1af2:	e8 19 fb ff ff       	call   1610 <peek>
  if(s != es){
    1af7:	8b 45 08             	mov    0x8(%ebp),%eax
    1afa:	83 c4 10             	add    $0x10,%esp
    1afd:	39 d8                	cmp    %ebx,%eax
    1aff:	75 12                	jne    1b13 <parsecmd+0x53>
  nulterminate(cmd);
    1b01:	83 ec 0c             	sub    $0xc,%esp
    1b04:	56                   	push   %esi
    1b05:	e8 f6 fe ff ff       	call   1a00 <nulterminate>
}
    1b0a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1b0d:	89 f0                	mov    %esi,%eax
    1b0f:	5b                   	pop    %ebx
    1b10:	5e                   	pop    %esi
    1b11:	5d                   	pop    %ebp
    1b12:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
    1b13:	52                   	push   %edx
    1b14:	50                   	push   %eax
    1b15:	68 3a 23 00 00       	push   $0x233a
    1b1a:	6a 02                	push   $0x2
    1b1c:	e8 df 03 00 00       	call   1f00 <printf>
    panic("syntax");
    1b21:	c7 04 24 fe 22 00 00 	movl   $0x22fe,(%esp)
    1b28:	e8 33 f6 ff ff       	call   1160 <panic>
    1b2d:	66 90                	xchg   %ax,%ax
    1b2f:	90                   	nop

00001b30 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    1b30:	f3 0f 1e fb          	endbr32 
    1b34:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1b35:	31 c0                	xor    %eax,%eax
{
    1b37:	89 e5                	mov    %esp,%ebp
    1b39:	53                   	push   %ebx
    1b3a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1b3d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1b40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1b44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1b47:	83 c0 01             	add    $0x1,%eax
    1b4a:	84 d2                	test   %dl,%dl
    1b4c:	75 f2                	jne    1b40 <strcpy+0x10>
    ;
  return os;
}
    1b4e:	89 c8                	mov    %ecx,%eax
    1b50:	5b                   	pop    %ebx
    1b51:	5d                   	pop    %ebp
    1b52:	c3                   	ret    
    1b53:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001b60 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1b60:	f3 0f 1e fb          	endbr32 
    1b64:	55                   	push   %ebp
    1b65:	89 e5                	mov    %esp,%ebp
    1b67:	53                   	push   %ebx
    1b68:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1b6b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    1b6e:	0f b6 01             	movzbl (%ecx),%eax
    1b71:	0f b6 1a             	movzbl (%edx),%ebx
    1b74:	84 c0                	test   %al,%al
    1b76:	75 19                	jne    1b91 <strcmp+0x31>
    1b78:	eb 26                	jmp    1ba0 <strcmp+0x40>
    1b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1b80:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1b84:	83 c1 01             	add    $0x1,%ecx
    1b87:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    1b8a:	0f b6 1a             	movzbl (%edx),%ebx
    1b8d:	84 c0                	test   %al,%al
    1b8f:	74 0f                	je     1ba0 <strcmp+0x40>
    1b91:	38 d8                	cmp    %bl,%al
    1b93:	74 eb                	je     1b80 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    1b95:	29 d8                	sub    %ebx,%eax
}
    1b97:	5b                   	pop    %ebx
    1b98:	5d                   	pop    %ebp
    1b99:	c3                   	ret    
    1b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1ba0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    1ba2:	29 d8                	sub    %ebx,%eax
}
    1ba4:	5b                   	pop    %ebx
    1ba5:	5d                   	pop    %ebp
    1ba6:	c3                   	ret    
    1ba7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bae:	66 90                	xchg   %ax,%ax

00001bb0 <strlen>:

uint
strlen(char *s)
{
    1bb0:	f3 0f 1e fb          	endbr32 
    1bb4:	55                   	push   %ebp
    1bb5:	89 e5                	mov    %esp,%ebp
    1bb7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    1bba:	80 3a 00             	cmpb   $0x0,(%edx)
    1bbd:	74 21                	je     1be0 <strlen+0x30>
    1bbf:	31 c0                	xor    %eax,%eax
    1bc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bc8:	83 c0 01             	add    $0x1,%eax
    1bcb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    1bcf:	89 c1                	mov    %eax,%ecx
    1bd1:	75 f5                	jne    1bc8 <strlen+0x18>
    ;
  return n;
}
    1bd3:	89 c8                	mov    %ecx,%eax
    1bd5:	5d                   	pop    %ebp
    1bd6:	c3                   	ret    
    1bd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bde:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    1be0:	31 c9                	xor    %ecx,%ecx
}
    1be2:	5d                   	pop    %ebp
    1be3:	89 c8                	mov    %ecx,%eax
    1be5:	c3                   	ret    
    1be6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bed:	8d 76 00             	lea    0x0(%esi),%esi

00001bf0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1bf0:	f3 0f 1e fb          	endbr32 
    1bf4:	55                   	push   %ebp
    1bf5:	89 e5                	mov    %esp,%ebp
    1bf7:	57                   	push   %edi
    1bf8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    1bfb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1bfe:	8b 45 0c             	mov    0xc(%ebp),%eax
    1c01:	89 d7                	mov    %edx,%edi
    1c03:	fc                   	cld    
    1c04:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1c06:	89 d0                	mov    %edx,%eax
    1c08:	5f                   	pop    %edi
    1c09:	5d                   	pop    %ebp
    1c0a:	c3                   	ret    
    1c0b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1c0f:	90                   	nop

00001c10 <strchr>:

char*
strchr(const char *s, char c)
{
    1c10:	f3 0f 1e fb          	endbr32 
    1c14:	55                   	push   %ebp
    1c15:	89 e5                	mov    %esp,%ebp
    1c17:	8b 45 08             	mov    0x8(%ebp),%eax
    1c1a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    1c1e:	0f b6 10             	movzbl (%eax),%edx
    1c21:	84 d2                	test   %dl,%dl
    1c23:	75 16                	jne    1c3b <strchr+0x2b>
    1c25:	eb 21                	jmp    1c48 <strchr+0x38>
    1c27:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1c2e:	66 90                	xchg   %ax,%ax
    1c30:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1c34:	83 c0 01             	add    $0x1,%eax
    1c37:	84 d2                	test   %dl,%dl
    1c39:	74 0d                	je     1c48 <strchr+0x38>
    if(*s == c)
    1c3b:	38 d1                	cmp    %dl,%cl
    1c3d:	75 f1                	jne    1c30 <strchr+0x20>
      return (char*)s;
  return 0;
}
    1c3f:	5d                   	pop    %ebp
    1c40:	c3                   	ret    
    1c41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1c48:	31 c0                	xor    %eax,%eax
}
    1c4a:	5d                   	pop    %ebp
    1c4b:	c3                   	ret    
    1c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001c50 <gets>:

char*
gets(char *buf, int max)
{
    1c50:	f3 0f 1e fb          	endbr32 
    1c54:	55                   	push   %ebp
    1c55:	89 e5                	mov    %esp,%ebp
    1c57:	57                   	push   %edi
    1c58:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1c59:	31 f6                	xor    %esi,%esi
{
    1c5b:	53                   	push   %ebx
    1c5c:	89 f3                	mov    %esi,%ebx
    1c5e:	83 ec 1c             	sub    $0x1c,%esp
    1c61:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1c64:	eb 33                	jmp    1c99 <gets+0x49>
    1c66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1c6d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1c70:	83 ec 04             	sub    $0x4,%esp
    1c73:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1c76:	6a 01                	push   $0x1
    1c78:	50                   	push   %eax
    1c79:	6a 00                	push   $0x0
    1c7b:	e8 2b 01 00 00       	call   1dab <read>
    if(cc < 1)
    1c80:	83 c4 10             	add    $0x10,%esp
    1c83:	85 c0                	test   %eax,%eax
    1c85:	7e 1c                	jle    1ca3 <gets+0x53>
      break;
    buf[i++] = c;
    1c87:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    1c8b:	83 c7 01             	add    $0x1,%edi
    1c8e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    1c91:	3c 0a                	cmp    $0xa,%al
    1c93:	74 23                	je     1cb8 <gets+0x68>
    1c95:	3c 0d                	cmp    $0xd,%al
    1c97:	74 1f                	je     1cb8 <gets+0x68>
  for(i=0; i+1 < max; ){
    1c99:	83 c3 01             	add    $0x1,%ebx
    1c9c:	89 fe                	mov    %edi,%esi
    1c9e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    1ca1:	7c cd                	jl     1c70 <gets+0x20>
    1ca3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    1ca5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    1ca8:	c6 03 00             	movb   $0x0,(%ebx)
}
    1cab:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cae:	5b                   	pop    %ebx
    1caf:	5e                   	pop    %esi
    1cb0:	5f                   	pop    %edi
    1cb1:	5d                   	pop    %ebp
    1cb2:	c3                   	ret    
    1cb3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1cb7:	90                   	nop
    1cb8:	8b 75 08             	mov    0x8(%ebp),%esi
    1cbb:	8b 45 08             	mov    0x8(%ebp),%eax
    1cbe:	01 de                	add    %ebx,%esi
    1cc0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    1cc2:	c6 03 00             	movb   $0x0,(%ebx)
}
    1cc5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cc8:	5b                   	pop    %ebx
    1cc9:	5e                   	pop    %esi
    1cca:	5f                   	pop    %edi
    1ccb:	5d                   	pop    %ebp
    1ccc:	c3                   	ret    
    1ccd:	8d 76 00             	lea    0x0(%esi),%esi

00001cd0 <stat>:

int
stat(char *n, struct stat *st)
{
    1cd0:	f3 0f 1e fb          	endbr32 
    1cd4:	55                   	push   %ebp
    1cd5:	89 e5                	mov    %esp,%ebp
    1cd7:	56                   	push   %esi
    1cd8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    1cd9:	83 ec 08             	sub    $0x8,%esp
    1cdc:	6a 00                	push   $0x0
    1cde:	ff 75 08             	pushl  0x8(%ebp)
    1ce1:	e8 ed 00 00 00       	call   1dd3 <open>
  if(fd < 0)
    1ce6:	83 c4 10             	add    $0x10,%esp
    1ce9:	85 c0                	test   %eax,%eax
    1ceb:	78 2b                	js     1d18 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    1ced:	83 ec 08             	sub    $0x8,%esp
    1cf0:	ff 75 0c             	pushl  0xc(%ebp)
    1cf3:	89 c3                	mov    %eax,%ebx
    1cf5:	50                   	push   %eax
    1cf6:	e8 f0 00 00 00       	call   1deb <fstat>
  close(fd);
    1cfb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    1cfe:	89 c6                	mov    %eax,%esi
  close(fd);
    1d00:	e8 b6 00 00 00       	call   1dbb <close>
  return r;
    1d05:	83 c4 10             	add    $0x10,%esp
}
    1d08:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1d0b:	89 f0                	mov    %esi,%eax
    1d0d:	5b                   	pop    %ebx
    1d0e:	5e                   	pop    %esi
    1d0f:	5d                   	pop    %ebp
    1d10:	c3                   	ret    
    1d11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1d18:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1d1d:	eb e9                	jmp    1d08 <stat+0x38>
    1d1f:	90                   	nop

00001d20 <atoi>:

int
atoi(const char *s)
{
    1d20:	f3 0f 1e fb          	endbr32 
    1d24:	55                   	push   %ebp
    1d25:	89 e5                	mov    %esp,%ebp
    1d27:	53                   	push   %ebx
    1d28:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    1d2b:	0f be 02             	movsbl (%edx),%eax
    1d2e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1d31:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1d34:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1d39:	77 1a                	ja     1d55 <atoi+0x35>
    1d3b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1d3f:	90                   	nop
    n = n*10 + *s++ - '0';
    1d40:	83 c2 01             	add    $0x1,%edx
    1d43:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1d46:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    1d4a:	0f be 02             	movsbl (%edx),%eax
    1d4d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1d50:	80 fb 09             	cmp    $0x9,%bl
    1d53:	76 eb                	jbe    1d40 <atoi+0x20>
  return n;
}
    1d55:	89 c8                	mov    %ecx,%eax
    1d57:	5b                   	pop    %ebx
    1d58:	5d                   	pop    %ebp
    1d59:	c3                   	ret    
    1d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001d60 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    1d60:	f3 0f 1e fb          	endbr32 
    1d64:	55                   	push   %ebp
    1d65:	89 e5                	mov    %esp,%ebp
    1d67:	57                   	push   %edi
    1d68:	8b 45 10             	mov    0x10(%ebp),%eax
    1d6b:	8b 55 08             	mov    0x8(%ebp),%edx
    1d6e:	56                   	push   %esi
    1d6f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1d72:	85 c0                	test   %eax,%eax
    1d74:	7e 0f                	jle    1d85 <memmove+0x25>
    1d76:	01 d0                	add    %edx,%eax
  dst = vdst;
    1d78:	89 d7                	mov    %edx,%edi
    1d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1d80:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1d81:	39 f8                	cmp    %edi,%eax
    1d83:	75 fb                	jne    1d80 <memmove+0x20>
  return vdst;
}
    1d85:	5e                   	pop    %esi
    1d86:	89 d0                	mov    %edx,%eax
    1d88:	5f                   	pop    %edi
    1d89:	5d                   	pop    %ebp
    1d8a:	c3                   	ret    

00001d8b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    1d8b:	b8 01 00 00 00       	mov    $0x1,%eax
    1d90:	cd 40                	int    $0x40
    1d92:	c3                   	ret    

00001d93 <exit>:
SYSCALL(exit)
    1d93:	b8 02 00 00 00       	mov    $0x2,%eax
    1d98:	cd 40                	int    $0x40
    1d9a:	c3                   	ret    

00001d9b <wait>:
SYSCALL(wait)
    1d9b:	b8 03 00 00 00       	mov    $0x3,%eax
    1da0:	cd 40                	int    $0x40
    1da2:	c3                   	ret    

00001da3 <pipe>:
SYSCALL(pipe)
    1da3:	b8 04 00 00 00       	mov    $0x4,%eax
    1da8:	cd 40                	int    $0x40
    1daa:	c3                   	ret    

00001dab <read>:
SYSCALL(read)
    1dab:	b8 05 00 00 00       	mov    $0x5,%eax
    1db0:	cd 40                	int    $0x40
    1db2:	c3                   	ret    

00001db3 <write>:
SYSCALL(write)
    1db3:	b8 10 00 00 00       	mov    $0x10,%eax
    1db8:	cd 40                	int    $0x40
    1dba:	c3                   	ret    

00001dbb <close>:
SYSCALL(close)
    1dbb:	b8 15 00 00 00       	mov    $0x15,%eax
    1dc0:	cd 40                	int    $0x40
    1dc2:	c3                   	ret    

00001dc3 <kill>:
SYSCALL(kill)
    1dc3:	b8 06 00 00 00       	mov    $0x6,%eax
    1dc8:	cd 40                	int    $0x40
    1dca:	c3                   	ret    

00001dcb <exec>:
SYSCALL(exec)
    1dcb:	b8 07 00 00 00       	mov    $0x7,%eax
    1dd0:	cd 40                	int    $0x40
    1dd2:	c3                   	ret    

00001dd3 <open>:
SYSCALL(open)
    1dd3:	b8 0f 00 00 00       	mov    $0xf,%eax
    1dd8:	cd 40                	int    $0x40
    1dda:	c3                   	ret    

00001ddb <mknod>:
SYSCALL(mknod)
    1ddb:	b8 11 00 00 00       	mov    $0x11,%eax
    1de0:	cd 40                	int    $0x40
    1de2:	c3                   	ret    

00001de3 <unlink>:
SYSCALL(unlink)
    1de3:	b8 12 00 00 00       	mov    $0x12,%eax
    1de8:	cd 40                	int    $0x40
    1dea:	c3                   	ret    

00001deb <fstat>:
SYSCALL(fstat)
    1deb:	b8 08 00 00 00       	mov    $0x8,%eax
    1df0:	cd 40                	int    $0x40
    1df2:	c3                   	ret    

00001df3 <link>:
SYSCALL(link)
    1df3:	b8 13 00 00 00       	mov    $0x13,%eax
    1df8:	cd 40                	int    $0x40
    1dfa:	c3                   	ret    

00001dfb <mkdir>:
SYSCALL(mkdir)
    1dfb:	b8 14 00 00 00       	mov    $0x14,%eax
    1e00:	cd 40                	int    $0x40
    1e02:	c3                   	ret    

00001e03 <chdir>:
SYSCALL(chdir)
    1e03:	b8 09 00 00 00       	mov    $0x9,%eax
    1e08:	cd 40                	int    $0x40
    1e0a:	c3                   	ret    

00001e0b <dup>:
SYSCALL(dup)
    1e0b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1e10:	cd 40                	int    $0x40
    1e12:	c3                   	ret    

00001e13 <getpid>:
SYSCALL(getpid)
    1e13:	b8 0b 00 00 00       	mov    $0xb,%eax
    1e18:	cd 40                	int    $0x40
    1e1a:	c3                   	ret    

00001e1b <sbrk>:
SYSCALL(sbrk)
    1e1b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1e20:	cd 40                	int    $0x40
    1e22:	c3                   	ret    

00001e23 <sleep>:
SYSCALL(sleep)
    1e23:	b8 0d 00 00 00       	mov    $0xd,%eax
    1e28:	cd 40                	int    $0x40
    1e2a:	c3                   	ret    

00001e2b <uptime>:
SYSCALL(uptime)
    1e2b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1e30:	cd 40                	int    $0x40
    1e32:	c3                   	ret    

00001e33 <shm_open>:
SYSCALL(shm_open)
    1e33:	b8 16 00 00 00       	mov    $0x16,%eax
    1e38:	cd 40                	int    $0x40
    1e3a:	c3                   	ret    

00001e3b <shm_close>:
SYSCALL(shm_close)	
    1e3b:	b8 17 00 00 00       	mov    $0x17,%eax
    1e40:	cd 40                	int    $0x40
    1e42:	c3                   	ret    
    1e43:	66 90                	xchg   %ax,%ax
    1e45:	66 90                	xchg   %ax,%ax
    1e47:	66 90                	xchg   %ax,%ax
    1e49:	66 90                	xchg   %ax,%ax
    1e4b:	66 90                	xchg   %ax,%ax
    1e4d:	66 90                	xchg   %ax,%ax
    1e4f:	90                   	nop

00001e50 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1e50:	55                   	push   %ebp
    1e51:	89 e5                	mov    %esp,%ebp
    1e53:	57                   	push   %edi
    1e54:	56                   	push   %esi
    1e55:	53                   	push   %ebx
    1e56:	83 ec 3c             	sub    $0x3c,%esp
    1e59:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1e5c:	89 d1                	mov    %edx,%ecx
{
    1e5e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1e61:	85 d2                	test   %edx,%edx
    1e63:	0f 89 7f 00 00 00    	jns    1ee8 <printint+0x98>
    1e69:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    1e6d:	74 79                	je     1ee8 <printint+0x98>
    neg = 1;
    1e6f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1e76:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1e78:	31 db                	xor    %ebx,%ebx
    1e7a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    1e7d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1e80:	89 c8                	mov    %ecx,%eax
    1e82:	31 d2                	xor    %edx,%edx
    1e84:	89 cf                	mov    %ecx,%edi
    1e86:	f7 75 c4             	divl   -0x3c(%ebp)
    1e89:	0f b6 92 98 23 00 00 	movzbl 0x2398(%edx),%edx
    1e90:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1e93:	89 d8                	mov    %ebx,%eax
    1e95:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    1e98:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    1e9b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    1e9e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    1ea1:	76 dd                	jbe    1e80 <printint+0x30>
  if(neg)
    1ea3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1ea6:	85 c9                	test   %ecx,%ecx
    1ea8:	74 0c                	je     1eb6 <printint+0x66>
    buf[i++] = '-';
    1eaa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    1eaf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    1eb1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    1eb6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    1eb9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    1ebd:	eb 07                	jmp    1ec6 <printint+0x76>
    1ebf:	90                   	nop
    1ec0:	0f b6 13             	movzbl (%ebx),%edx
    1ec3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    1ec6:	83 ec 04             	sub    $0x4,%esp
    1ec9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    1ecc:	6a 01                	push   $0x1
    1ece:	56                   	push   %esi
    1ecf:	57                   	push   %edi
    1ed0:	e8 de fe ff ff       	call   1db3 <write>
  while(--i >= 0)
    1ed5:	83 c4 10             	add    $0x10,%esp
    1ed8:	39 de                	cmp    %ebx,%esi
    1eda:	75 e4                	jne    1ec0 <printint+0x70>
    putc(fd, buf[i]);
}
    1edc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1edf:	5b                   	pop    %ebx
    1ee0:	5e                   	pop    %esi
    1ee1:	5f                   	pop    %edi
    1ee2:	5d                   	pop    %ebp
    1ee3:	c3                   	ret    
    1ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1ee8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    1eef:	eb 87                	jmp    1e78 <printint+0x28>
    1ef1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1ef8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1eff:	90                   	nop

00001f00 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1f00:	f3 0f 1e fb          	endbr32 
    1f04:	55                   	push   %ebp
    1f05:	89 e5                	mov    %esp,%ebp
    1f07:	57                   	push   %edi
    1f08:	56                   	push   %esi
    1f09:	53                   	push   %ebx
    1f0a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1f0d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1f10:	0f b6 1e             	movzbl (%esi),%ebx
    1f13:	84 db                	test   %bl,%bl
    1f15:	0f 84 b4 00 00 00    	je     1fcf <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    1f1b:	8d 45 10             	lea    0x10(%ebp),%eax
    1f1e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1f21:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1f24:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1f26:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1f29:	eb 33                	jmp    1f5e <printf+0x5e>
    1f2b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1f2f:	90                   	nop
    1f30:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1f33:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1f38:	83 f8 25             	cmp    $0x25,%eax
    1f3b:	74 17                	je     1f54 <printf+0x54>
  write(fd, &c, 1);
    1f3d:	83 ec 04             	sub    $0x4,%esp
    1f40:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1f43:	6a 01                	push   $0x1
    1f45:	57                   	push   %edi
    1f46:	ff 75 08             	pushl  0x8(%ebp)
    1f49:	e8 65 fe ff ff       	call   1db3 <write>
    1f4e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1f51:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1f54:	0f b6 1e             	movzbl (%esi),%ebx
    1f57:	83 c6 01             	add    $0x1,%esi
    1f5a:	84 db                	test   %bl,%bl
    1f5c:	74 71                	je     1fcf <printf+0xcf>
    c = fmt[i] & 0xff;
    1f5e:	0f be cb             	movsbl %bl,%ecx
    1f61:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1f64:	85 d2                	test   %edx,%edx
    1f66:	74 c8                	je     1f30 <printf+0x30>
      }
    } else if(state == '%'){
    1f68:	83 fa 25             	cmp    $0x25,%edx
    1f6b:	75 e7                	jne    1f54 <printf+0x54>
      if(c == 'd'){
    1f6d:	83 f8 64             	cmp    $0x64,%eax
    1f70:	0f 84 9a 00 00 00    	je     2010 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1f76:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1f7c:	83 f9 70             	cmp    $0x70,%ecx
    1f7f:	74 5f                	je     1fe0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1f81:	83 f8 73             	cmp    $0x73,%eax
    1f84:	0f 84 d6 00 00 00    	je     2060 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1f8a:	83 f8 63             	cmp    $0x63,%eax
    1f8d:	0f 84 8d 00 00 00    	je     2020 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1f93:	83 f8 25             	cmp    $0x25,%eax
    1f96:	0f 84 b4 00 00 00    	je     2050 <printf+0x150>
  write(fd, &c, 1);
    1f9c:	83 ec 04             	sub    $0x4,%esp
    1f9f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1fa3:	6a 01                	push   $0x1
    1fa5:	57                   	push   %edi
    1fa6:	ff 75 08             	pushl  0x8(%ebp)
    1fa9:	e8 05 fe ff ff       	call   1db3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    1fae:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1fb1:	83 c4 0c             	add    $0xc,%esp
    1fb4:	6a 01                	push   $0x1
    1fb6:	83 c6 01             	add    $0x1,%esi
    1fb9:	57                   	push   %edi
    1fba:	ff 75 08             	pushl  0x8(%ebp)
    1fbd:	e8 f1 fd ff ff       	call   1db3 <write>
  for(i = 0; fmt[i]; i++){
    1fc2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    1fc6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    1fc9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    1fcb:	84 db                	test   %bl,%bl
    1fcd:	75 8f                	jne    1f5e <printf+0x5e>
    }
  }
}
    1fcf:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1fd2:	5b                   	pop    %ebx
    1fd3:	5e                   	pop    %esi
    1fd4:	5f                   	pop    %edi
    1fd5:	5d                   	pop    %ebp
    1fd6:	c3                   	ret    
    1fd7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1fde:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    1fe0:	83 ec 0c             	sub    $0xc,%esp
    1fe3:	b9 10 00 00 00       	mov    $0x10,%ecx
    1fe8:	6a 00                	push   $0x0
    1fea:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1fed:	8b 45 08             	mov    0x8(%ebp),%eax
    1ff0:	8b 13                	mov    (%ebx),%edx
    1ff2:	e8 59 fe ff ff       	call   1e50 <printint>
        ap++;
    1ff7:	89 d8                	mov    %ebx,%eax
    1ff9:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1ffc:	31 d2                	xor    %edx,%edx
        ap++;
    1ffe:	83 c0 04             	add    $0x4,%eax
    2001:	89 45 d0             	mov    %eax,-0x30(%ebp)
    2004:	e9 4b ff ff ff       	jmp    1f54 <printf+0x54>
    2009:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    2010:	83 ec 0c             	sub    $0xc,%esp
    2013:	b9 0a 00 00 00       	mov    $0xa,%ecx
    2018:	6a 01                	push   $0x1
    201a:	eb ce                	jmp    1fea <printf+0xea>
    201c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    2020:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    2023:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    2026:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    2028:	6a 01                	push   $0x1
        ap++;
    202a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    202d:	57                   	push   %edi
    202e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    2031:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    2034:	e8 7a fd ff ff       	call   1db3 <write>
        ap++;
    2039:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    203c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    203f:	31 d2                	xor    %edx,%edx
    2041:	e9 0e ff ff ff       	jmp    1f54 <printf+0x54>
    2046:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    204d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    2050:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    2053:	83 ec 04             	sub    $0x4,%esp
    2056:	e9 59 ff ff ff       	jmp    1fb4 <printf+0xb4>
    205b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    205f:	90                   	nop
        s = (char*)*ap;
    2060:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2063:	8b 18                	mov    (%eax),%ebx
        ap++;
    2065:	83 c0 04             	add    $0x4,%eax
    2068:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    206b:	85 db                	test   %ebx,%ebx
    206d:	74 17                	je     2086 <printf+0x186>
        while(*s != 0){
    206f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    2072:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    2074:	84 c0                	test   %al,%al
    2076:	0f 84 d8 fe ff ff    	je     1f54 <printf+0x54>
    207c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    207f:	89 de                	mov    %ebx,%esi
    2081:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2084:	eb 1a                	jmp    20a0 <printf+0x1a0>
          s = "(null)";
    2086:	bb 90 23 00 00       	mov    $0x2390,%ebx
        while(*s != 0){
    208b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    208e:	b8 28 00 00 00       	mov    $0x28,%eax
    2093:	89 de                	mov    %ebx,%esi
    2095:	8b 5d 08             	mov    0x8(%ebp),%ebx
    2098:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    209f:	90                   	nop
  write(fd, &c, 1);
    20a0:	83 ec 04             	sub    $0x4,%esp
          s++;
    20a3:	83 c6 01             	add    $0x1,%esi
    20a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    20a9:	6a 01                	push   $0x1
    20ab:	57                   	push   %edi
    20ac:	53                   	push   %ebx
    20ad:	e8 01 fd ff ff       	call   1db3 <write>
        while(*s != 0){
    20b2:	0f b6 06             	movzbl (%esi),%eax
    20b5:	83 c4 10             	add    $0x10,%esp
    20b8:	84 c0                	test   %al,%al
    20ba:	75 e4                	jne    20a0 <printf+0x1a0>
    20bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    20bf:	31 d2                	xor    %edx,%edx
    20c1:	e9 8e fe ff ff       	jmp    1f54 <printf+0x54>
    20c6:	66 90                	xchg   %ax,%ax
    20c8:	66 90                	xchg   %ax,%ax
    20ca:	66 90                	xchg   %ax,%ax
    20cc:	66 90                	xchg   %ax,%ax
    20ce:	66 90                	xchg   %ax,%ax

000020d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    20d0:	f3 0f 1e fb          	endbr32 
    20d4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    20d5:	a1 24 2a 00 00       	mov    0x2a24,%eax
{
    20da:	89 e5                	mov    %esp,%ebp
    20dc:	57                   	push   %edi
    20dd:	56                   	push   %esi
    20de:	53                   	push   %ebx
    20df:	8b 5d 08             	mov    0x8(%ebp),%ebx
    20e2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    20e4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    20e7:	39 c8                	cmp    %ecx,%eax
    20e9:	73 15                	jae    2100 <free+0x30>
    20eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    20ef:	90                   	nop
    20f0:	39 d1                	cmp    %edx,%ecx
    20f2:	72 14                	jb     2108 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    20f4:	39 d0                	cmp    %edx,%eax
    20f6:	73 10                	jae    2108 <free+0x38>
{
    20f8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    20fa:	8b 10                	mov    (%eax),%edx
    20fc:	39 c8                	cmp    %ecx,%eax
    20fe:	72 f0                	jb     20f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2100:	39 d0                	cmp    %edx,%eax
    2102:	72 f4                	jb     20f8 <free+0x28>
    2104:	39 d1                	cmp    %edx,%ecx
    2106:	73 f0                	jae    20f8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    2108:	8b 73 fc             	mov    -0x4(%ebx),%esi
    210b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    210e:	39 fa                	cmp    %edi,%edx
    2110:	74 1e                	je     2130 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    2112:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    2115:	8b 50 04             	mov    0x4(%eax),%edx
    2118:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    211b:	39 f1                	cmp    %esi,%ecx
    211d:	74 28                	je     2147 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    211f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    2121:	5b                   	pop    %ebx
  freep = p;
    2122:	a3 24 2a 00 00       	mov    %eax,0x2a24
}
    2127:	5e                   	pop    %esi
    2128:	5f                   	pop    %edi
    2129:	5d                   	pop    %ebp
    212a:	c3                   	ret    
    212b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    212f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    2130:	03 72 04             	add    0x4(%edx),%esi
    2133:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    2136:	8b 10                	mov    (%eax),%edx
    2138:	8b 12                	mov    (%edx),%edx
    213a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    213d:	8b 50 04             	mov    0x4(%eax),%edx
    2140:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    2143:	39 f1                	cmp    %esi,%ecx
    2145:	75 d8                	jne    211f <free+0x4f>
    p->s.size += bp->s.size;
    2147:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    214a:	a3 24 2a 00 00       	mov    %eax,0x2a24
    p->s.size += bp->s.size;
    214f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    2152:	8b 53 f8             	mov    -0x8(%ebx),%edx
    2155:	89 10                	mov    %edx,(%eax)
}
    2157:	5b                   	pop    %ebx
    2158:	5e                   	pop    %esi
    2159:	5f                   	pop    %edi
    215a:	5d                   	pop    %ebp
    215b:	c3                   	ret    
    215c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002160 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    2160:	f3 0f 1e fb          	endbr32 
    2164:	55                   	push   %ebp
    2165:	89 e5                	mov    %esp,%ebp
    2167:	57                   	push   %edi
    2168:	56                   	push   %esi
    2169:	53                   	push   %ebx
    216a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    216d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    2170:	8b 3d 24 2a 00 00    	mov    0x2a24,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    2176:	8d 70 07             	lea    0x7(%eax),%esi
    2179:	c1 ee 03             	shr    $0x3,%esi
    217c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    217f:	85 ff                	test   %edi,%edi
    2181:	0f 84 a9 00 00 00    	je     2230 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2187:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    2189:	8b 48 04             	mov    0x4(%eax),%ecx
    218c:	39 f1                	cmp    %esi,%ecx
    218e:	73 6d                	jae    21fd <malloc+0x9d>
    2190:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    2196:	bb 00 10 00 00       	mov    $0x1000,%ebx
    219b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    219e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    21a5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    21a8:	eb 17                	jmp    21c1 <malloc+0x61>
    21aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    21b0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    21b2:	8b 4a 04             	mov    0x4(%edx),%ecx
    21b5:	39 f1                	cmp    %esi,%ecx
    21b7:	73 4f                	jae    2208 <malloc+0xa8>
    21b9:	8b 3d 24 2a 00 00    	mov    0x2a24,%edi
    21bf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    21c1:	39 c7                	cmp    %eax,%edi
    21c3:	75 eb                	jne    21b0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    21c5:	83 ec 0c             	sub    $0xc,%esp
    21c8:	ff 75 e4             	pushl  -0x1c(%ebp)
    21cb:	e8 4b fc ff ff       	call   1e1b <sbrk>
  if(p == (char*)-1)
    21d0:	83 c4 10             	add    $0x10,%esp
    21d3:	83 f8 ff             	cmp    $0xffffffff,%eax
    21d6:	74 1b                	je     21f3 <malloc+0x93>
  hp->s.size = nu;
    21d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    21db:	83 ec 0c             	sub    $0xc,%esp
    21de:	83 c0 08             	add    $0x8,%eax
    21e1:	50                   	push   %eax
    21e2:	e8 e9 fe ff ff       	call   20d0 <free>
  return freep;
    21e7:	a1 24 2a 00 00       	mov    0x2a24,%eax
      if((p = morecore(nunits)) == 0)
    21ec:	83 c4 10             	add    $0x10,%esp
    21ef:	85 c0                	test   %eax,%eax
    21f1:	75 bd                	jne    21b0 <malloc+0x50>
        return 0;
  }
}
    21f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    21f6:	31 c0                	xor    %eax,%eax
}
    21f8:	5b                   	pop    %ebx
    21f9:	5e                   	pop    %esi
    21fa:	5f                   	pop    %edi
    21fb:	5d                   	pop    %ebp
    21fc:	c3                   	ret    
    if(p->s.size >= nunits){
    21fd:	89 c2                	mov    %eax,%edx
    21ff:	89 f8                	mov    %edi,%eax
    2201:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    2208:	39 ce                	cmp    %ecx,%esi
    220a:	74 54                	je     2260 <malloc+0x100>
        p->s.size -= nunits;
    220c:	29 f1                	sub    %esi,%ecx
    220e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    2211:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    2214:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    2217:	a3 24 2a 00 00       	mov    %eax,0x2a24
}
    221c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    221f:	8d 42 08             	lea    0x8(%edx),%eax
}
    2222:	5b                   	pop    %ebx
    2223:	5e                   	pop    %esi
    2224:	5f                   	pop    %edi
    2225:	5d                   	pop    %ebp
    2226:	c3                   	ret    
    2227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    222e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    2230:	c7 05 24 2a 00 00 28 	movl   $0x2a28,0x2a24
    2237:	2a 00 00 
    base.s.size = 0;
    223a:	bf 28 2a 00 00       	mov    $0x2a28,%edi
    base.s.ptr = freep = prevp = &base;
    223f:	c7 05 28 2a 00 00 28 	movl   $0x2a28,0x2a28
    2246:	2a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2249:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    224b:	c7 05 2c 2a 00 00 00 	movl   $0x0,0x2a2c
    2252:	00 00 00 
    if(p->s.size >= nunits){
    2255:	e9 36 ff ff ff       	jmp    2190 <malloc+0x30>
    225a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    2260:	8b 0a                	mov    (%edx),%ecx
    2262:	89 08                	mov    %ecx,(%eax)
    2264:	eb b1                	jmp    2217 <malloc+0xb7>
    2266:	66 90                	xchg   %ax,%ax
    2268:	66 90                	xchg   %ax,%ax
    226a:	66 90                	xchg   %ax,%ax
    226c:	66 90                	xchg   %ax,%ax
    226e:	66 90                	xchg   %ax,%ax

00002270 <uacquire>:
#include "uspinlock.h"
#include "x86.h"

void
uacquire(struct uspinlock *lk)
{
    2270:	f3 0f 1e fb          	endbr32 
    2274:	55                   	push   %ebp
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    2275:	b9 01 00 00 00       	mov    $0x1,%ecx
    227a:	89 e5                	mov    %esp,%ebp
    227c:	8b 55 08             	mov    0x8(%ebp),%edx
    227f:	90                   	nop
    2280:	89 c8                	mov    %ecx,%eax
    2282:	f0 87 02             	lock xchg %eax,(%edx)
  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
    2285:	85 c0                	test   %eax,%eax
    2287:	75 f7                	jne    2280 <uacquire+0x10>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
    2289:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
    228e:	5d                   	pop    %ebp
    228f:	c3                   	ret    

00002290 <urelease>:

void urelease (struct uspinlock *lk) {
    2290:	f3 0f 1e fb          	endbr32 
    2294:	55                   	push   %ebp
    2295:	89 e5                	mov    %esp,%ebp
    2297:	8b 45 08             	mov    0x8(%ebp),%eax
  __sync_synchronize();
    229a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
    229f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    22a5:	5d                   	pop    %ebp
    22a6:	c3                   	ret    
