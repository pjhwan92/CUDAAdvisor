; ModuleID = 'nn_cuda.cu'
source_filename = "nn_cuda.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.latLong = type { float, float }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl" }
%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl" = type { %struct.record*, %struct.record*, %struct.record* }
%struct.record = type { [53 x i8], float }
%"class.std::vector.0" = type { %"struct.std::_Vector_base.1" }
%"struct.std::_Vector_base.1" = type { %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl" }
%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl" = type { %struct.latLong*, %struct.latLong*, %struct.latLong* }
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque
%"class.__gnu_cxx::__normal_iterator" = type { %struct.latLong* }
%"class.__gnu_cxx::__normal_iterator.5" = type { %struct.record* }

$_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_ = comdat any

$_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_ = comdat any

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [25 x i8] c"Error: Input too large.\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"%s --> Distance=%f\0A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"error reading filelist\0A\00", align 1
@str = private unnamed_addr constant [23 x i8] c"Nearest Neighbor Usage\00"
@str.25 = private unnamed_addr constant [89 x i8] c"nearestNeighbor [filename] -r [int] -lat [float] -lng [float] [-hqt] [-p [int] -d [int]]\00"
@str.26 = private unnamed_addr constant [9 x i8] c"example:\00"
@str.27 = private unnamed_addr constant [54 x i8] c"$ ./nearestNeighbor filelist.txt -r 5 -lat 30 -lng 90\00"
@str.28 = private unnamed_addr constant [58 x i8] c"filename     the filename that lists the data input files\00"
@str.29 = private unnamed_addr constant [59 x i8] c"-r [int]     the number of records to return (default: 10)\00"
@str.30 = private unnamed_addr constant [61 x i8] c"-lat [float] the latitude for nearest neighbors (default: 0)\00"
@str.31 = private unnamed_addr constant [62 x i8] c"-lng [float] the longitude for nearest neighbors (default: 0)\00"
@str.32 = private unnamed_addr constant [35 x i8] c"-h, --help   Display the help file\00"
@str.33 = private unnamed_addr constant [51 x i8] c"-q           Quiet mode. Suppress all text output.\00"
@str.34 = private unnamed_addr constant [39 x i8] c"-t           Print timing information.\00"
@str.35 = private unnamed_addr constant [72 x i8] c"-p [int]     Choose the platform (must choose both platform and device)\00"
@str.36 = private unnamed_addr constant [70 x i8] c"-d [int]     Choose the device (must choose both platform and device)\00"
@str.37 = private unnamed_addr constant [59 x i8] c"Notes: 1. The filename is required as the first parameter.\00"
@str.38 = private unnamed_addr constant [60 x i8] c"       2. If you declare either the device or the platform,\00"
@str.39 = private unnamed_addr constant [34 x i8] c"          you must declare both.\0A\00"
@str.40 = private unnamed_addr constant [19 x i8] c"error opening a db\00"

; Function Attrs: nounwind uwtable
define dso_local double @_Z8get_timev() local_unnamed_addr #0 !dbg !1309 {
entry:
  %time = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %time to i8*, !dbg !1322
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %0) #11, !dbg !1322
  call void @llvm.dbg.value(metadata %struct.timeval* %time, metadata !1313, metadata !DIExpression()), !dbg !1323
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %time, %struct.timezone* null) #11, !dbg !1324
  %tobool = icmp eq i32 %call, 0, !dbg !1324
  br i1 %tobool, label %if.end, label %cleanup, !dbg !1326

if.end:                                           ; preds = %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 0, !dbg !1327
  %1 = load i64, i64* %tv_sec, align 8, !dbg !1327, !tbaa !1328
  %conv = sitofp i64 %1 to double, !dbg !1333
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 1, !dbg !1334
  %2 = load i64, i64* %tv_usec, align 8, !dbg !1334, !tbaa !1335
  %conv1 = sitofp i64 %2 to double, !dbg !1336
  %mul = fmul contract double %conv1, 0x3EB0C6F7A0B5ED8D, !dbg !1337
  %add = fadd contract double %mul, %conv, !dbg !1338
  br label %cleanup, !dbg !1339

cleanup:                                          ; preds = %entry, %if.end
  %retval.0 = phi double [ %add, %if.end ], [ 0.000000e+00, %entry ], !dbg !1340
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %0) #11, !dbg !1341
  ret double %retval.0, !dbg !1341
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: uwtable
define dso_local void @_Z6euclidP7latLongPfiff(%struct.latLong* %d_locations, float* %d_distances, i32 %numRecords, float %lat, float %lng) #4 !dbg !1342 {
entry:
  %d_locations.addr = alloca %struct.latLong*, align 8
  %d_distances.addr = alloca float*, align 8
  %numRecords.addr = alloca i32, align 4
  %lat.addr = alloca float, align 4
  %lng.addr = alloca float, align 4
  call void @llvm.dbg.value(metadata %struct.latLong* %d_locations, metadata !1348, metadata !DIExpression()), !dbg !1353
  store %struct.latLong* %d_locations, %struct.latLong** %d_locations.addr, align 8, !tbaa !1354
  call void @llvm.dbg.value(metadata float* %d_distances, metadata !1349, metadata !DIExpression()), !dbg !1356
  store float* %d_distances, float** %d_distances.addr, align 8, !tbaa !1354
  call void @llvm.dbg.value(metadata i32 %numRecords, metadata !1350, metadata !DIExpression()), !dbg !1357
  store i32 %numRecords, i32* %numRecords.addr, align 4, !tbaa !1358
  call void @llvm.dbg.value(metadata float %lat, metadata !1351, metadata !DIExpression()), !dbg !1360
  store float %lat, float* %lat.addr, align 4, !tbaa !1361
  call void @llvm.dbg.value(metadata float %lng, metadata !1352, metadata !DIExpression()), !dbg !1363
  store float %lng, float* %lng.addr, align 4, !tbaa !1361
  %0 = bitcast %struct.latLong** %d_locations.addr to i8*, !dbg !1364
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !1364
  %2 = icmp eq i32 %1, 0, !dbg !1364
  br i1 %2, label %setup.next, label %setup.end, !dbg !1364

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %d_distances.addr to i8*, !dbg !1364
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !1364
  %5 = icmp eq i32 %4, 0, !dbg !1364
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1364

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %numRecords.addr to i8*, !dbg !1364
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 4, i64 16), !dbg !1364
  %8 = icmp eq i32 %7, 0, !dbg !1364
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1364

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float* %lat.addr to i8*, !dbg !1364
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 4, i64 20), !dbg !1364
  %11 = icmp eq i32 %10, 0, !dbg !1364
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1364

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float* %lng.addr to i8*, !dbg !1364
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 4, i64 24), !dbg !1364
  %14 = icmp eq i32 %13, 0, !dbg !1364
  br i1 %14, label %setup.next4, label %setup.end, !dbg !1364

setup.next4:                                      ; preds = %setup.next3
  %15 = call i32 @cudaLaunch(i8* bitcast (void (%struct.latLong*, float*, i32, float, float)* @_Z6euclidP7latLongPfiff to i8*)), !dbg !1364
  br label %setup.end, !dbg !1364

setup.end:                                        ; preds = %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1365
}

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare dso_local i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: norecurse uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #5 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !1366 {
invoke.cont:
  %time.i209 = alloca %struct.timeval, align 8
  %time.i = alloca %struct.timeval, align 8
  %lat = alloca float, align 4
  %lng = alloca float, align 4
  %quiet = alloca i32, align 4
  %timing = alloca i32, align 4
  %platform = alloca i32, align 4
  %device = alloca i32, align 4
  %records = alloca %"class.std::vector", align 8
  %locations = alloca %"class.std::vector.0", align 8
  %filename = alloca [100 x i8], align 16
  %resultsCount = alloca i32, align 4
  %d_locations = alloca %struct.latLong*, align 8
  %d_distances = alloca float*, align 8
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %totalDeviceMemory = alloca i64, align 8
  %freeDeviceMemory = alloca i64, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !1370, metadata !DIExpression()), !dbg !1503
  call void @llvm.dbg.value(metadata i8** %argv, metadata !1371, metadata !DIExpression()), !dbg !1504
  call void @llvm.dbg.value(metadata i32 0, metadata !1372, metadata !DIExpression()), !dbg !1505
  %0 = bitcast float* %lat to i8*, !dbg !1506
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #11, !dbg !1506
  %1 = bitcast float* %lng to i8*, !dbg !1506
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #11, !dbg !1506
  %2 = bitcast i32* %quiet to i8*, !dbg !1507
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #11, !dbg !1507
  call void @llvm.dbg.value(metadata i32 0, metadata !1375, metadata !DIExpression()), !dbg !1508
  store i32 0, i32* %quiet, align 4, !dbg !1508, !tbaa !1358
  %3 = bitcast i32* %timing to i8*, !dbg !1507
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #11, !dbg !1507
  call void @llvm.dbg.value(metadata i32 0, metadata !1376, metadata !DIExpression()), !dbg !1509
  store i32 0, i32* %timing, align 4, !dbg !1509, !tbaa !1358
  %4 = bitcast i32* %platform to i8*, !dbg !1507
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #11, !dbg !1507
  call void @llvm.dbg.value(metadata i32 0, metadata !1377, metadata !DIExpression()), !dbg !1510
  store i32 0, i32* %platform, align 4, !dbg !1510, !tbaa !1358
  %5 = bitcast i32* %device to i8*, !dbg !1507
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #11, !dbg !1507
  call void @llvm.dbg.value(metadata i32 0, metadata !1378, metadata !DIExpression()), !dbg !1511
  store i32 0, i32* %device, align 4, !dbg !1511, !tbaa !1358
  %6 = bitcast %"class.std::vector"* %records to i8*, !dbg !1512
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %6) #11, !dbg !1512
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1379, metadata !DIExpression()), !dbg !1513
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1514, metadata !DIExpression()), !dbg !1518
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1520, metadata !DIExpression(DW_OP_stack_value)), !dbg !1524
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1526, metadata !DIExpression(DW_OP_stack_value)) #11, !dbg !1530
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %6, i8 0, i64 24, i1 false) #11, !dbg !1532
  %7 = bitcast %"class.std::vector.0"* %locations to i8*, !dbg !1533
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #11, !dbg !1533
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1534, metadata !DIExpression()), !dbg !1538
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1540, metadata !DIExpression(DW_OP_stack_value)), !dbg !1544
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1546, metadata !DIExpression(DW_OP_stack_value)) #11, !dbg !1550
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %7, i8 0, i64 24, i1 false) #11, !dbg !1552
  %8 = getelementptr inbounds [100 x i8], [100 x i8]* %filename, i64 0, i64 0, !dbg !1553
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %8) #11, !dbg !1553
  call void @llvm.dbg.declare(metadata [100 x i8]* %filename, metadata !1381, metadata !DIExpression()), !dbg !1554
  %9 = bitcast i32* %resultsCount to i8*, !dbg !1555
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #11, !dbg !1555
  call void @llvm.dbg.value(metadata i32 10, metadata !1385, metadata !DIExpression()), !dbg !1556
  store i32 10, i32* %resultsCount, align 4, !dbg !1556, !tbaa !1358
  call void @llvm.dbg.value(metadata float* %lat, metadata !1373, metadata !DIExpression()), !dbg !1557
  call void @llvm.dbg.value(metadata float* %lng, metadata !1374, metadata !DIExpression()), !dbg !1558
  call void @llvm.dbg.value(metadata i32* %quiet, metadata !1375, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.value(metadata i32* %timing, metadata !1376, metadata !DIExpression()), !dbg !1509
  call void @llvm.dbg.value(metadata i32* %platform, metadata !1377, metadata !DIExpression()), !dbg !1510
  call void @llvm.dbg.value(metadata i32* %device, metadata !1378, metadata !DIExpression()), !dbg !1511
  call void @llvm.dbg.value(metadata i32* %resultsCount, metadata !1385, metadata !DIExpression()), !dbg !1556
  %call = call i32 @_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_(i32 %argc, i8** %argv, i8* nonnull %8, i32* nonnull %resultsCount, float* nonnull %lat, float* nonnull %lng, i32* nonnull %quiet, i32* nonnull %timing, i32* nonnull %platform, i32* nonnull %device), !dbg !1559
  %tobool = icmp eq i32 %call, 0, !dbg !1559
  br i1 %tobool, label %if.end, label %if.then, !dbg !1561

if.then:                                          ; preds = %invoke.cont
  call void @_Z10printUsagev(), !dbg !1562
  br label %cleanup

if.end:                                           ; preds = %invoke.cont
  %call7 = invoke i32 @_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE(i8* nonnull %8, %"class.std::vector"* nonnull dereferenceable(24) %records, %"class.std::vector.0"* nonnull dereferenceable(24) %locations)
          to label %invoke.cont6 unwind label %lpad5, !dbg !1564

invoke.cont6:                                     ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 %call7, metadata !1386, metadata !DIExpression()), !dbg !1565
  %10 = load i32, i32* %resultsCount, align 4, !dbg !1566, !tbaa !1358
  call void @llvm.dbg.value(metadata i32 %10, metadata !1385, metadata !DIExpression()), !dbg !1556
  %cmp = icmp sgt i32 %10, %call7, !dbg !1568
  br i1 %cmp, label %if.then8, label %if.end9, !dbg !1569

if.then8:                                         ; preds = %invoke.cont6
  call void @llvm.dbg.value(metadata i32 %call7, metadata !1385, metadata !DIExpression()), !dbg !1556
  store i32 %call7, i32* %resultsCount, align 4, !dbg !1570, !tbaa !1358
  br label %if.end9, !dbg !1571

lpad5:                                            ; preds = %if.end
  %11 = landingpad { i8*, i32 }
          cleanup, !dbg !1572
  %12 = extractvalue { i8*, i32 } %11, 0, !dbg !1572
  %13 = extractvalue { i8*, i32 } %11, 1, !dbg !1572
  br label %ehcleanup118, !dbg !1572

if.end9:                                          ; preds = %if.then8, %invoke.cont6
  %14 = phi i32 [ %call7, %if.then8 ], [ %10, %invoke.cont6 ]
  %15 = bitcast %struct.latLong** %d_locations to i8*, !dbg !1573
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %15) #11, !dbg !1573
  %16 = bitcast float** %d_distances to i8*, !dbg !1574
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %16) #11, !dbg !1574
  %17 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i64 0, i32 0, i64 0, !dbg !1575
  call void @llvm.lifetime.start.p0i8(i64 648, i8* nonnull %17) #11, !dbg !1575
  %call12 = invoke i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nonnull %deviceProp, i32 0)
          to label %invoke.cont11 unwind label %lpad10, !dbg !1576

invoke.cont11:                                    ; preds = %if.end9
  %call14 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont13 unwind label %lpad10, !dbg !1577

invoke.cont13:                                    ; preds = %invoke.cont11
  %arrayidx = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i64 0, i32 8, i64 0, !dbg !1578
  %18 = load i32, i32* %arrayidx, align 8, !dbg !1578, !tbaa !1358
  %conv = sext i32 %18 to i64, !dbg !1578
  call void @llvm.dbg.value(metadata i64 %conv, metadata !1468, metadata !DIExpression()), !dbg !1579
  %maxThreadsPerBlock = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i64 0, i32 6, !dbg !1580
  %19 = load i32, i32* %maxThreadsPerBlock, align 8, !dbg !1580, !tbaa !1581
  %20 = icmp slt i32 %19, 256, !dbg !1580
  %cond = select i1 %20, i32 %19, i32 256, !dbg !1580
  %conv17 = sext i32 %cond to i64, !dbg !1580
  call void @llvm.dbg.value(metadata i64 %conv17, metadata !1469, metadata !DIExpression()), !dbg !1583
  %21 = bitcast i64* %totalDeviceMemory to i8*, !dbg !1584
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %21) #11, !dbg !1584
  %22 = bitcast i64* %freeDeviceMemory to i8*, !dbg !1585
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %22) #11, !dbg !1585
  %call20 = invoke i32 @cudaMemGetInfo(i64* nonnull %freeDeviceMemory, i64* nonnull %totalDeviceMemory)
          to label %invoke.cont19 unwind label %lpad18, !dbg !1586

invoke.cont19:                                    ; preds = %invoke.cont13
  %call22 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont21 unwind label %lpad18, !dbg !1587

invoke.cont21:                                    ; preds = %invoke.cont19
  %23 = load i64, i64* %freeDeviceMemory, align 8, !dbg !1588, !tbaa !1589
  call void @llvm.dbg.value(metadata i64 %23, metadata !1471, metadata !DIExpression()), !dbg !1590
  %mul = mul i64 %23, 85, !dbg !1591
  %div23 = udiv i64 %mul, 1200, !dbg !1592
  call void @llvm.dbg.value(metadata i64 %div23, metadata !1473, metadata !DIExpression()), !dbg !1593
  %conv24 = sext i32 %call7 to i64, !dbg !1594
  %cmp25 = icmp ult i64 %div23, %conv24, !dbg !1596
  br i1 %cmp25, label %if.then26, label %if.end30, !dbg !1597

if.then26:                                        ; preds = %invoke.cont21
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1598, !tbaa !1354
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i64 24, i64 1, %struct._IO_FILE* %24) #12, !dbg !1600
  call void @exit(i32 1) #13, !dbg !1601
  unreachable, !dbg !1601

lpad10:                                           ; preds = %invoke.cont11, %if.end9
  %26 = landingpad { i8*, i32 }
          cleanup, !dbg !1572
  %27 = extractvalue { i8*, i32 } %26, 0, !dbg !1572
  %28 = extractvalue { i8*, i32 } %26, 1, !dbg !1572
  br label %ehcleanup113, !dbg !1572

lpad18:                                           ; preds = %invoke.cont19, %invoke.cont13
  %29 = landingpad { i8*, i32 }
          cleanup, !dbg !1572
  br label %ehcleanup109, !dbg !1572

if.end30:                                         ; preds = %invoke.cont21
  %add = add nsw i64 %conv24, -1, !dbg !1602
  %sub = add nsw i64 %add, %conv17, !dbg !1602
  %div32 = udiv i64 %sub, %conv17, !dbg !1602
  call void @llvm.dbg.value(metadata i64 %div32, metadata !1474, metadata !DIExpression()), !dbg !1603
  %add33 = add i64 %div32, -1, !dbg !1604
  %sub34 = add i64 %add33, %conv, !dbg !1604
  %div35 = udiv i64 %sub34, %conv, !dbg !1604
  call void @llvm.dbg.value(metadata i64 %div35, metadata !1475, metadata !DIExpression()), !dbg !1605
  %sub37 = add i64 %add33, %div35, !dbg !1606
  %div38 = udiv i64 %sub37, %div35, !dbg !1606
  call void @llvm.dbg.value(metadata i64 %div38, metadata !1476, metadata !DIExpression()), !dbg !1607
  call void @llvm.dbg.value(metadata %struct.dim3* undef, metadata !1477, metadata !DIExpression()), !dbg !1608
  %mul44 = shl nsw i64 %conv24, 2, !dbg !1609
  %call45 = call noalias i8* @malloc(i64 %mul44) #11, !dbg !1610
  %30 = bitcast i8* %call45 to float*, !dbg !1611
  call void @llvm.dbg.value(metadata float* %30, metadata !1387, metadata !DIExpression()), !dbg !1612
  %31 = bitcast %struct.latLong** %d_locations to i8**, !dbg !1613
  %mul47 = shl nsw i64 %conv24, 3, !dbg !1614
  %call49 = invoke i32 @cudaMalloc(i8** nonnull %31, i64 %mul47)
          to label %invoke.cont48 unwind label %lpad41, !dbg !1615

invoke.cont48:                                    ; preds = %if.end30
  %32 = bitcast float** %d_distances to i8**, !dbg !1616
  %call53 = invoke i32 @cudaMalloc(i8** nonnull %32, i64 %mul44)
          to label %invoke.cont52 unwind label %lpad41, !dbg !1617

invoke.cont52:                                    ; preds = %invoke.cont48
  %33 = load i8*, i8** %31, align 8, !dbg !1618, !tbaa !1354
  call void @llvm.dbg.value(metadata %struct.latLong** %d_locations, metadata !1388, metadata !DIExpression(DW_OP_deref)), !dbg !1619
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1380, metadata !DIExpression()), !dbg !1620
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1621, metadata !DIExpression()), !dbg !1625
  call void @llvm.dbg.value(metadata i64 0, metadata !1624, metadata !DIExpression()), !dbg !1627
  %34 = bitcast %"class.std::vector.0"* %locations to i8**, !dbg !1628
  %35 = load i8*, i8** %34, align 8, !dbg !1628, !tbaa !1629
  %call59 = invoke i32 @cudaMemcpy(i8* %33, i8* %35, i64 %mul47, i32 1)
          to label %invoke.cont58 unwind label %lpad41, !dbg !1632

invoke.cont58:                                    ; preds = %invoke.cont52
  %call61 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont60 unwind label %lpad41, !dbg !1633

invoke.cont60:                                    ; preds = %invoke.cont58
  %36 = bitcast %struct.timeval* %time.i to i8*, !dbg !1634
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %36) #11, !dbg !1634
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i, metadata !1313, metadata !DIExpression()) #11, !dbg !1636
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %time.i, %struct.timezone* null) #11, !dbg !1637
  %tobool.i = icmp eq i32 %call.i, 0, !dbg !1637
  br i1 %tobool.i, label %if.end.i, label %_Z8get_timev.exit, !dbg !1638

if.end.i:                                         ; preds = %invoke.cont60
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 0, !dbg !1639
  %37 = load i64, i64* %tv_sec.i, align 8, !dbg !1639, !tbaa !1328
  %conv.i = sitofp i64 %37 to double, !dbg !1640
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 1, !dbg !1641
  %38 = load i64, i64* %tv_usec.i, align 8, !dbg !1641, !tbaa !1335
  %conv1.i = sitofp i64 %38 to double, !dbg !1642
  %mul.i = fmul contract double %conv1.i, 0x3EB0C6F7A0B5ED8D, !dbg !1643
  %add.i = fadd contract double %mul.i, %conv.i, !dbg !1644
  br label %_Z8get_timev.exit, !dbg !1645

_Z8get_timev.exit:                                ; preds = %invoke.cont60, %if.end.i
  %retval.0.i = phi double [ %add.i, %if.end.i ], [ 0.000000e+00, %invoke.cont60 ], !dbg !1646
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %36) #11, !dbg !1647
  call void @llvm.dbg.value(metadata double %retval.0.i, metadata !1501, metadata !DIExpression()), !dbg !1648
  %gridDim.sroa.0.sroa.5.0.insert.shift = shl i64 %div35, 32, !dbg !1649
  %gridDim.sroa.0.sroa.0.0.insert.ext = and i64 %div38, 4294967295, !dbg !1649
  %gridDim.sroa.0.sroa.0.0.insert.insert = or i64 %gridDim.sroa.0.sroa.0.0.insert.ext, %gridDim.sroa.0.sroa.5.0.insert.shift, !dbg !1649
  %agg.tmp65.sroa.0.0.insert.ext = zext i32 %cond to i64, !dbg !1650
  %agg.tmp65.sroa.0.0.insert.insert = or i64 %agg.tmp65.sroa.0.0.insert.ext, 4294967296, !dbg !1650
  %call69 = invoke i32 @cudaConfigureCall(i64 %gridDim.sroa.0.sroa.0.0.insert.insert, i32 1, i64 %agg.tmp65.sroa.0.0.insert.insert, i32 1, i64 0, %struct.CUstream_st* null)
          to label %invoke.cont68 unwind label %lpad62, !dbg !1650

invoke.cont68:                                    ; preds = %_Z8get_timev.exit
  %tobool70 = icmp eq i32 %call69, 0, !dbg !1650
  br i1 %tobool70, label %kcall.configok, label %kcall.end, !dbg !1651

kcall.configok:                                   ; preds = %invoke.cont68
  %39 = load %struct.latLong*, %struct.latLong** %d_locations, align 8, !dbg !1652, !tbaa !1354
  call void @llvm.dbg.value(metadata %struct.latLong* %39, metadata !1388, metadata !DIExpression()), !dbg !1619
  %40 = load float*, float** %d_distances, align 8, !dbg !1653, !tbaa !1354
  call void @llvm.dbg.value(metadata float* %40, metadata !1389, metadata !DIExpression()), !dbg !1654
  %41 = load float, float* %lat, align 4, !dbg !1655, !tbaa !1361
  call void @llvm.dbg.value(metadata float %41, metadata !1373, metadata !DIExpression()), !dbg !1557
  %42 = load float, float* %lng, align 4, !dbg !1656, !tbaa !1361
  call void @llvm.dbg.value(metadata float %42, metadata !1374, metadata !DIExpression()), !dbg !1558
  invoke void @_Z6euclidP7latLongPfiff(%struct.latLong* %39, float* %40, i32 %call7, float %41, float %42)
          to label %kcall.end unwind label %lpad62, !dbg !1651

lpad41:                                           ; preds = %invoke.cont58, %invoke.cont52, %invoke.cont48, %if.end30
  %43 = landingpad { i8*, i32 }
          cleanup, !dbg !1572
  br label %ehcleanup109, !dbg !1572

lpad62:                                           ; preds = %kcall.end, %kcall.configok, %_Z8get_timev.exit
  %44 = landingpad { i8*, i32 }
          cleanup, !dbg !1572
  br label %ehcleanup109, !dbg !1572

kcall.end:                                        ; preds = %invoke.cont68, %kcall.configok
  %call73 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont72 unwind label %lpad62, !dbg !1657

invoke.cont72:                                    ; preds = %kcall.end
  %45 = bitcast %struct.timeval* %time.i209 to i8*, !dbg !1658
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %45) #11, !dbg !1658
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i209, metadata !1313, metadata !DIExpression()) #11, !dbg !1660
  %call.i210 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i209, %struct.timezone* null) #11, !dbg !1661
  %tobool.i211 = icmp eq i32 %call.i210, 0, !dbg !1661
  br i1 %tobool.i211, label %if.end.i218, label %_Z8get_timev.exit220, !dbg !1662

if.end.i218:                                      ; preds = %invoke.cont72
  %tv_sec.i212 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i209, i64 0, i32 0, !dbg !1663
  %46 = load i64, i64* %tv_sec.i212, align 8, !dbg !1663, !tbaa !1328
  %conv.i213 = sitofp i64 %46 to double, !dbg !1664
  %tv_usec.i214 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i209, i64 0, i32 1, !dbg !1665
  %47 = load i64, i64* %tv_usec.i214, align 8, !dbg !1665, !tbaa !1335
  %conv1.i215 = sitofp i64 %47 to double, !dbg !1666
  %mul.i216 = fmul contract double %conv1.i215, 0x3EB0C6F7A0B5ED8D, !dbg !1667
  %add.i217 = fadd contract double %mul.i216, %conv.i213, !dbg !1668
  br label %_Z8get_timev.exit220, !dbg !1669

_Z8get_timev.exit220:                             ; preds = %invoke.cont72, %if.end.i218
  %retval.0.i219 = phi double [ %add.i217, %if.end.i218 ], [ 0.000000e+00, %invoke.cont72 ], !dbg !1670
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %45) #11, !dbg !1671
  call void @llvm.dbg.value(metadata double %retval.0.i219, metadata !1502, metadata !DIExpression()), !dbg !1672
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1673, !tbaa !1354
  %sub77 = fsub contract double %retval.0.i219, %retval.0.i, !dbg !1674
  %call79 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %sub77) #12, !dbg !1675
  %49 = load i8*, i8** %32, align 8, !dbg !1676, !tbaa !1354
  call void @llvm.dbg.value(metadata float** %d_distances, metadata !1389, metadata !DIExpression(DW_OP_deref)), !dbg !1654
  %call83 = invoke i32 @cudaMemcpy(i8* %call45, i8* %49, i64 %mul44, i32 2)
          to label %invoke.cont82 unwind label %lpad74, !dbg !1677

invoke.cont82:                                    ; preds = %_Z8get_timev.exit220
  call void @llvm.dbg.value(metadata i32 %14, metadata !1385, metadata !DIExpression()), !dbg !1556
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1678, metadata !DIExpression()) #11, !dbg !1694
  call void @llvm.dbg.value(metadata float* %30, metadata !1683, metadata !DIExpression()) #11, !dbg !1696
  call void @llvm.dbg.value(metadata i32 %call7, metadata !1684, metadata !DIExpression()) #11, !dbg !1697
  call void @llvm.dbg.value(metadata i32 %14, metadata !1685, metadata !DIExpression()) #11, !dbg !1698
  call void @llvm.dbg.value(metadata i32 0, metadata !1686, metadata !DIExpression()) #11, !dbg !1699
  %cmp71.i = icmp sgt i32 %14, 0, !dbg !1700
  br i1 %cmp71.i, label %for.cond1.preheader.lr.ph.i, label %if.end98, !dbg !1703

for.cond1.preheader.lr.ph.i:                      ; preds = %invoke.cont82
  %_M_start.i.i = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 0
  %wide.trip.count.i = zext i32 %call7 to i64
  %wide.trip.count75.i = zext i32 %14 to i64
  %50 = load %struct.record*, %struct.record** %_M_start.i.i, align 8, !tbaa !1704
  %51 = add nsw i64 %wide.trip.count.i, -1, !dbg !1703
  br label %for.cond1.preheader.i, !dbg !1703

for.cond1.preheader.i:                            ; preds = %for.end.i, %for.cond1.preheader.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.lr.ph.i ], [ %indvars.iv.next.i, %for.end.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !1686, metadata !DIExpression()) #11, !dbg !1699
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !1687, metadata !DIExpression()) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %52 = sub i64 %51, %indvars.iv.i, !dbg !1709
  %cmp268.i = icmp slt i64 %indvars.iv.i, %conv24, !dbg !1709
  %53 = trunc i64 %indvars.iv.i to i32, !dbg !1713
  br i1 %cmp268.i, label %for.body3.i.preheader, label %for.end.i, !dbg !1713

for.body3.i.preheader:                            ; preds = %for.cond1.preheader.i
  %54 = sub nsw i64 %wide.trip.count.i, %indvars.iv.i, !dbg !1709
  %xtraiter = and i64 %54, 3, !dbg !1714
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !1714
  br i1 %lcmp.mod, label %for.body3.i.prol.loopexit, label %for.body3.i.prol, !dbg !1714

for.body3.i.prol:                                 ; preds = %for.body3.i.preheader, %for.body3.i.prol
  %indvars.iv73.i.prol = phi i64 [ %indvars.iv.next74.i.prol, %for.body3.i.prol ], [ %indvars.iv.i, %for.body3.i.preheader ]
  %minLoc.069.i.prol = phi i32 [ %minLoc.1.i.prol, %for.body3.i.prol ], [ %53, %for.body3.i.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.i.prol ], [ %xtraiter, %for.body3.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv73.i.prol, metadata !1687, metadata !DIExpression()) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %minLoc.069.i.prol, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %arrayidx.i.prol = getelementptr inbounds float, float* %30, i64 %indvars.iv73.i.prol, !dbg !1714
  %55 = load float, float* %arrayidx.i.prol, align 4, !dbg !1714, !tbaa !1361
  call void @llvm.dbg.value(metadata float %55, metadata !1688, metadata !DIExpression()) #11, !dbg !1716
  %idxprom4.i.prol = sext i32 %minLoc.069.i.prol to i64, !dbg !1717
  %arrayidx5.i.prol = getelementptr inbounds float, float* %30, i64 %idxprom4.i.prol, !dbg !1717
  %56 = load float, float* %arrayidx5.i.prol, align 4, !dbg !1717, !tbaa !1361
  %cmp6.i.prol = fcmp olt float %55, %56, !dbg !1719
  call void @llvm.dbg.value(metadata i64 %indvars.iv73.i.prol, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %57 = trunc i64 %indvars.iv73.i.prol to i32, !dbg !1720
  %minLoc.1.i.prol = select i1 %cmp6.i.prol, i32 %57, i32 %minLoc.069.i.prol, !dbg !1720
  %indvars.iv.next74.i.prol = add nuw nsw i64 %indvars.iv73.i.prol, 1, !dbg !1721
  call void @llvm.dbg.value(metadata i32 undef, metadata !1687, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i.prol, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !1713
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !1713
  br i1 %prol.iter.cmp, label %for.body3.i.prol.loopexit, label %for.body3.i.prol, !dbg !1713, !llvm.loop !1722

for.body3.i.prol.loopexit:                        ; preds = %for.body3.i.prol, %for.body3.i.preheader
  %minLoc.1.i.lcssa.unr = phi i32 [ undef, %for.body3.i.preheader ], [ %minLoc.1.i.prol, %for.body3.i.prol ]
  %indvars.iv73.i.unr = phi i64 [ %indvars.iv.i, %for.body3.i.preheader ], [ %indvars.iv.next74.i.prol, %for.body3.i.prol ]
  %minLoc.069.i.unr = phi i32 [ %53, %for.body3.i.preheader ], [ %minLoc.1.i.prol, %for.body3.i.prol ]
  %58 = icmp ult i64 %52, 3, !dbg !1714
  br i1 %58, label %for.end.i, label %for.body3.i, !dbg !1714

for.body3.i:                                      ; preds = %for.body3.i.prol.loopexit, %for.body3.i
  %indvars.iv73.i = phi i64 [ %indvars.iv.next74.i.3, %for.body3.i ], [ %indvars.iv73.i.unr, %for.body3.i.prol.loopexit ]
  %minLoc.069.i = phi i32 [ %minLoc.1.i.3, %for.body3.i ], [ %minLoc.069.i.unr, %for.body3.i.prol.loopexit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv73.i, metadata !1687, metadata !DIExpression()) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %minLoc.069.i, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %arrayidx.i = getelementptr inbounds float, float* %30, i64 %indvars.iv73.i, !dbg !1714
  %59 = load float, float* %arrayidx.i, align 4, !dbg !1714, !tbaa !1361
  call void @llvm.dbg.value(metadata float %59, metadata !1688, metadata !DIExpression()) #11, !dbg !1716
  %idxprom4.i = sext i32 %minLoc.069.i to i64, !dbg !1717
  %arrayidx5.i = getelementptr inbounds float, float* %30, i64 %idxprom4.i, !dbg !1717
  %60 = load float, float* %arrayidx5.i, align 4, !dbg !1717, !tbaa !1361
  %cmp6.i = fcmp olt float %59, %60, !dbg !1719
  call void @llvm.dbg.value(metadata i64 %indvars.iv73.i, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %61 = trunc i64 %indvars.iv73.i to i32, !dbg !1720
  %minLoc.1.i = select i1 %cmp6.i, i32 %61, i32 %minLoc.069.i, !dbg !1720
  %indvars.iv.next74.i = add nuw nsw i64 %indvars.iv73.i, 1, !dbg !1721
  call void @llvm.dbg.value(metadata i32 undef, metadata !1687, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74.i, metadata !1687, metadata !DIExpression()) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %arrayidx.i.1 = getelementptr inbounds float, float* %30, i64 %indvars.iv.next74.i, !dbg !1714
  %62 = load float, float* %arrayidx.i.1, align 4, !dbg !1714, !tbaa !1361
  call void @llvm.dbg.value(metadata float %62, metadata !1688, metadata !DIExpression()) #11, !dbg !1716
  %idxprom4.i.1 = sext i32 %minLoc.1.i to i64, !dbg !1717
  %arrayidx5.i.1 = getelementptr inbounds float, float* %30, i64 %idxprom4.i.1, !dbg !1717
  %63 = load float, float* %arrayidx5.i.1, align 4, !dbg !1717, !tbaa !1361
  %cmp6.i.1 = fcmp olt float %62, %63, !dbg !1719
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74.i, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %64 = trunc i64 %indvars.iv.next74.i to i32, !dbg !1720
  %minLoc.1.i.1 = select i1 %cmp6.i.1, i32 %64, i32 %minLoc.1.i, !dbg !1720
  %indvars.iv.next74.i.1 = add nsw i64 %indvars.iv73.i, 2, !dbg !1721
  call void @llvm.dbg.value(metadata i32 undef, metadata !1687, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i.1, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74.i.1, metadata !1687, metadata !DIExpression()) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i.1, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %arrayidx.i.2 = getelementptr inbounds float, float* %30, i64 %indvars.iv.next74.i.1, !dbg !1714
  %65 = load float, float* %arrayidx.i.2, align 4, !dbg !1714, !tbaa !1361
  call void @llvm.dbg.value(metadata float %65, metadata !1688, metadata !DIExpression()) #11, !dbg !1716
  %idxprom4.i.2 = sext i32 %minLoc.1.i.1 to i64, !dbg !1717
  %arrayidx5.i.2 = getelementptr inbounds float, float* %30, i64 %idxprom4.i.2, !dbg !1717
  %66 = load float, float* %arrayidx5.i.2, align 4, !dbg !1717, !tbaa !1361
  %cmp6.i.2 = fcmp olt float %65, %66, !dbg !1719
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74.i.1, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %67 = trunc i64 %indvars.iv.next74.i.1 to i32, !dbg !1720
  %minLoc.1.i.2 = select i1 %cmp6.i.2, i32 %67, i32 %minLoc.1.i.1, !dbg !1720
  %indvars.iv.next74.i.2 = add nsw i64 %indvars.iv73.i, 3, !dbg !1721
  call void @llvm.dbg.value(metadata i32 undef, metadata !1687, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i.2, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74.i.2, metadata !1687, metadata !DIExpression()) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i.2, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %arrayidx.i.3 = getelementptr inbounds float, float* %30, i64 %indvars.iv.next74.i.2, !dbg !1714
  %68 = load float, float* %arrayidx.i.3, align 4, !dbg !1714, !tbaa !1361
  call void @llvm.dbg.value(metadata float %68, metadata !1688, metadata !DIExpression()) #11, !dbg !1716
  %idxprom4.i.3 = sext i32 %minLoc.1.i.2 to i64, !dbg !1717
  %arrayidx5.i.3 = getelementptr inbounds float, float* %30, i64 %idxprom4.i.3, !dbg !1717
  %69 = load float, float* %arrayidx5.i.3, align 4, !dbg !1717, !tbaa !1361
  %cmp6.i.3 = fcmp olt float %68, %69, !dbg !1719
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74.i.2, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %70 = trunc i64 %indvars.iv.next74.i.2 to i32, !dbg !1720
  %minLoc.1.i.3 = select i1 %cmp6.i.3, i32 %70, i32 %minLoc.1.i.2, !dbg !1720
  %indvars.iv.next74.i.3 = add nsw i64 %indvars.iv73.i, 4, !dbg !1721
  call void @llvm.dbg.value(metadata i32 undef, metadata !1687, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #11, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i.3, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  %exitcond.i.3 = icmp eq i64 %indvars.iv.next74.i.3, %wide.trip.count.i, !dbg !1709
  br i1 %exitcond.i.3, label %for.end.i, label %for.body3.i, !dbg !1713, !llvm.loop !1724

for.end.i:                                        ; preds = %for.body3.i.prol.loopexit, %for.body3.i, %for.cond1.preheader.i
  %minLoc.0.lcssa.i = phi i32 [ %53, %for.cond1.preheader.i ], [ %minLoc.1.i.lcssa.unr, %for.body3.i.prol.loopexit ], [ %minLoc.1.i.3, %for.body3.i ]
  call void @llvm.dbg.value(metadata i32 %minLoc.0.lcssa.i, metadata !1689, metadata !DIExpression()) #11, !dbg !1708
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()) #11, !dbg !1731
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !1730, metadata !DIExpression()) #11, !dbg !1733
  %conv7.i = sext i32 %minLoc.0.lcssa.i to i64, !dbg !1734
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()) #11, !dbg !1735
  call void @llvm.dbg.value(metadata i64 %conv7.i, metadata !1730, metadata !DIExpression()) #11, !dbg !1737
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()) #11, !dbg !1738
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !1730, metadata !DIExpression()) #11, !dbg !1740
  %71 = getelementptr inbounds %struct.record, %struct.record* %50, i64 %indvars.iv.i, i32 0, i64 0, !dbg !1741
  %72 = getelementptr inbounds %struct.record, %struct.record* %50, i64 %conv7.i, i32 0, i64 0, !dbg !1741
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 %71, i8* nonnull align 4 %72, i64 60, i1 false) #11, !dbg !1741, !tbaa.struct !1742
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()) #11, !dbg !1744
  call void @llvm.dbg.value(metadata i64 %conv7.i, metadata !1730, metadata !DIExpression()) #11, !dbg !1746
  %arrayidx14.i = getelementptr inbounds float, float* %30, i64 %indvars.iv.i, !dbg !1747
  %73 = bitcast float* %arrayidx14.i to i32*, !dbg !1747
  %74 = load i32, i32* %73, align 4, !dbg !1747, !tbaa !1361
  call void @llvm.dbg.value(metadata float* %arrayidx14.i, metadata !1693, metadata !DIExpression(DW_OP_deref)) #11, !dbg !1748
  %arrayidx16.i = getelementptr inbounds float, float* %30, i64 %conv7.i, !dbg !1749
  %75 = bitcast float* %arrayidx16.i to i32*, !dbg !1749
  %76 = load i32, i32* %75, align 4, !dbg !1749, !tbaa !1361
  store i32 %76, i32* %73, align 4, !dbg !1750, !tbaa !1361
  store i32 %74, i32* %75, align 4, !dbg !1751, !tbaa !1361
  %77 = load i32, i32* %73, align 4, !dbg !1752, !tbaa !1361
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()) #11, !dbg !1753
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !1730, metadata !DIExpression()) #11, !dbg !1755
  %distance.i = getelementptr inbounds %struct.record, %struct.record* %50, i64 %indvars.iv.i, i32 1, !dbg !1756
  %78 = bitcast float* %distance.i to i32*, !dbg !1757
  store i32 %77, i32* %78, align 4, !dbg !1757, !tbaa !1758
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !1760
  call void @llvm.dbg.value(metadata i32 undef, metadata !1686, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #11, !dbg !1699
  %exitcond76.i = icmp eq i64 %indvars.iv.next.i, %wide.trip.count75.i, !dbg !1700
  br i1 %exitcond76.i, label %invoke.cont84, label %for.cond1.preheader.i, !dbg !1703, !llvm.loop !1761

invoke.cont84:                                    ; preds = %for.end.i
  %79 = load i32, i32* %quiet, align 4, !dbg !1764, !tbaa !1358
  call void @llvm.dbg.value(metadata i32 %79, metadata !1375, metadata !DIExpression()), !dbg !1508
  %tobool85 = icmp eq i32 %79, 0, !dbg !1764
  %or.cond = and i1 %tobool85, %cmp71.i, !dbg !1766
  call void @llvm.dbg.value(metadata i32 0, metadata !1372, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.value(metadata i32 %14, metadata !1385, metadata !DIExpression()), !dbg !1556
  br i1 %or.cond, label %for.body.lr.ph, label %if.end98, !dbg !1766

for.body.lr.ph:                                   ; preds = %invoke.cont84
  %_M_start.i222 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 0
  %wide.trip.count = zext i32 %14 to i64
  br label %for.body, !dbg !1767

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1372, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1379, metadata !DIExpression()), !dbg !1513
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()), !dbg !1769
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1730, metadata !DIExpression()), !dbg !1773
  %80 = load %struct.record*, %struct.record** %_M_start.i222, align 8, !dbg !1774, !tbaa !1704
  %arraydecay91 = getelementptr inbounds %struct.record, %struct.record* %80, i64 %indvars.iv, i32 0, i64 0, !dbg !1775
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1379, metadata !DIExpression()), !dbg !1513
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()), !dbg !1776
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1730, metadata !DIExpression()), !dbg !1778
  %distance = getelementptr inbounds %struct.record, %struct.record* %80, i64 %indvars.iv, i32 1, !dbg !1779
  %81 = load float, float* %distance, align 4, !dbg !1779, !tbaa !1758
  %conv95 = fpext float %81 to double, !dbg !1780
  %call97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0), i8* nonnull %arraydecay91, double %conv95), !dbg !1781
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !1782
  call void @llvm.dbg.value(metadata i32 undef, metadata !1372, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1505
  call void @llvm.dbg.value(metadata i32 %14, metadata !1385, metadata !DIExpression()), !dbg !1556
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !1783
  br i1 %exitcond, label %if.end98, label %for.body, !dbg !1767, !llvm.loop !1784

lpad74:                                           ; preds = %invoke.cont99, %if.end98, %_Z8get_timev.exit220
  %82 = landingpad { i8*, i32 }
          cleanup, !dbg !1572
  br label %ehcleanup109, !dbg !1572

if.end98:                                         ; preds = %for.body, %invoke.cont82, %invoke.cont84
  call void @free(i8* %call45) #11, !dbg !1786
  %83 = load i8*, i8** %31, align 8, !dbg !1787, !tbaa !1354
  call void @llvm.dbg.value(metadata %struct.latLong** %d_locations, metadata !1388, metadata !DIExpression(DW_OP_deref)), !dbg !1619
  %call100 = invoke i32 @cudaFree(i8* %83)
          to label %invoke.cont99 unwind label %lpad74, !dbg !1788

invoke.cont99:                                    ; preds = %if.end98
  %84 = load i8*, i8** %32, align 8, !dbg !1789, !tbaa !1354
  call void @llvm.dbg.value(metadata float** %d_distances, metadata !1389, metadata !DIExpression(DW_OP_deref)), !dbg !1654
  %call102 = invoke i32 @cudaFree(i8* %84)
          to label %invoke.cont101 unwind label %lpad74, !dbg !1790

invoke.cont101:                                   ; preds = %invoke.cont99
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 648, i8* nonnull %17) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %16) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %15) #11, !dbg !1572
  br label %cleanup, !dbg !1572

cleanup:                                          ; preds = %if.then, %invoke.cont101
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %8) #11, !dbg !1572
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1791, metadata !DIExpression()), !dbg !1794
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1796, metadata !DIExpression(DW_OP_stack_value)), !dbg !1799
  %_M_start.i6.i205 = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %locations, i64 0, i32 0, i32 0, i32 0, !dbg !1802
  %85 = load %struct.latLong*, %struct.latLong** %_M_start.i6.i205, align 8, !dbg !1802, !tbaa !1629
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1804, metadata !DIExpression(DW_OP_stack_value)), !dbg !1809
  call void @llvm.dbg.value(metadata %struct.latLong* %85, metadata !1807, metadata !DIExpression()), !dbg !1811
  %tobool.i.i7.i206 = icmp eq %struct.latLong* %85, null, !dbg !1812
  br i1 %tobool.i.i7.i206, label %invoke.cont122, label %if.then.i.i8.i207, !dbg !1814

if.then.i.i8.i207:                                ; preds = %cleanup
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1815, metadata !DIExpression(DW_OP_stack_value)), !dbg !1820
  call void @llvm.dbg.value(metadata %struct.latLong* %85, metadata !1818, metadata !DIExpression()), !dbg !1822
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1823, metadata !DIExpression(DW_OP_stack_value)) #11, !dbg !1829
  call void @llvm.dbg.value(metadata %struct.latLong* %85, metadata !1826, metadata !DIExpression()) #11, !dbg !1831
  %86 = bitcast %struct.latLong* %85 to i8*, !dbg !1832
  call void @_ZdlPv(i8* %86) #11, !dbg !1833
  br label %invoke.cont122, !dbg !1834

invoke.cont122:                                   ; preds = %if.then.i.i8.i207, %cleanup
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #11, !dbg !1572
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1379, metadata !DIExpression()), !dbg !1513
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1835, metadata !DIExpression()), !dbg !1838
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1840, metadata !DIExpression(DW_OP_stack_value)), !dbg !1843
  %_M_start.i6.i198 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 0, !dbg !1846
  %87 = load %struct.record*, %struct.record** %_M_start.i6.i198, align 8, !dbg !1846, !tbaa !1704
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1848, metadata !DIExpression(DW_OP_stack_value)), !dbg !1853
  call void @llvm.dbg.value(metadata %struct.record* %87, metadata !1851, metadata !DIExpression()), !dbg !1855
  %tobool.i.i7.i199 = icmp eq %struct.record* %87, null, !dbg !1856
  br i1 %tobool.i.i7.i199, label %_ZNSt6vectorI6recordSaIS0_EED2Ev.exit201, label %if.then.i.i8.i200, !dbg !1858

if.then.i.i8.i200:                                ; preds = %invoke.cont122
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1859, metadata !DIExpression(DW_OP_stack_value)), !dbg !1864
  call void @llvm.dbg.value(metadata %struct.record* %87, metadata !1862, metadata !DIExpression()), !dbg !1866
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1867, metadata !DIExpression(DW_OP_stack_value)) #11, !dbg !1873
  call void @llvm.dbg.value(metadata %struct.record* %87, metadata !1870, metadata !DIExpression()) #11, !dbg !1875
  %88 = getelementptr inbounds %struct.record, %struct.record* %87, i64 0, i32 0, i64 0, !dbg !1876
  call void @_ZdlPv(i8* nonnull %88) #11, !dbg !1877
  br label %_ZNSt6vectorI6recordSaIS0_EED2Ev.exit201, !dbg !1878

_ZNSt6vectorI6recordSaIS0_EED2Ev.exit201:         ; preds = %invoke.cont122, %if.then.i.i8.i200
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %6) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #11, !dbg !1572
  ret i32 0, !dbg !1572

ehcleanup109:                                     ; preds = %lpad41, %lpad74, %lpad62, %lpad18
  %.sink236 = phi { i8*, i32 } [ %43, %lpad41 ], [ %82, %lpad74 ], [ %44, %lpad62 ], [ %29, %lpad18 ]
  %89 = extractvalue { i8*, i32 } %.sink236, 0, !dbg !1572
  %90 = extractvalue { i8*, i32 } %.sink236, 1, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21) #11, !dbg !1572
  br label %ehcleanup113, !dbg !1572

ehcleanup113:                                     ; preds = %ehcleanup109, %lpad10
  %ehselector.slot.4 = phi i32 [ %90, %ehcleanup109 ], [ %28, %lpad10 ], !dbg !1879
  %exn.slot.4 = phi i8* [ %89, %ehcleanup109 ], [ %27, %lpad10 ], !dbg !1879
  call void @llvm.lifetime.end.p0i8(i64 648, i8* nonnull %17) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %16) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %15) #11, !dbg !1572
  br label %ehcleanup118, !dbg !1572

ehcleanup118:                                     ; preds = %lpad5, %ehcleanup113
  %ehselector.slot.6 = phi i32 [ %ehselector.slot.4, %ehcleanup113 ], [ %13, %lpad5 ], !dbg !1880
  %exn.slot.6 = phi i8* [ %exn.slot.4, %ehcleanup113 ], [ %12, %lpad5 ], !dbg !1880
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %8) #11, !dbg !1572
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1791, metadata !DIExpression()), !dbg !1881
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1796, metadata !DIExpression(DW_OP_stack_value)), !dbg !1883
  %_M_start.i6.i195 = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %locations, i64 0, i32 0, i32 0, i32 0, !dbg !1885
  %91 = load %struct.latLong*, %struct.latLong** %_M_start.i6.i195, align 8, !dbg !1885, !tbaa !1629
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1804, metadata !DIExpression(DW_OP_stack_value)), !dbg !1886
  call void @llvm.dbg.value(metadata %struct.latLong* %91, metadata !1807, metadata !DIExpression()), !dbg !1888
  %tobool.i.i7.i196 = icmp eq %struct.latLong* %91, null, !dbg !1889
  br i1 %tobool.i.i7.i196, label %ehcleanup126, label %if.then.i.i8.i197, !dbg !1890

if.then.i.i8.i197:                                ; preds = %ehcleanup118
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1815, metadata !DIExpression(DW_OP_stack_value)), !dbg !1891
  call void @llvm.dbg.value(metadata %struct.latLong* %91, metadata !1818, metadata !DIExpression()), !dbg !1893
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !1823, metadata !DIExpression(DW_OP_stack_value)) #11, !dbg !1894
  call void @llvm.dbg.value(metadata %struct.latLong* %91, metadata !1826, metadata !DIExpression()) #11, !dbg !1896
  %92 = bitcast %struct.latLong* %91 to i8*, !dbg !1897
  call void @_ZdlPv(i8* %92) #11, !dbg !1898
  br label %ehcleanup126, !dbg !1899

ehcleanup126:                                     ; preds = %if.then.i.i8.i197, %ehcleanup118
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #11, !dbg !1572
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1835, metadata !DIExpression()), !dbg !1900
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1840, metadata !DIExpression(DW_OP_stack_value)), !dbg !1902
  %_M_start.i6.i = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 0, !dbg !1904
  %93 = load %struct.record*, %struct.record** %_M_start.i6.i, align 8, !dbg !1904, !tbaa !1704
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1848, metadata !DIExpression(DW_OP_stack_value)), !dbg !1905
  call void @llvm.dbg.value(metadata %struct.record* %93, metadata !1851, metadata !DIExpression()), !dbg !1907
  %tobool.i.i7.i = icmp eq %struct.record* %93, null, !dbg !1908
  br i1 %tobool.i.i7.i, label %invoke.cont129, label %if.then.i.i8.i, !dbg !1909

if.then.i.i8.i:                                   ; preds = %ehcleanup126
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1859, metadata !DIExpression(DW_OP_stack_value)), !dbg !1910
  call void @llvm.dbg.value(metadata %struct.record* %93, metadata !1862, metadata !DIExpression()), !dbg !1912
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1867, metadata !DIExpression(DW_OP_stack_value)) #11, !dbg !1913
  call void @llvm.dbg.value(metadata %struct.record* %93, metadata !1870, metadata !DIExpression()) #11, !dbg !1915
  %94 = getelementptr inbounds %struct.record, %struct.record* %93, i64 0, i32 0, i64 0, !dbg !1916
  call void @_ZdlPv(i8* nonnull %94) #11, !dbg !1917
  br label %invoke.cont129, !dbg !1918

invoke.cont129:                                   ; preds = %if.then.i.i8.i, %ehcleanup126
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %6) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #11, !dbg !1572
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #11, !dbg !1572
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.6, 0, !dbg !1572
  %lpad.val146 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.6, 1, !dbg !1572
  resume { i8*, i32 } %lpad.val146, !dbg !1572
}

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind uwtable
define dso_local i32 @_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_(i32 %argc, i8** nocapture readonly %argv, i8* %filename, i32* nocapture %r, float* nocapture %lat, float* nocapture %lng, i32* nocapture %q, i32* nocapture %t, i32* nocapture %p, i32* nocapture %d) local_unnamed_addr #0 !dbg !1919 {
entry:
  call void @llvm.dbg.value(metadata i32 %argc, metadata !1923, metadata !DIExpression()), !dbg !1935
  call void @llvm.dbg.value(metadata i8** %argv, metadata !1924, metadata !DIExpression()), !dbg !1936
  call void @llvm.dbg.value(metadata i8* %filename, metadata !1925, metadata !DIExpression()), !dbg !1937
  call void @llvm.dbg.value(metadata i32* %r, metadata !1926, metadata !DIExpression()), !dbg !1938
  call void @llvm.dbg.value(metadata float* %lat, metadata !1927, metadata !DIExpression()), !dbg !1939
  call void @llvm.dbg.value(metadata float* %lng, metadata !1928, metadata !DIExpression()), !dbg !1940
  call void @llvm.dbg.value(metadata i32* %q, metadata !1929, metadata !DIExpression()), !dbg !1941
  call void @llvm.dbg.value(metadata i32* %t, metadata !1930, metadata !DIExpression()), !dbg !1942
  call void @llvm.dbg.value(metadata i32* %p, metadata !1931, metadata !DIExpression()), !dbg !1943
  call void @llvm.dbg.value(metadata i32* %d, metadata !1932, metadata !DIExpression()), !dbg !1944
  %cmp = icmp slt i32 %argc, 2, !dbg !1945
  br i1 %cmp, label %cleanup53, label %for.body.preheader, !dbg !1947

for.body.preheader:                               ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !1948
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !1948, !tbaa !1354
  %call = tail call i8* @strncpy(i8* %filename, i8* %0, i64 100) #11, !dbg !1949
  call void @llvm.dbg.value(metadata i32 1, metadata !1933, metadata !DIExpression()), !dbg !1950
  br label %for.body, !dbg !1951

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %i.087 = phi i32 [ %inc45, %for.inc ], [ 1, %for.body.preheader ]
  call void @llvm.dbg.value(metadata i32 %i.087, metadata !1933, metadata !DIExpression()), !dbg !1950
  %idxprom = sext i32 %i.087 to i64, !dbg !1951
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom, !dbg !1951
  %1 = load i8*, i8** %arrayidx2, align 8, !dbg !1951, !tbaa !1354
  %2 = load i8, i8* %1, align 1, !dbg !1951, !tbaa !1743
  %cmp4 = icmp eq i8 %2, 45, !dbg !1956
  br i1 %cmp4, label %if.then5, label %for.inc, !dbg !1957

if.then5:                                         ; preds = %for.body
  %arrayidx8 = getelementptr inbounds i8, i8* %1, i64 1, !dbg !1958
  %3 = load i8, i8* %arrayidx8, align 1, !dbg !1958, !tbaa !1743
  call void @llvm.dbg.value(metadata i8 %3, metadata !1934, metadata !DIExpression()), !dbg !1960
  %conv9 = sext i8 %3 to i32, !dbg !1961
  switch i32 %conv9, label %for.inc [
    i32 114, label %sw.bb
    i32 108, label %sw.bb13
    i32 104, label %cleanup53
    i32 113, label %sw.bb32
    i32 116, label %sw.bb33
    i32 112, label %sw.bb34
    i32 100, label %sw.bb39
  ], !dbg !1962

sw.bb:                                            ; preds = %if.then5
  %inc = add nsw i32 %i.087, 1, !dbg !1963
  call void @llvm.dbg.value(metadata i32 %inc, metadata !1933, metadata !DIExpression()), !dbg !1950
  %idxprom10 = sext i32 %inc to i64, !dbg !1965
  %arrayidx11 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom10, !dbg !1965
  %4 = load i8*, i8** %arrayidx11, align 8, !dbg !1965, !tbaa !1354
  call void @llvm.dbg.value(metadata i8* %4, metadata !1034, metadata !DIExpression()) #11, !dbg !1966
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #11, !dbg !1968
  %conv.i = trunc i64 %call.i to i32, !dbg !1968
  store i32 %conv.i, i32* %r, align 4, !dbg !1969, !tbaa !1358
  br label %for.inc, !dbg !1970

sw.bb13:                                          ; preds = %if.then5
  %arrayidx16 = getelementptr inbounds i8, i8* %1, i64 2, !dbg !1971
  %5 = load i8, i8* %arrayidx16, align 1, !dbg !1971, !tbaa !1743
  %cmp18 = icmp eq i8 %5, 97, !dbg !1973
  %add = add nsw i32 %i.087, 1, !dbg !1974
  %idxprom20 = sext i32 %add to i64, !dbg !1974
  %arrayidx21 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom20, !dbg !1974
  %6 = load i8*, i8** %arrayidx21, align 8, !dbg !1974, !tbaa !1354
  call void @llvm.dbg.value(metadata i8* %6, metadata !1028, metadata !DIExpression()) #11, !dbg !1976
  %call.i79 = tail call double @strtod(i8* nocapture nonnull %6, i8** null) #11, !dbg !1978
  %conv23 = fptrunc double %call.i79 to float, !dbg !1974
  br i1 %cmp18, label %if.then19, label %if.else, !dbg !1979

if.then19:                                        ; preds = %sw.bb13
  store float %conv23, float* %lat, align 4, !dbg !1980, !tbaa !1361
  br label %for.inc, !dbg !1982

if.else:                                          ; preds = %sw.bb13
  store float %conv23, float* %lng, align 4, !dbg !1983, !tbaa !1361
  br label %for.inc

sw.bb32:                                          ; preds = %if.then5
  store i32 1, i32* %q, align 4, !dbg !1984, !tbaa !1358
  br label %for.inc, !dbg !1985

sw.bb33:                                          ; preds = %if.then5
  store i32 1, i32* %t, align 4, !dbg !1986, !tbaa !1358
  br label %for.inc, !dbg !1987

sw.bb34:                                          ; preds = %if.then5
  %inc35 = add nsw i32 %i.087, 1, !dbg !1988
  call void @llvm.dbg.value(metadata i32 %inc35, metadata !1933, metadata !DIExpression()), !dbg !1950
  %idxprom36 = sext i32 %inc35 to i64, !dbg !1989
  %arrayidx37 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom36, !dbg !1989
  %7 = load i8*, i8** %arrayidx37, align 8, !dbg !1989, !tbaa !1354
  call void @llvm.dbg.value(metadata i8* %7, metadata !1034, metadata !DIExpression()) #11, !dbg !1990
  %call.i80 = tail call i64 @strtol(i8* nocapture nonnull %7, i8** null, i32 10) #11, !dbg !1992
  %conv.i81 = trunc i64 %call.i80 to i32, !dbg !1992
  store i32 %conv.i81, i32* %p, align 4, !dbg !1993, !tbaa !1358
  br label %for.inc, !dbg !1994

sw.bb39:                                          ; preds = %if.then5
  %inc40 = add nsw i32 %i.087, 1, !dbg !1995
  call void @llvm.dbg.value(metadata i32 %inc40, metadata !1933, metadata !DIExpression()), !dbg !1950
  %idxprom41 = sext i32 %inc40 to i64, !dbg !1996
  %arrayidx42 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom41, !dbg !1996
  %8 = load i8*, i8** %arrayidx42, align 8, !dbg !1996, !tbaa !1354
  call void @llvm.dbg.value(metadata i8* %8, metadata !1034, metadata !DIExpression()) #11, !dbg !1997
  %call.i82 = tail call i64 @strtol(i8* nocapture nonnull %8, i8** null, i32 10) #11, !dbg !1999
  %conv.i83 = trunc i64 %call.i82 to i32, !dbg !1999
  store i32 %conv.i83, i32* %d, align 4, !dbg !2000, !tbaa !1358
  br label %for.inc, !dbg !2001

for.inc:                                          ; preds = %if.then19, %if.else, %for.body, %if.then5, %sw.bb39, %sw.bb34, %sw.bb33, %sw.bb32, %sw.bb
  %i.1 = phi i32 [ %i.087, %if.then5 ], [ %inc40, %sw.bb39 ], [ %inc35, %sw.bb34 ], [ %i.087, %sw.bb33 ], [ %i.087, %sw.bb32 ], [ %inc, %sw.bb ], [ %i.087, %for.body ], [ %add, %if.else ], [ %add, %if.then19 ], !dbg !2002
  call void @llvm.dbg.value(metadata i32 %i.1, metadata !1933, metadata !DIExpression()), !dbg !1950
  %inc45 = add nsw i32 %i.1, 1, !dbg !2003
  call void @llvm.dbg.value(metadata i32 %inc45, metadata !1933, metadata !DIExpression()), !dbg !1950
  %cmp1 = icmp slt i32 %inc45, %argc, !dbg !2004
  br i1 %cmp1, label %for.body, label %for.end, !dbg !2005, !llvm.loop !2006

for.end:                                          ; preds = %for.inc
  %9 = load i32, i32* %d, align 4, !dbg !2008, !tbaa !1358
  %cmp46 = icmp sgt i32 %9, -1, !dbg !2010
  %10 = load i32, i32* %p, align 4, !dbg !2011, !tbaa !1358
  br i1 %cmp46, label %land.lhs.true, label %lor.lhs.false, !dbg !2012

land.lhs.true:                                    ; preds = %for.end
  %cmp47 = icmp slt i32 %10, 0, !dbg !2013
  br i1 %cmp47, label %cleanup53, label %if.end52, !dbg !2014

lor.lhs.false:                                    ; preds = %for.end
  %cmp48 = icmp sgt i32 %10, -1, !dbg !2015
  br i1 %cmp48, label %cleanup53, label %if.end52, !dbg !2016

if.end52:                                         ; preds = %land.lhs.true, %lor.lhs.false
  br label %cleanup53, !dbg !2017

cleanup53:                                        ; preds = %if.then5, %lor.lhs.false, %if.end52, %land.lhs.true, %entry
  %retval.1 = phi i32 [ 1, %entry ], [ 0, %if.end52 ], [ 1, %land.lhs.true ], [ 1, %lor.lhs.false ], [ 1, %if.then5 ], !dbg !2018
  ret i32 %retval.1, !dbg !2019
}

; Function Attrs: nounwind uwtable
define dso_local void @_Z10printUsagev() local_unnamed_addr #0 !dbg !2020 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @str, i64 0, i64 0)), !dbg !2021
  %putchar = tail call i32 @putchar(i32 10), !dbg !2022
  %puts23 = tail call i32 @puts(i8* getelementptr inbounds ([89 x i8], [89 x i8]* @str.25, i64 0, i64 0)), !dbg !2023
  %putchar24 = tail call i32 @putchar(i32 10), !dbg !2024
  %puts25 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.26, i64 0, i64 0)), !dbg !2025
  %puts26 = tail call i32 @puts(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @str.27, i64 0, i64 0)), !dbg !2026
  %putchar27 = tail call i32 @putchar(i32 10), !dbg !2027
  %puts28 = tail call i32 @puts(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @str.28, i64 0, i64 0)), !dbg !2028
  %puts29 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @str.29, i64 0, i64 0)), !dbg !2029
  %puts30 = tail call i32 @puts(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @str.30, i64 0, i64 0)), !dbg !2030
  %puts31 = tail call i32 @puts(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @str.31, i64 0, i64 0)), !dbg !2031
  %putchar32 = tail call i32 @putchar(i32 10), !dbg !2032
  %puts33 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @str.32, i64 0, i64 0)), !dbg !2033
  %puts34 = tail call i32 @puts(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @str.33, i64 0, i64 0)), !dbg !2034
  %puts35 = tail call i32 @puts(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @str.34, i64 0, i64 0)), !dbg !2035
  %putchar36 = tail call i32 @putchar(i32 10), !dbg !2036
  %puts37 = tail call i32 @puts(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @str.35, i64 0, i64 0)), !dbg !2037
  %puts38 = tail call i32 @puts(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @str.36, i64 0, i64 0)), !dbg !2038
  %putchar39 = tail call i32 @putchar(i32 10), !dbg !2039
  %putchar40 = tail call i32 @putchar(i32 10), !dbg !2040
  %puts41 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @str.37, i64 0, i64 0)), !dbg !2041
  %puts42 = tail call i32 @puts(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @str.38, i64 0, i64 0)), !dbg !2042
  %puts43 = tail call i32 @puts(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @str.39, i64 0, i64 0)), !dbg !2043
  ret void, !dbg !2044
}

; Function Attrs: uwtable
define dso_local i32 @_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE(i8* nocapture readonly %filename, %"class.std::vector"* dereferenceable(24) %records, %"class.std::vector.0"* dereferenceable(24) %locations) local_unnamed_addr #4 !dbg !2045 {
entry:
  %dbname = alloca [64 x i8], align 16
  %record = alloca %struct.record, align 4
  %latLong = alloca i64, align 8
  %tmpcast = bitcast i64* %latLong to %struct.latLong*
  %substr = alloca [6 x i8], align 1
  %substr96 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 0
  call void @llvm.dbg.value(metadata i8* %filename, metadata !2049, metadata !DIExpression()), !dbg !2118
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !2050, metadata !DIExpression()), !dbg !2119
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !2051, metadata !DIExpression()), !dbg !2120
  call void @llvm.dbg.value(metadata i32 0, metadata !2104, metadata !DIExpression()), !dbg !2121
  %0 = getelementptr inbounds [64 x i8], [64 x i8]* %dbname, i64 0, i64 0, !dbg !2122
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %0) #11, !dbg !2122
  call void @llvm.dbg.declare(metadata [64 x i8]* %dbname, metadata !2105, metadata !DIExpression()), !dbg !2123
  call void @llvm.dbg.value(metadata i32 0, metadata !2109, metadata !DIExpression()), !dbg !2124
  %call = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !2125
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !2052, metadata !DIExpression()), !dbg !2126
  call void @llvm.dbg.value(metadata i32 0, metadata !2109, metadata !DIExpression()), !dbg !2124
  %call191 = call i32 @feof(%struct._IO_FILE* %call) #11, !dbg !2127
  %tobool92 = icmp eq i32 %call191, 0, !dbg !2127
  br i1 %tobool92, label %while.body.lr.ph, label %while.end49, !dbg !2128

while.body.lr.ph:                                 ; preds = %entry
  %1 = getelementptr inbounds %struct.record, %struct.record* %record, i64 0, i32 0, i64 0
  %2 = bitcast i64* %latLong to i8*
  %3 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 0
  %arrayidx26 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 5
  %lat = bitcast i64* %latLong to float*
  %lng = getelementptr inbounds %struct.latLong, %struct.latLong* %tmpcast, i64 0, i32 1
  %_M_finish.i = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %locations, i64 0, i32 0, i32 0, i32 1
  %_M_end_of_storage.i = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %locations, i64 0, i32 0, i32 0, i32 2
  %_M_finish.i75 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 1
  %_M_end_of_storage.i76 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 2
  %scevgep = getelementptr inbounds %struct.record, %struct.record* %record, i64 0, i32 0, i64 28, !dbg !2128
  %scevgep97 = getelementptr inbounds %struct.record, %struct.record* %record, i64 0, i32 0, i64 33, !dbg !2128
  br label %while.body, !dbg !2128

while.body:                                       ; preds = %while.body.lr.ph, %while.end
  %recNum.093 = phi i32 [ 0, %while.body.lr.ph ], [ %recNum.182, %while.end ]
  call void @llvm.dbg.value(metadata i32 %recNum.093, metadata !2109, metadata !DIExpression()), !dbg !2124
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i8* nonnull %0), !dbg !2129
  %cmp = icmp eq i32 %call2, 1, !dbg !2131
  br i1 %cmp, label %if.end, label %if.then, !dbg !2132

if.then:                                          ; preds = %while.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2133, !tbaa !1354
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %4) #12, !dbg !2135
  call void @exit(i32 0) #13, !dbg !2136
  unreachable, !dbg !2136

if.end:                                           ; preds = %while.body
  %call5 = call %struct._IO_FILE* @fopen(i8* nonnull %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !2137
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call5, metadata !2103, metadata !DIExpression()), !dbg !2138
  %tobool6 = icmp eq %struct._IO_FILE* %call5, null, !dbg !2139
  br i1 %tobool6, label %if.then7, label %while.cond10.preheader, !dbg !2141

while.cond10.preheader:                           ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 %recNum.093, metadata !2109, metadata !DIExpression()), !dbg !2124
  %call1188 = call i32 @feof(%struct._IO_FILE* nonnull %call5) #11, !dbg !2142
  %tobool1289 = icmp eq i32 %call1188, 0, !dbg !2142
  br i1 %tobool1289, label %while.body14, label %while.end, !dbg !2143

if.then7:                                         ; preds = %if.end
  %puts = call i32 @puts(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.40, i64 0, i64 0)), !dbg !2144
  call void @exit(i32 1) #13, !dbg !2146
  unreachable, !dbg !2146

while.body14:                                     ; preds = %while.cond10.preheader, %cleanup
  %recNum.190 = phi i32 [ %inc46, %cleanup ], [ %recNum.093, %while.cond10.preheader ]
  call void @llvm.dbg.value(metadata i32 %recNum.190, metadata !2109, metadata !DIExpression()), !dbg !2124
  call void @llvm.lifetime.start.p0i8(i64 60, i8* nonnull %1) #11, !dbg !2147
  call void @llvm.dbg.value(metadata i8* %2, metadata !2113, metadata !DIExpression()), !dbg !2148
  call void @llvm.dbg.value(metadata i8* %2, metadata !2149, metadata !DIExpression()), !dbg !2153
  call void @llvm.dbg.value(metadata i8* %2, metadata !2155, metadata !DIExpression()), !dbg !2163
  call void @llvm.dbg.value(metadata i8* %2, metadata !2167, metadata !DIExpression()), !dbg !2172
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #11, !dbg !2174
  %fgets_unlocked = call i8* @fgets_unlocked(i8* nonnull %1, i32 49, %struct._IO_FILE* nonnull %call5), !dbg !2175
  %fgetc_unlocked = call i32 @fgetc_unlocked(%struct._IO_FILE* nonnull %call5), !dbg !2176
  %call18 = call i32 @feof(%struct._IO_FILE* nonnull %call5) #11, !dbg !2177
  %tobool19 = icmp eq i32 %call18, 0, !dbg !2177
  br i1 %tobool19, label %if.end21, label %cleanup.thread, !dbg !2179

cleanup.thread:                                   ; preds = %while.body14
  call void @llvm.dbg.value(metadata i32 %recNum.190, metadata !2109, metadata !DIExpression()), !dbg !2124
  call void @llvm.dbg.value(metadata i32 %recNum.190, metadata !2109, metadata !DIExpression()), !dbg !2124
  call void @llvm.dbg.value(metadata i32 %recNum.190, metadata !2109, metadata !DIExpression()), !dbg !2124
  call void @llvm.dbg.value(metadata i32 %recNum.190, metadata !2109, metadata !DIExpression()), !dbg !2124
  call void @llvm.dbg.value(metadata i32 %recNum.190, metadata !2109, metadata !DIExpression()), !dbg !2124
  call void @llvm.dbg.value(metadata i32 %recNum.190, metadata !2109, metadata !DIExpression()), !dbg !2124
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #11, !dbg !2180
  call void @llvm.lifetime.end.p0i8(i64 60, i8* nonnull %1) #11, !dbg !2180
  br label %while.end

if.end21:                                         ; preds = %while.body14
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %3) #11, !dbg !2181
  call void @llvm.dbg.declare(metadata [6 x i8]* %substr, metadata !2114, metadata !DIExpression()), !dbg !2182
  call void @llvm.dbg.value(metadata i32 0, metadata !2104, metadata !DIExpression()), !dbg !2121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %substr96, i8* nonnull align 4 %scevgep, i64 5, i1 false), !dbg !2183
  store i8 0, i8* %arrayidx26, align 1, !dbg !2186, !tbaa !1743
  call void @llvm.dbg.value(metadata i8* %3, metadata !1028, metadata !DIExpression()) #11, !dbg !2187
  %call.i = call double @strtod(i8* nocapture nonnull %3, i8** null) #11, !dbg !2189
  %conv = fptrunc double %call.i to float, !dbg !2190
  store float %conv, float* %lat, align 8, !dbg !2191, !tbaa !2192
  call void @llvm.dbg.value(metadata i32 0, metadata !2104, metadata !DIExpression()), !dbg !2121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %substr96, i8* nonnull align 1 %scevgep97, i64 5, i1 false), !dbg !2194
  store i8 0, i8* %arrayidx26, align 1, !dbg !2197, !tbaa !1743
  call void @llvm.dbg.value(metadata i8* %3, metadata !1028, metadata !DIExpression()) #11, !dbg !2198
  %call.i74 = call double @strtod(i8* nocapture nonnull %3, i8** null) #11, !dbg !2200
  %conv45 = fptrunc double %call.i74 to float, !dbg !2201
  store float %conv45, float* %lng, align 4, !dbg !2202, !tbaa !2203
  call void @llvm.dbg.value(metadata %struct.latLong* %tmpcast, metadata !2113, metadata !DIExpression()), !dbg !2148
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !2152, metadata !DIExpression()), !dbg !2204
  call void @llvm.dbg.value(metadata %struct.latLong* %tmpcast, metadata !2149, metadata !DIExpression()), !dbg !2153
  %6 = load %struct.latLong*, %struct.latLong** %_M_finish.i, align 8, !dbg !2205, !tbaa !2206
  %7 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage.i, align 8, !dbg !2207, !tbaa !2208
  %cmp.i = icmp eq %struct.latLong* %6, %7, !dbg !2209
  br i1 %cmp.i, label %if.else.i, label %if.then.i, !dbg !2210

if.then.i:                                        ; preds = %if.end21
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !2161, metadata !DIExpression()), !dbg !2211
  call void @llvm.dbg.value(metadata %struct.latLong* %6, metadata !2162, metadata !DIExpression()), !dbg !2212
  call void @llvm.dbg.value(metadata %struct.latLong* %tmpcast, metadata !2155, metadata !DIExpression()), !dbg !2163
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, metadata !2170, metadata !DIExpression()), !dbg !2213
  call void @llvm.dbg.value(metadata %struct.latLong* %6, metadata !2171, metadata !DIExpression()), !dbg !2214
  call void @llvm.dbg.value(metadata %struct.latLong* %tmpcast, metadata !2167, metadata !DIExpression()), !dbg !2172
  %8 = bitcast %struct.latLong* %6 to i64*, !dbg !2215
  %9 = load i64, i64* %latLong, align 8, !dbg !2215
  store i64 %9, i64* %8, align 4, !dbg !2215
  %10 = load %struct.latLong*, %struct.latLong** %_M_finish.i, align 8, !dbg !2216, !tbaa !2206
  %incdec.ptr.i = getelementptr inbounds %struct.latLong, %struct.latLong* %10, i64 1, !dbg !2216
  store %struct.latLong* %incdec.ptr.i, %struct.latLong** %_M_finish.i, align 8, !dbg !2216, !tbaa !2206
  br label %_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_.exit, !dbg !2217

if.else.i:                                        ; preds = %if.end21
  call void @_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector.0"* nonnull %locations, %struct.latLong* %6, %struct.latLong* nonnull dereferenceable(8) %tmpcast), !dbg !2218
  br label %_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_.exit

_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_.exit: ; preds = %if.then.i, %if.else.i
  call void @llvm.dbg.value(metadata %struct.record* %record, metadata !2110, metadata !DIExpression()), !dbg !2219
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !2220, metadata !DIExpression()), !dbg !2224
  call void @llvm.dbg.value(metadata %struct.record* %record, metadata !2223, metadata !DIExpression()), !dbg !2226
  %11 = load %struct.record*, %struct.record** %_M_finish.i75, align 8, !dbg !2227, !tbaa !2229
  %12 = load %struct.record*, %struct.record** %_M_end_of_storage.i76, align 8, !dbg !2230, !tbaa !2231
  %cmp.i77 = icmp eq %struct.record* %11, %12, !dbg !2232
  br i1 %cmp.i77, label %if.else.i80, label %if.then.i79, !dbg !2233

if.then.i79:                                      ; preds = %_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_.exit
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !2234, metadata !DIExpression()), !dbg !2242
  call void @llvm.dbg.value(metadata %struct.record* %11, metadata !2240, metadata !DIExpression()), !dbg !2245
  call void @llvm.dbg.value(metadata %struct.record* %record, metadata !2241, metadata !DIExpression()), !dbg !2246
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !2247, metadata !DIExpression()) #11, !dbg !2252
  call void @llvm.dbg.value(metadata %struct.record* %11, metadata !2250, metadata !DIExpression()) #11, !dbg !2254
  call void @llvm.dbg.value(metadata %struct.record* %record, metadata !2251, metadata !DIExpression()) #11, !dbg !2255
  %13 = getelementptr inbounds %struct.record, %struct.record* %11, i64 0, i32 0, i64 0, !dbg !2256
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* nonnull align 4 %1, i64 60, i1 false) #11, !dbg !2257, !tbaa.struct !1742
  %14 = load %struct.record*, %struct.record** %_M_finish.i75, align 8, !dbg !2258, !tbaa !2229
  %incdec.ptr.i78 = getelementptr inbounds %struct.record, %struct.record* %14, i64 1, !dbg !2258
  store %struct.record* %incdec.ptr.i78, %struct.record** %_M_finish.i75, align 8, !dbg !2258, !tbaa !2229
  br label %cleanup, !dbg !2259

if.else.i80:                                      ; preds = %_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_.exit
  call void @_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector"* nonnull %records, %struct.record* %11, %struct.record* nonnull dereferenceable(60) %record), !dbg !2260
  br label %cleanup

cleanup:                                          ; preds = %if.else.i80, %if.then.i79
  %inc46 = add nsw i32 %recNum.190, 1, !dbg !2261
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %3) #11, !dbg !2180
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #11, !dbg !2180
  call void @llvm.lifetime.end.p0i8(i64 60, i8* nonnull %1) #11, !dbg !2180
  call void @llvm.dbg.value(metadata i32 %inc46, metadata !2109, metadata !DIExpression()), !dbg !2124
  %call11 = call i32 @feof(%struct._IO_FILE* nonnull %call5) #11, !dbg !2142
  %tobool12 = icmp eq i32 %call11, 0, !dbg !2142
  br i1 %tobool12, label %while.body14, label %while.end, !dbg !2143

while.end:                                        ; preds = %cleanup, %while.cond10.preheader, %cleanup.thread
  %recNum.182 = phi i32 [ %recNum.190, %cleanup.thread ], [ %recNum.093, %while.cond10.preheader ], [ %inc46, %cleanup ]
  call void @llvm.dbg.value(metadata i32 undef, metadata !2109, metadata !DIExpression()), !dbg !2124
  %call48 = call i32 @fclose(%struct._IO_FILE* nonnull %call5), !dbg !2262
  call void @llvm.dbg.value(metadata i32 %recNum.182, metadata !2109, metadata !DIExpression()), !dbg !2124
  %call1 = call i32 @feof(%struct._IO_FILE* %call) #11, !dbg !2127
  %tobool = icmp eq i32 %call1, 0, !dbg !2127
  br i1 %tobool, label %while.body, label %while.end49, !dbg !2128, !llvm.loop !2263

while.end49:                                      ; preds = %while.end, %entry
  %recNum.0.lcssa = phi i32 [ 0, %entry ], [ %recNum.182, %while.end ]
  call void @llvm.dbg.value(metadata i32 %recNum.0.lcssa, metadata !2109, metadata !DIExpression()), !dbg !2124
  %call50 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !2265
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %0) #11, !dbg !2266
  ret i32 %recNum.0.lcssa, !dbg !2267
}

declare dso_local i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) local_unnamed_addr #6

declare dso_local i32 @cudaThreadSynchronize() local_unnamed_addr #6

declare dso_local i32 @cudaMemGetInfo(i64*, i64*) local_unnamed_addr #6

; Function Attrs: nounwind
declare dso_local i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #7

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) local_unnamed_addr #3

declare dso_local i32 @cudaMalloc(i8**, i64) local_unnamed_addr #6

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #6

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

; Function Attrs: nounwind uwtable
define dso_local void @_Z10findLowestRSt6vectorI6recordSaIS0_EEPfii(%"class.std::vector"* nocapture readonly dereferenceable(24) %records, float* nocapture %distances, i32 %numRecords, i32 %topN) local_unnamed_addr #0 !dbg !1679 {
entry:
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1678, metadata !DIExpression()), !dbg !2268
  call void @llvm.dbg.value(metadata float* %distances, metadata !1683, metadata !DIExpression()), !dbg !2269
  call void @llvm.dbg.value(metadata i32 %numRecords, metadata !1684, metadata !DIExpression()), !dbg !2270
  call void @llvm.dbg.value(metadata i32 %topN, metadata !1685, metadata !DIExpression()), !dbg !2271
  call void @llvm.dbg.value(metadata i32 0, metadata !1686, metadata !DIExpression()), !dbg !2272
  %cmp71 = icmp sgt i32 %topN, 0, !dbg !2273
  br i1 %cmp71, label %for.cond1.preheader.lr.ph, label %for.end27, !dbg !1762

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %_M_start.i = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 0
  %0 = sext i32 %numRecords to i64, !dbg !1762
  %wide.trip.count = zext i32 %numRecords to i64
  %wide.trip.count75 = zext i32 %topN to i64
  %1 = add nsw i64 %wide.trip.count, -1, !dbg !1762
  br label %for.cond1.preheader, !dbg !1762

for.cond1.preheader:                              ; preds = %for.end, %for.cond1.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next, %for.end ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1686, metadata !DIExpression()), !dbg !2272
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1687, metadata !DIExpression()), !dbg !2274
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1689, metadata !DIExpression()), !dbg !2275
  %2 = sub i64 %1, %indvars.iv, !dbg !2276
  %cmp268 = icmp slt i64 %indvars.iv, %0, !dbg !2276
  %3 = trunc i64 %indvars.iv to i32, !dbg !1725
  br i1 %cmp268, label %for.body3.preheader, label %for.end, !dbg !1725

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %4 = sub nsw i64 %wide.trip.count, %indvars.iv, !dbg !2276
  %xtraiter = and i64 %4, 3, !dbg !2277
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !2277
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol, !dbg !2277

for.body3.prol:                                   ; preds = %for.body3.preheader, %for.body3.prol
  %indvars.iv73.prol = phi i64 [ %indvars.iv.next74.prol, %for.body3.prol ], [ %indvars.iv, %for.body3.preheader ]
  %minLoc.069.prol = phi i32 [ %minLoc.1.prol, %for.body3.prol ], [ %3, %for.body3.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.prol ], [ %xtraiter, %for.body3.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv73.prol, metadata !1687, metadata !DIExpression()), !dbg !2274
  call void @llvm.dbg.value(metadata i32 %minLoc.069.prol, metadata !1689, metadata !DIExpression()), !dbg !2275
  %arrayidx.prol = getelementptr inbounds float, float* %distances, i64 %indvars.iv73.prol, !dbg !2277
  %5 = load float, float* %arrayidx.prol, align 4, !dbg !2277, !tbaa !1361
  call void @llvm.dbg.value(metadata float %5, metadata !1688, metadata !DIExpression()), !dbg !2278
  %idxprom4.prol = sext i32 %minLoc.069.prol to i64, !dbg !2279
  %arrayidx5.prol = getelementptr inbounds float, float* %distances, i64 %idxprom4.prol, !dbg !2279
  %6 = load float, float* %arrayidx5.prol, align 4, !dbg !2279, !tbaa !1361
  %cmp6.prol = fcmp olt float %5, %6, !dbg !2280
  call void @llvm.dbg.value(metadata i64 %indvars.iv73.prol, metadata !1689, metadata !DIExpression()), !dbg !2275
  %7 = trunc i64 %indvars.iv73.prol to i32, !dbg !2281
  %minLoc.1.prol = select i1 %cmp6.prol, i32 %7, i32 %minLoc.069.prol, !dbg !2281
  %indvars.iv.next74.prol = add nuw nsw i64 %indvars.iv73.prol, 1, !dbg !2282
  call void @llvm.dbg.value(metadata i32 undef, metadata !1687, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !2274
  call void @llvm.dbg.value(metadata i32 %minLoc.1.prol, metadata !1689, metadata !DIExpression()), !dbg !2275
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !1725
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !1725
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit, label %for.body3.prol, !dbg !1725, !llvm.loop !2283

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.body3.preheader
  %minLoc.1.lcssa.unr = phi i32 [ undef, %for.body3.preheader ], [ %minLoc.1.prol, %for.body3.prol ]
  %indvars.iv73.unr = phi i64 [ %indvars.iv, %for.body3.preheader ], [ %indvars.iv.next74.prol, %for.body3.prol ]
  %minLoc.069.unr = phi i32 [ %3, %for.body3.preheader ], [ %minLoc.1.prol, %for.body3.prol ]
  %8 = icmp ult i64 %2, 3, !dbg !2277
  br i1 %8, label %for.end, label %for.body3, !dbg !2277

for.body3:                                        ; preds = %for.body3.prol.loopexit, %for.body3
  %indvars.iv73 = phi i64 [ %indvars.iv.next74.3, %for.body3 ], [ %indvars.iv73.unr, %for.body3.prol.loopexit ]
  %minLoc.069 = phi i32 [ %minLoc.1.3, %for.body3 ], [ %minLoc.069.unr, %for.body3.prol.loopexit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv73, metadata !1687, metadata !DIExpression()), !dbg !2274
  call void @llvm.dbg.value(metadata i32 %minLoc.069, metadata !1689, metadata !DIExpression()), !dbg !2275
  %arrayidx = getelementptr inbounds float, float* %distances, i64 %indvars.iv73, !dbg !2277
  %9 = load float, float* %arrayidx, align 4, !dbg !2277, !tbaa !1361
  call void @llvm.dbg.value(metadata float %9, metadata !1688, metadata !DIExpression()), !dbg !2278
  %idxprom4 = sext i32 %minLoc.069 to i64, !dbg !2279
  %arrayidx5 = getelementptr inbounds float, float* %distances, i64 %idxprom4, !dbg !2279
  %10 = load float, float* %arrayidx5, align 4, !dbg !2279, !tbaa !1361
  %cmp6 = fcmp olt float %9, %10, !dbg !2280
  call void @llvm.dbg.value(metadata i64 %indvars.iv73, metadata !1689, metadata !DIExpression()), !dbg !2275
  %11 = trunc i64 %indvars.iv73 to i32, !dbg !2281
  %minLoc.1 = select i1 %cmp6, i32 %11, i32 %minLoc.069, !dbg !2281
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1, !dbg !2282
  call void @llvm.dbg.value(metadata i32 undef, metadata !1687, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !2274
  call void @llvm.dbg.value(metadata i32 %minLoc.1, metadata !1689, metadata !DIExpression()), !dbg !2275
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74, metadata !1687, metadata !DIExpression()), !dbg !2274
  call void @llvm.dbg.value(metadata i32 %minLoc.1, metadata !1689, metadata !DIExpression()), !dbg !2275
  %arrayidx.1 = getelementptr inbounds float, float* %distances, i64 %indvars.iv.next74, !dbg !2277
  %12 = load float, float* %arrayidx.1, align 4, !dbg !2277, !tbaa !1361
  call void @llvm.dbg.value(metadata float %12, metadata !1688, metadata !DIExpression()), !dbg !2278
  %idxprom4.1 = sext i32 %minLoc.1 to i64, !dbg !2279
  %arrayidx5.1 = getelementptr inbounds float, float* %distances, i64 %idxprom4.1, !dbg !2279
  %13 = load float, float* %arrayidx5.1, align 4, !dbg !2279, !tbaa !1361
  %cmp6.1 = fcmp olt float %12, %13, !dbg !2280
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74, metadata !1689, metadata !DIExpression()), !dbg !2275
  %14 = trunc i64 %indvars.iv.next74 to i32, !dbg !2281
  %minLoc.1.1 = select i1 %cmp6.1, i32 %14, i32 %minLoc.1, !dbg !2281
  %indvars.iv.next74.1 = add nsw i64 %indvars.iv73, 2, !dbg !2282
  call void @llvm.dbg.value(metadata i32 undef, metadata !1687, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !2274
  call void @llvm.dbg.value(metadata i32 %minLoc.1.1, metadata !1689, metadata !DIExpression()), !dbg !2275
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74.1, metadata !1687, metadata !DIExpression()), !dbg !2274
  call void @llvm.dbg.value(metadata i32 %minLoc.1.1, metadata !1689, metadata !DIExpression()), !dbg !2275
  %arrayidx.2 = getelementptr inbounds float, float* %distances, i64 %indvars.iv.next74.1, !dbg !2277
  %15 = load float, float* %arrayidx.2, align 4, !dbg !2277, !tbaa !1361
  call void @llvm.dbg.value(metadata float %15, metadata !1688, metadata !DIExpression()), !dbg !2278
  %idxprom4.2 = sext i32 %minLoc.1.1 to i64, !dbg !2279
  %arrayidx5.2 = getelementptr inbounds float, float* %distances, i64 %idxprom4.2, !dbg !2279
  %16 = load float, float* %arrayidx5.2, align 4, !dbg !2279, !tbaa !1361
  %cmp6.2 = fcmp olt float %15, %16, !dbg !2280
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74.1, metadata !1689, metadata !DIExpression()), !dbg !2275
  %17 = trunc i64 %indvars.iv.next74.1 to i32, !dbg !2281
  %minLoc.1.2 = select i1 %cmp6.2, i32 %17, i32 %minLoc.1.1, !dbg !2281
  %indvars.iv.next74.2 = add nsw i64 %indvars.iv73, 3, !dbg !2282
  call void @llvm.dbg.value(metadata i32 undef, metadata !1687, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !2274
  call void @llvm.dbg.value(metadata i32 %minLoc.1.2, metadata !1689, metadata !DIExpression()), !dbg !2275
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74.2, metadata !1687, metadata !DIExpression()), !dbg !2274
  call void @llvm.dbg.value(metadata i32 %minLoc.1.2, metadata !1689, metadata !DIExpression()), !dbg !2275
  %arrayidx.3 = getelementptr inbounds float, float* %distances, i64 %indvars.iv.next74.2, !dbg !2277
  %18 = load float, float* %arrayidx.3, align 4, !dbg !2277, !tbaa !1361
  call void @llvm.dbg.value(metadata float %18, metadata !1688, metadata !DIExpression()), !dbg !2278
  %idxprom4.3 = sext i32 %minLoc.1.2 to i64, !dbg !2279
  %arrayidx5.3 = getelementptr inbounds float, float* %distances, i64 %idxprom4.3, !dbg !2279
  %19 = load float, float* %arrayidx5.3, align 4, !dbg !2279, !tbaa !1361
  %cmp6.3 = fcmp olt float %18, %19, !dbg !2280
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next74.2, metadata !1689, metadata !DIExpression()), !dbg !2275
  %20 = trunc i64 %indvars.iv.next74.2 to i32, !dbg !2281
  %minLoc.1.3 = select i1 %cmp6.3, i32 %20, i32 %minLoc.1.2, !dbg !2281
  %indvars.iv.next74.3 = add nsw i64 %indvars.iv73, 4, !dbg !2282
  call void @llvm.dbg.value(metadata i32 undef, metadata !1687, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !2274
  call void @llvm.dbg.value(metadata i32 %minLoc.1.3, metadata !1689, metadata !DIExpression()), !dbg !2275
  %exitcond.3 = icmp eq i64 %indvars.iv.next74.3, %wide.trip.count, !dbg !2276
  br i1 %exitcond.3, label %for.end, label %for.body3, !dbg !1725, !llvm.loop !1724

for.end:                                          ; preds = %for.body3.prol.loopexit, %for.body3, %for.cond1.preheader
  %minLoc.0.lcssa = phi i32 [ %3, %for.cond1.preheader ], [ %minLoc.1.lcssa.unr, %for.body3.prol.loopexit ], [ %minLoc.1.3, %for.body3 ]
  call void @llvm.dbg.value(metadata i32 %minLoc.0.lcssa, metadata !1689, metadata !DIExpression()), !dbg !2275
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()), !dbg !2284
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1730, metadata !DIExpression()), !dbg !2286
  %21 = load %struct.record*, %struct.record** %_M_start.i, align 8, !dbg !2287, !tbaa !1704
  %conv7 = sext i32 %minLoc.0.lcssa to i64, !dbg !2288
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()), !dbg !2289
  call void @llvm.dbg.value(metadata i64 %conv7, metadata !1730, metadata !DIExpression()), !dbg !2291
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()), !dbg !2292
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1730, metadata !DIExpression()), !dbg !2294
  %22 = getelementptr inbounds %struct.record, %struct.record* %21, i64 %indvars.iv, i32 0, i64 0, !dbg !2295
  %23 = getelementptr inbounds %struct.record, %struct.record* %21, i64 %conv7, i32 0, i64 0, !dbg !2295
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 %22, i8* nonnull align 4 %23, i64 60, i1 false), !dbg !2295, !tbaa.struct !1742
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()), !dbg !2296
  call void @llvm.dbg.value(metadata i64 %conv7, metadata !1730, metadata !DIExpression()), !dbg !2298
  %24 = load %struct.record*, %struct.record** %_M_start.i, align 8, !dbg !2299, !tbaa !1704
  %25 = getelementptr inbounds %struct.record, %struct.record* %24, i64 %conv7, i32 0, i64 0, !dbg !2300
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 %25, i8* nonnull align 4 %22, i64 60, i1 false), !dbg !2300, !tbaa.struct !1742
  %arrayidx14 = getelementptr inbounds float, float* %distances, i64 %indvars.iv, !dbg !2301
  %26 = bitcast float* %arrayidx14 to i32*, !dbg !2301
  %27 = load i32, i32* %26, align 4, !dbg !2301, !tbaa !1361
  call void @llvm.dbg.value(metadata float* %arrayidx14, metadata !1693, metadata !DIExpression(DW_OP_deref)), !dbg !2302
  %arrayidx16 = getelementptr inbounds float, float* %distances, i64 %conv7, !dbg !2303
  %28 = bitcast float* %arrayidx16 to i32*, !dbg !2303
  %29 = load i32, i32* %28, align 4, !dbg !2303, !tbaa !1361
  store i32 %29, i32* %26, align 4, !dbg !2304, !tbaa !1361
  store i32 %27, i32* %28, align 4, !dbg !2305, !tbaa !1361
  %30 = load i32, i32* %26, align 4, !dbg !2306, !tbaa !1361
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, metadata !1727, metadata !DIExpression()), !dbg !2307
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1730, metadata !DIExpression()), !dbg !2309
  %31 = load %struct.record*, %struct.record** %_M_start.i, align 8, !dbg !2310, !tbaa !1704
  %distance = getelementptr inbounds %struct.record, %struct.record* %31, i64 %indvars.iv, i32 1, !dbg !2311
  %32 = bitcast float* %distance to i32*, !dbg !2312
  store i32 %30, i32* %32, align 4, !dbg !2312, !tbaa !1758
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !2313
  call void @llvm.dbg.value(metadata i32 undef, metadata !1686, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !2272
  %exitcond76 = icmp eq i64 %indvars.iv.next, %wide.trip.count75, !dbg !2273
  br i1 %exitcond76, label %for.end27, label %for.cond1.preheader, !dbg !1762, !llvm.loop !1761

for.end27:                                        ; preds = %for.end, %entry
  ret void, !dbg !2314
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local void @free(i8* nocapture) local_unnamed_addr #3

declare dso_local i32 @cudaFree(i8*) local_unnamed_addr #6

; Function Attrs: nounwind
declare dso_local noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i32 @feof(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i32 @fscanf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8* nocapture readonly, i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local double @strtod(i8* readonly, i8** nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

; Function Attrs: nobuiltin nounwind
declare dso_local void @_ZdlPv(i8*) local_unnamed_addr #8

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector.0"* %this, %struct.latLong* %__position.coerce, %struct.latLong* dereferenceable(8) %__x) local_unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2315 {
entry:
  %0 = ptrtoint %struct.latLong* %__position.coerce to i64
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2318, metadata !DIExpression()), !dbg !2330
  call void @llvm.dbg.value(metadata %struct.latLong* %__x, metadata !2320, metadata !DIExpression()), !dbg !2331
  %_M_finish = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %this, i64 0, i32 0, i32 0, i32 1, !dbg !2332
  %1 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8, !dbg !2332, !tbaa !2206
  %_M_end_of_storage = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %this, i64 0, i32 0, i32 0, i32 2, !dbg !2333
  %2 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage, align 8, !dbg !2333, !tbaa !2208
  %cmp = icmp eq %struct.latLong* %1, %2, !dbg !2334
  br i1 %cmp, label %if.else, label %if.then, !dbg !2335

if.then:                                          ; preds = %entry
  %add.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %1, i64 -1, !dbg !2336
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2161, metadata !DIExpression()), !dbg !2337
  call void @llvm.dbg.value(metadata %struct.latLong* %1, metadata !2162, metadata !DIExpression()), !dbg !2339
  call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr, metadata !2155, metadata !DIExpression()), !dbg !2340
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2170, metadata !DIExpression()), !dbg !2341
  call void @llvm.dbg.value(metadata %struct.latLong* %1, metadata !2171, metadata !DIExpression()), !dbg !2343
  call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr, metadata !2167, metadata !DIExpression()), !dbg !2344
  %3 = bitcast %struct.latLong* %add.ptr to i64*, !dbg !2345
  %4 = bitcast %struct.latLong* %1 to i64*, !dbg !2345
  %5 = load i64, i64* %3, align 4, !dbg !2345
  store i64 %5, i64* %4, align 4, !dbg !2345
  %6 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8, !dbg !2346, !tbaa !2206
  %incdec.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %6, i64 1, !dbg !2346
  store %struct.latLong* %incdec.ptr, %struct.latLong** %_M_finish, align 8, !dbg !2346, !tbaa !2206
  %7 = bitcast %struct.latLong* %__x to i64*, !dbg !2347
  %8 = load i64, i64* %7, align 4, !dbg !2347
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, metadata !2319, metadata !DIExpression()), !dbg !2348
  %add.ptr12 = getelementptr inbounds %struct.latLong, %struct.latLong* %6, i64 -1, !dbg !2349
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2350, metadata !DIExpression()), !dbg !2361
  call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr12, metadata !2356, metadata !DIExpression()), !dbg !2363
  call void @llvm.dbg.value(metadata %struct.latLong* %6, metadata !2357, metadata !DIExpression()), !dbg !2364
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2365, metadata !DIExpression()), !dbg !2372
  call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr12, metadata !2368, metadata !DIExpression()), !dbg !2374
  call void @llvm.dbg.value(metadata %struct.latLong* %6, metadata !2369, metadata !DIExpression()), !dbg !2375
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2376, metadata !DIExpression()), !dbg !2383
  call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr12, metadata !2379, metadata !DIExpression()), !dbg !2385
  call void @llvm.dbg.value(metadata %struct.latLong* %6, metadata !2380, metadata !DIExpression()), !dbg !2386
  call void @llvm.dbg.value(metadata i8 1, metadata !2381, metadata !DIExpression()), !dbg !2387
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2388, metadata !DIExpression()) #11, !dbg !2413
  call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr12, metadata !2409, metadata !DIExpression()) #11, !dbg !2415
  call void @llvm.dbg.value(metadata %struct.latLong* %6, metadata !2410, metadata !DIExpression()) #11, !dbg !2416
  %sub.ptr.lhs.cast.i.i.i.i = ptrtoint %struct.latLong* %add.ptr12 to i64, !dbg !2417
  %sub.ptr.sub.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i, %0, !dbg !2417
  %tobool.i.i.i.i = icmp eq i64 %sub.ptr.sub.i.i.i.i, 0, !dbg !2418
  br i1 %tobool.i.i.i.i, label %_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_.exit, label %if.then.i.i.i.i, !dbg !2420

if.then.i.i.i.i:                                  ; preds = %if.then
  %sub.ptr.div.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i, 3, !dbg !2417
  call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i.i.i.i, metadata !2411, metadata !DIExpression()) #11, !dbg !2421
  %.pre.i.i.i.i = sub nsw i64 0, %sub.ptr.div.i.i.i.i, !dbg !2422
  %.pre9.i.i.i.i = getelementptr inbounds %struct.latLong, %struct.latLong* %6, i64 %.pre.i.i.i.i, !dbg !2422
  %9 = bitcast %struct.latLong* %.pre9.i.i.i.i to i8*, !dbg !2423
  %10 = bitcast %struct.latLong* %__position.coerce to i8*, !dbg !2423
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 4 %9, i8* align 4 %10, i64 %sub.ptr.sub.i.i.i.i, i1 false) #11, !dbg !2423
  br label %_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_.exit, !dbg !2423

_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_.exit: ; preds = %if.then, %if.then.i.i.i.i
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, metadata !2319, metadata !DIExpression()), !dbg !2348
  %11 = bitcast %struct.latLong* %__position.coerce to i64*, !dbg !2424
  store i64 %8, i64* %11, align 4, !dbg !2424
  br label %if.end70, !dbg !2425

if.else:                                          ; preds = %entry
  %12 = ptrtoint %struct.latLong* %1 to i64, !dbg !2335
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2426, metadata !DIExpression()), !dbg !2433
  call void @llvm.dbg.value(metadata i64 1, metadata !2429, metadata !DIExpression()), !dbg !2435
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2436, metadata !DIExpression()), !dbg !2439
  %13 = bitcast %struct.latLong** %_M_finish to i64*, !dbg !2442
  %14 = bitcast %"class.std::vector.0"* %this to i64*, !dbg !2443
  %15 = load i64, i64* %14, align 8, !dbg !2443, !tbaa !1629
  %sub.ptr.sub.i21.i = sub i64 %12, %15, !dbg !2444
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, 3, !dbg !2444
  call void @llvm.dbg.value(metadata i64 1, metadata !2429, metadata !DIExpression()), !dbg !2435
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2436, metadata !DIExpression()), !dbg !2445
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2436, metadata !DIExpression()), !dbg !2447
  %cmp.i.i = icmp eq i64 %sub.ptr.sub.i21.i, 0, !dbg !2449
  %.sroa.speculated.i = select i1 %cmp.i.i, i64 1, i64 %sub.ptr.div.i22.i, !dbg !2462
  %add.i = add nsw i64 %.sroa.speculated.i, %sub.ptr.div.i22.i, !dbg !2463
  call void @llvm.dbg.value(metadata i64 %add.i, metadata !2431, metadata !DIExpression()), !dbg !2464
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2436, metadata !DIExpression()), !dbg !2465
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i22.i, !dbg !2467
  %cmp9.i = icmp ugt i64 %add.i, 2305843009213693951, !dbg !2468
  %or.cond.i = or i1 %cmp7.i, %cmp9.i, !dbg !2469
  %cond.i113 = select i1 %or.cond.i, i64 2305843009213693951, i64 %add.i, !dbg !2469
  call void @llvm.dbg.value(metadata i64 %cond.i113, metadata !2324, metadata !DIExpression()), !dbg !2470
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2471, metadata !DIExpression()), !dbg !2474
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, metadata !2476, metadata !DIExpression()), !dbg !2481
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2479, metadata !DIExpression(DW_OP_stack_value)), !dbg !2483
  %16 = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %this, i64 0, i32 0, i32 0, i32 0, !dbg !2484
  %17 = inttoptr i64 %15 to %struct.latLong*, !dbg !2484
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, metadata !2319, metadata !DIExpression()), !dbg !2348
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, metadata !2485, metadata !DIExpression()), !dbg !2492
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, metadata !2491, metadata !DIExpression()), !dbg !2494
  %sub.ptr.sub.i = sub i64 %0, %15, !dbg !2495
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, 3, !dbg !2495
  call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i, metadata !2327, metadata !DIExpression()), !dbg !2496
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2497, metadata !DIExpression(DW_OP_stack_value)), !dbg !2501
  call void @llvm.dbg.value(metadata i64 %cond.i113, metadata !2500, metadata !DIExpression()), !dbg !2503
  %cmp.i = icmp eq i64 %cond.i113, 0, !dbg !2504
  br i1 %cmp.i, label %invoke.cont, label %cond.true.i, !dbg !2505

cond.true.i:                                      ; preds = %if.else
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2506, metadata !DIExpression(DW_OP_stack_value)), !dbg !2510
  call void @llvm.dbg.value(metadata i64 %cond.i113, metadata !2509, metadata !DIExpression()), !dbg !2512
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2513, metadata !DIExpression(DW_OP_stack_value)), !dbg !2518
  call void @llvm.dbg.value(metadata i64 %cond.i113, metadata !2516, metadata !DIExpression()), !dbg !2520
  call void @llvm.dbg.value(metadata i8* null, metadata !2517, metadata !DIExpression()), !dbg !2521
  %cmp.i.i.i = icmp ugt i64 %cond.i113, 2305843009213693951, !dbg !2522
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m.exit.i, !dbg !2524

if.then.i.i.i:                                    ; preds = %cond.true.i
  tail call void @_ZSt17__throw_bad_allocv() #14, !dbg !2525
  unreachable, !dbg !2525

_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m.exit.i: ; preds = %cond.true.i
  %mul.i.i.i = shl i64 %cond.i113, 3, !dbg !2526
  %call2.i.i.i = tail call i8* @_Znwm(i64 %mul.i.i.i), !dbg !2527
  %18 = bitcast i8* %call2.i.i.i to %struct.latLong*, !dbg !2528
  %.pr = load %struct.latLong*, %struct.latLong** %16, align 8, !dbg !2529, !tbaa !1629
  br label %invoke.cont, !dbg !2505

invoke.cont:                                      ; preds = %_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m.exit.i, %if.else
  %19 = phi %struct.latLong* [ %.pr, %_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m.exit.i ], [ %17, %if.else ], !dbg !2529
  %20 = phi i8* [ %call2.i.i.i, %_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m.exit.i ], [ null, %if.else ], !dbg !2505
  %cond.i = phi %struct.latLong* [ %18, %_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m.exit.i ], [ null, %if.else ], !dbg !2505
  call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, metadata !2328, metadata !DIExpression()), !dbg !2531
  call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, metadata !2329, metadata !DIExpression()), !dbg !2532
  %add.ptr24 = getelementptr inbounds %struct.latLong, %struct.latLong* %cond.i, i64 %sub.ptr.div.i, !dbg !2533
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2161, metadata !DIExpression()), !dbg !2534
  call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr24, metadata !2162, metadata !DIExpression()), !dbg !2536
  call void @llvm.dbg.value(metadata %struct.latLong* %__x, metadata !2155, metadata !DIExpression()), !dbg !2537
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !2170, metadata !DIExpression()), !dbg !2538
  call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr24, metadata !2171, metadata !DIExpression()), !dbg !2540
  call void @llvm.dbg.value(metadata %struct.latLong* %__x, metadata !2167, metadata !DIExpression()), !dbg !2541
  %21 = bitcast %struct.latLong* %__x to i64*, !dbg !2542
  %22 = bitcast %struct.latLong* %add.ptr24 to i64*, !dbg !2542
  %23 = load i64, i64* %21, align 4, !dbg !2542
  store i64 %23, i64* %22, align 4, !dbg !2542
  call void @llvm.dbg.value(metadata %struct.latLong* null, metadata !2329, metadata !DIExpression()), !dbg !2532
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, metadata !2319, metadata !DIExpression()), !dbg !2348
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !2543, metadata !DIExpression()), !dbg !2556
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2549, metadata !DIExpression()), !dbg !2558
  call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, metadata !2550, metadata !DIExpression()), !dbg !2559
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !2560, metadata !DIExpression()), !dbg !2567
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2563, metadata !DIExpression()), !dbg !2569
  call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, metadata !2564, metadata !DIExpression()), !dbg !2570
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !2571, metadata !DIExpression()), !dbg !2578
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2574, metadata !DIExpression()), !dbg !2580
  call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, metadata !2575, metadata !DIExpression()), !dbg !2581
  call void @llvm.dbg.value(metadata i8 1, metadata !2576, metadata !DIExpression()), !dbg !2582
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !2583, metadata !DIExpression()), !dbg !2592
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2590, metadata !DIExpression()), !dbg !2594
  call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, metadata !2591, metadata !DIExpression()), !dbg !2595
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !2596, metadata !DIExpression()), !dbg !2604
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2599, metadata !DIExpression()), !dbg !2606
  call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, metadata !2600, metadata !DIExpression()), !dbg !2607
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !2608, metadata !DIExpression()), !dbg !2614
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2611, metadata !DIExpression()), !dbg !2616
  call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, metadata !2612, metadata !DIExpression()), !dbg !2617
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !2618, metadata !DIExpression()), !dbg !2624
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2621, metadata !DIExpression()), !dbg !2626
  call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, metadata !2622, metadata !DIExpression()), !dbg !2627
  call void @llvm.dbg.value(metadata i8 1, metadata !2623, metadata !DIExpression()), !dbg !2628
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !2629, metadata !DIExpression()) #11, !dbg !2637
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2634, metadata !DIExpression()) #11, !dbg !2639
  call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, metadata !2635, metadata !DIExpression()) #11, !dbg !2640
  %sub.ptr.rhs.cast.i.i.i.i.i.i.i.i103 = ptrtoint %struct.latLong* %19 to i64, !dbg !2641
  %sub.ptr.sub.i.i.i.i.i.i.i.i104 = sub i64 %0, %sub.ptr.rhs.cast.i.i.i.i.i.i.i.i103, !dbg !2641
  %sub.ptr.div.i.i.i.i.i.i.i.i105 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, 3, !dbg !2641
  call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i.i.i.i.i.i.i.i105, metadata !2636, metadata !DIExpression()) #11, !dbg !2642
  %tobool.i.i.i.i.i.i.i.i106 = icmp eq i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, 0, !dbg !2643
  br i1 %tobool.i.i.i.i.i.i.i.i106, label %invoke.cont30, label %if.then.i.i.i.i.i.i.i.i107, !dbg !2645

if.then.i.i.i.i.i.i.i.i107:                       ; preds = %invoke.cont
  %24 = bitcast %struct.latLong* %19 to i8*, !dbg !2646
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %20, i8* align 4 %24, i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, i1 false) #11, !dbg !2646
  br label %invoke.cont30, !dbg !2646

invoke.cont30:                                    ; preds = %if.then.i.i.i.i.i.i.i.i107, %invoke.cont
  %add.ptr.i.i.i.i.i.i.i.i108 = getelementptr inbounds %struct.latLong, %struct.latLong* %cond.i, i64 %sub.ptr.div.i.i.i.i.i.i.i.i105, !dbg !2647
  call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr.i.i.i.i.i.i.i.i108, metadata !2329, metadata !DIExpression()), !dbg !2532
  %incdec.ptr32 = getelementptr inbounds %struct.latLong, %struct.latLong* %add.ptr.i.i.i.i.i.i.i.i108, i64 1, !dbg !2648
  call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, metadata !2329, metadata !DIExpression()), !dbg !2532
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, metadata !2319, metadata !DIExpression()), !dbg !2348
  %25 = load i64, i64* %13, align 8, !dbg !2649, !tbaa !2206
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2543, metadata !DIExpression()), !dbg !2650
  call void @llvm.dbg.value(metadata %struct.latLong** %_M_finish, metadata !2549, metadata !DIExpression(DW_OP_deref)), !dbg !2652
  call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, metadata !2550, metadata !DIExpression()), !dbg !2653
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2560, metadata !DIExpression()), !dbg !2654
  call void @llvm.dbg.value(metadata %struct.latLong** %_M_finish, metadata !2563, metadata !DIExpression(DW_OP_deref)), !dbg !2656
  call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, metadata !2564, metadata !DIExpression()), !dbg !2657
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2571, metadata !DIExpression()), !dbg !2658
  call void @llvm.dbg.value(metadata %struct.latLong** %_M_finish, metadata !2574, metadata !DIExpression(DW_OP_deref)), !dbg !2660
  call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, metadata !2575, metadata !DIExpression()), !dbg !2661
  call void @llvm.dbg.value(metadata i8 1, metadata !2576, metadata !DIExpression()), !dbg !2662
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2583, metadata !DIExpression()), !dbg !2663
  call void @llvm.dbg.value(metadata %struct.latLong** %_M_finish, metadata !2590, metadata !DIExpression(DW_OP_deref)), !dbg !2665
  call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, metadata !2591, metadata !DIExpression()), !dbg !2666
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2596, metadata !DIExpression()), !dbg !2667
  call void @llvm.dbg.value(metadata %struct.latLong** %_M_finish, metadata !2599, metadata !DIExpression(DW_OP_deref)), !dbg !2669
  call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, metadata !2600, metadata !DIExpression()), !dbg !2670
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2608, metadata !DIExpression()), !dbg !2671
  call void @llvm.dbg.value(metadata %struct.latLong** %_M_finish, metadata !2611, metadata !DIExpression(DW_OP_deref)), !dbg !2673
  call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, metadata !2612, metadata !DIExpression()), !dbg !2674
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2618, metadata !DIExpression()), !dbg !2675
  call void @llvm.dbg.value(metadata %struct.latLong** %_M_finish, metadata !2621, metadata !DIExpression(DW_OP_deref)), !dbg !2677
  call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, metadata !2622, metadata !DIExpression()), !dbg !2678
  call void @llvm.dbg.value(metadata i8 1, metadata !2623, metadata !DIExpression()), !dbg !2679
  call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, metadata !2629, metadata !DIExpression()) #11, !dbg !2680
  call void @llvm.dbg.value(metadata %struct.latLong** %_M_finish, metadata !2634, metadata !DIExpression(DW_OP_deref)) #11, !dbg !2682
  call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, metadata !2635, metadata !DIExpression()) #11, !dbg !2683
  %sub.ptr.sub.i.i.i.i.i.i.i.i = sub i64 %25, %0, !dbg !2684
  %sub.ptr.div.i.i.i.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, 3, !dbg !2684
  call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i.i.i.i.i.i.i.i, metadata !2636, metadata !DIExpression()) #11, !dbg !2685
  %tobool.i.i.i.i.i.i.i.i = icmp eq i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, 0, !dbg !2686
  br i1 %tobool.i.i.i.i.i.i.i.i, label %invoke.cont39, label %if.then.i.i.i.i.i.i.i.i, !dbg !2687

if.then.i.i.i.i.i.i.i.i:                          ; preds = %invoke.cont30
  %26 = bitcast %struct.latLong* %incdec.ptr32 to i8*, !dbg !2688
  %27 = bitcast %struct.latLong* %__position.coerce to i8*, !dbg !2688
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 4 %26, i8* align 4 %27, i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, i1 false) #11, !dbg !2688
  br label %invoke.cont39, !dbg !2688

invoke.cont39:                                    ; preds = %if.then.i.i.i.i.i.i.i.i, %invoke.cont30
  %add.ptr.i.i.i.i.i.i.i.i = getelementptr inbounds %struct.latLong, %struct.latLong* %incdec.ptr32, i64 %sub.ptr.div.i.i.i.i.i.i.i.i, !dbg !2689
  call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr.i.i.i.i.i.i.i.i, metadata !2329, metadata !DIExpression()), !dbg !2532
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !1804, metadata !DIExpression(DW_OP_stack_value)), !dbg !2690
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !1807, metadata !DIExpression()), !dbg !2692
  %tobool.i97 = icmp eq %struct.latLong* %19, null, !dbg !2693
  br i1 %tobool.i97, label %_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m.exit99, label %if.then.i98, !dbg !2694

if.then.i98:                                      ; preds = %invoke.cont39
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !1815, metadata !DIExpression(DW_OP_stack_value)), !dbg !2695
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !1818, metadata !DIExpression()), !dbg !2697
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, metadata !1823, metadata !DIExpression(DW_OP_stack_value)) #11, !dbg !2698
  call void @llvm.dbg.value(metadata %struct.latLong* %19, metadata !1826, metadata !DIExpression()) #11, !dbg !2700
  %28 = bitcast %struct.latLong* %19 to i8*, !dbg !2701
  tail call void @_ZdlPv(i8* %28) #11, !dbg !2702
  br label %_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m.exit99, !dbg !2703

_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m.exit99: ; preds = %invoke.cont39, %if.then.i98
  %29 = bitcast %"class.std::vector.0"* %this to i8**, !dbg !2704
  store i8* %20, i8** %29, align 8, !dbg !2704, !tbaa !1629
  store %struct.latLong* %add.ptr.i.i.i.i.i.i.i.i, %struct.latLong** %_M_finish, align 8, !dbg !2705, !tbaa !2206
  %add.ptr67 = getelementptr inbounds %struct.latLong, %struct.latLong* %cond.i, i64 %cond.i113, !dbg !2706
  store %struct.latLong* %add.ptr67, %struct.latLong** %_M_end_of_storage, align 8, !dbg !2707, !tbaa !2208
  br label %if.end70

if.end70:                                         ; preds = %_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m.exit99, %_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_.exit
  ret void, !dbg !2708
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1) #1

; Function Attrs: noreturn
declare dso_local void @_ZSt17__throw_bad_allocv() local_unnamed_addr #9

; Function Attrs: nobuiltin
declare dso_local noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #10

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector"* %this, %struct.record* %__position.coerce, %struct.record* dereferenceable(60) %__x) local_unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2709 {
entry:
  %__x_copy = alloca %struct.record, align 4
  %0 = ptrtoint %struct.record* %__position.coerce to i64
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2711, metadata !DIExpression()), !dbg !2722
  call void @llvm.dbg.value(metadata %struct.record* %__x, metadata !2713, metadata !DIExpression()), !dbg !2723
  %_M_finish = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 1, !dbg !2724
  %1 = load %struct.record*, %struct.record** %_M_finish, align 8, !dbg !2724, !tbaa !2229
  %_M_end_of_storage = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 2, !dbg !2725
  %2 = load %struct.record*, %struct.record** %_M_end_of_storage, align 8, !dbg !2725, !tbaa !2231
  %cmp = icmp eq %struct.record* %1, %2, !dbg !2726
  br i1 %cmp, label %if.else, label %if.then, !dbg !2727

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2234, metadata !DIExpression()), !dbg !2728
  call void @llvm.dbg.value(metadata %struct.record* %1, metadata !2240, metadata !DIExpression()), !dbg !2730
  call void @llvm.dbg.value(metadata %struct.record* %1, metadata !2241, metadata !DIExpression(DW_OP_constu, 60, DW_OP_minus, DW_OP_stack_value)), !dbg !2731
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2247, metadata !DIExpression()) #11, !dbg !2732
  call void @llvm.dbg.value(metadata %struct.record* %1, metadata !2250, metadata !DIExpression()) #11, !dbg !2734
  call void @llvm.dbg.value(metadata %struct.record* %1, metadata !2251, metadata !DIExpression(DW_OP_constu, 60, DW_OP_minus, DW_OP_stack_value)) #11, !dbg !2735
  %3 = getelementptr inbounds %struct.record, %struct.record* %1, i64 0, i32 0, i64 0, !dbg !2736
  %4 = getelementptr inbounds %struct.record, %struct.record* %1, i64 -1, i32 0, i64 0, !dbg !2737
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %3, i8* nonnull align 4 %4, i64 60, i1 false) #11, !dbg !2737, !tbaa.struct !1742
  %5 = load %struct.record*, %struct.record** %_M_finish, align 8, !dbg !2738, !tbaa !2229
  %incdec.ptr = getelementptr inbounds %struct.record, %struct.record* %5, i64 1, !dbg !2738
  store %struct.record* %incdec.ptr, %struct.record** %_M_finish, align 8, !dbg !2738, !tbaa !2229
  %__x_copy.0.__x_copy.0..sroa_idx = getelementptr inbounds %struct.record, %struct.record* %__x_copy, i64 0, i32 0, i64 0, !dbg !2739
  call void @llvm.lifetime.start.p0i8(i64 60, i8* nonnull %__x_copy.0.__x_copy.0..sroa_idx), !dbg !2739
  %6 = getelementptr inbounds %struct.record, %struct.record* %__x, i64 0, i32 0, i64 0, !dbg !2740
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 %__x_copy.0.__x_copy.0..sroa_idx, i8* nonnull align 4 %6, i64 60, i1 false), !dbg !2740, !tbaa.struct !1742
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, metadata !2712, metadata !DIExpression()), !dbg !2741
  %add.ptr12 = getelementptr inbounds %struct.record, %struct.record* %5, i64 -1, !dbg !2742
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2743, metadata !DIExpression()), !dbg !2753
  call void @llvm.dbg.value(metadata %struct.record* %add.ptr12, metadata !2748, metadata !DIExpression()), !dbg !2755
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2756, metadata !DIExpression()), !dbg !2762
  call void @llvm.dbg.value(metadata %struct.record* %add.ptr12, metadata !2759, metadata !DIExpression()), !dbg !2764
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2765, metadata !DIExpression()), !dbg !2771
  call void @llvm.dbg.value(metadata %struct.record* %add.ptr12, metadata !2768, metadata !DIExpression()), !dbg !2773
  call void @llvm.dbg.value(metadata i8 1, metadata !2770, metadata !DIExpression()), !dbg !2774
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2775, metadata !DIExpression()) #11, !dbg !2784
  call void @llvm.dbg.value(metadata %struct.record* %add.ptr12, metadata !2781, metadata !DIExpression()) #11, !dbg !2786
  %sub.ptr.lhs.cast.i.i.i.i = ptrtoint %struct.record* %add.ptr12 to i64, !dbg !2787
  %sub.ptr.sub.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i, %0, !dbg !2787
  call void @llvm.dbg.value(metadata i64 %sub.ptr.sub.i.i.i.i, metadata !2783, metadata !DIExpression(DW_OP_constu, 60, DW_OP_div, DW_OP_stack_value)) #11, !dbg !2788
  %7 = icmp eq i64 %sub.ptr.sub.i.i.i.i, 0, !dbg !2789
  br i1 %7, label %if.then._ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit_crit_edge, label %if.then.i.i.i.i, !dbg !2791

if.then._ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit_crit_edge: ; preds = %if.then
  %.pre = getelementptr inbounds %struct.record, %struct.record* %__position.coerce, i64 0, i32 0, i64 0, !dbg !2792
  br label %_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit, !dbg !2791

if.then.i.i.i.i:                                  ; preds = %if.then
  %.pre.i.i.i.i = sdiv i64 %sub.ptr.sub.i.i.i.i, -60, !dbg !2793
  call void @llvm.dbg.value(metadata %struct.record* %5, metadata !2782, metadata !DIExpression()) #11, !dbg !2794
  call void @llvm.dbg.value(metadata %struct.record* %5, metadata !2769, metadata !DIExpression()), !dbg !2795
  call void @llvm.dbg.value(metadata %struct.record* %5, metadata !2760, metadata !DIExpression()), !dbg !2796
  call void @llvm.dbg.value(metadata %struct.record* %5, metadata !2749, metadata !DIExpression()), !dbg !2797
  %8 = getelementptr inbounds %struct.record, %struct.record* %5, i64 %.pre.i.i.i.i, i32 0, i64 0, !dbg !2798
  %9 = getelementptr inbounds %struct.record, %struct.record* %__position.coerce, i64 0, i32 0, i64 0, !dbg !2798
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 4 %8, i8* align 4 %9, i64 %sub.ptr.sub.i.i.i.i, i1 false) #11, !dbg !2798
  br label %_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit, !dbg !2798

_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit: ; preds = %if.then._ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit_crit_edge, %if.then.i.i.i.i
  %.pre-phi = phi i8* [ %.pre, %if.then._ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit_crit_edge ], [ %9, %if.then.i.i.i.i ], !dbg !2792
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, metadata !2712, metadata !DIExpression()), !dbg !2741
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 %.pre-phi, i8* nonnull align 4 %__x_copy.0.__x_copy.0..sroa_idx, i64 60, i1 false), !dbg !2792, !tbaa.struct !1742
  call void @llvm.lifetime.end.p0i8(i64 60, i8* nonnull %__x_copy.0.__x_copy.0..sroa_idx), !dbg !2799
  br label %if.end70, !dbg !2800

if.else:                                          ; preds = %entry
  %10 = ptrtoint %struct.record* %1 to i64, !dbg !2727
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2801, metadata !DIExpression()), !dbg !2808
  call void @llvm.dbg.value(metadata i64 1, metadata !2804, metadata !DIExpression()), !dbg !2810
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2811, metadata !DIExpression()), !dbg !2814
  %11 = bitcast %struct.record** %_M_finish to i64*, !dbg !2817
  %12 = bitcast %"class.std::vector"* %this to i64*, !dbg !2818
  %13 = load i64, i64* %12, align 8, !dbg !2818, !tbaa !1704
  %sub.ptr.sub.i21.i = sub i64 %10, %13, !dbg !2819
  %sub.ptr.div.i22.i = sdiv exact i64 %sub.ptr.sub.i21.i, 60, !dbg !2819
  call void @llvm.dbg.value(metadata i64 1, metadata !2804, metadata !DIExpression()), !dbg !2810
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2811, metadata !DIExpression()), !dbg !2820
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2811, metadata !DIExpression()), !dbg !2822
  %14 = icmp eq i64 %sub.ptr.sub.i21.i, 0, !dbg !2824
  %.sroa.speculated.i = select i1 %14, i64 1, i64 %sub.ptr.div.i22.i, !dbg !2826
  %add.i = add nsw i64 %.sroa.speculated.i, %sub.ptr.div.i22.i, !dbg !2827
  call void @llvm.dbg.value(metadata i64 %add.i, metadata !2806, metadata !DIExpression()), !dbg !2828
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2811, metadata !DIExpression()), !dbg !2829
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i22.i, !dbg !2831
  %cmp9.i = icmp ugt i64 %add.i, 307445734561825860, !dbg !2832
  %or.cond.i = or i1 %cmp7.i, %cmp9.i, !dbg !2833
  %cond.i112 = select i1 %or.cond.i, i64 307445734561825860, i64 %add.i, !dbg !2833
  call void @llvm.dbg.value(metadata i64 %cond.i112, metadata !2717, metadata !DIExpression()), !dbg !2834
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2835, metadata !DIExpression()), !dbg !2838
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, metadata !2840, metadata !DIExpression()), !dbg !2845
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2843, metadata !DIExpression(DW_OP_stack_value)), !dbg !2847
  %15 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 0, !dbg !2848
  %16 = inttoptr i64 %13 to %struct.record*, !dbg !2848
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, metadata !2712, metadata !DIExpression()), !dbg !2741
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, metadata !2849, metadata !DIExpression()), !dbg !2856
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, metadata !2855, metadata !DIExpression()), !dbg !2858
  %sub.ptr.sub.i = sub i64 %0, %13, !dbg !2859
  %sub.ptr.div.i = sdiv exact i64 %sub.ptr.sub.i, 60, !dbg !2859
  call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i, metadata !2719, metadata !DIExpression()), !dbg !2860
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2861, metadata !DIExpression(DW_OP_stack_value)), !dbg !2865
  call void @llvm.dbg.value(metadata i64 %cond.i112, metadata !2864, metadata !DIExpression()), !dbg !2867
  %cmp.i = icmp eq i64 %cond.i112, 0, !dbg !2868
  br i1 %cmp.i, label %invoke.cont, label %cond.true.i, !dbg !2869

cond.true.i:                                      ; preds = %if.else
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2870, metadata !DIExpression(DW_OP_stack_value)), !dbg !2874
  call void @llvm.dbg.value(metadata i64 %cond.i112, metadata !2873, metadata !DIExpression()), !dbg !2876
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2877, metadata !DIExpression(DW_OP_stack_value)), !dbg !2882
  call void @llvm.dbg.value(metadata i64 %cond.i112, metadata !2880, metadata !DIExpression()), !dbg !2884
  call void @llvm.dbg.value(metadata i8* null, metadata !2881, metadata !DIExpression()), !dbg !2885
  %cmp.i.i.i = icmp ugt i64 %cond.i112, 307445734561825860, !dbg !2886
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m.exit.i, !dbg !2888

if.then.i.i.i:                                    ; preds = %cond.true.i
  tail call void @_ZSt17__throw_bad_allocv() #14, !dbg !2889
  unreachable, !dbg !2889

_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m.exit.i: ; preds = %cond.true.i
  %mul.i.i.i = mul i64 %cond.i112, 60, !dbg !2890
  %call2.i.i.i = tail call i8* @_Znwm(i64 %mul.i.i.i), !dbg !2891
  %17 = bitcast i8* %call2.i.i.i to %struct.record*, !dbg !2892
  %.pr = load %struct.record*, %struct.record** %15, align 8, !dbg !2893, !tbaa !1704
  br label %invoke.cont, !dbg !2869

invoke.cont:                                      ; preds = %_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m.exit.i, %if.else
  %18 = phi %struct.record* [ %.pr, %_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m.exit.i ], [ %16, %if.else ], !dbg !2893
  %cond.i = phi %struct.record* [ %17, %_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m.exit.i ], [ null, %if.else ], !dbg !2869
  call void @llvm.dbg.value(metadata %struct.record* %cond.i, metadata !2720, metadata !DIExpression()), !dbg !2895
  call void @llvm.dbg.value(metadata %struct.record* %cond.i, metadata !2721, metadata !DIExpression()), !dbg !2896
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2234, metadata !DIExpression()), !dbg !2897
  call void @llvm.dbg.value(metadata %struct.record* %__x, metadata !2241, metadata !DIExpression()), !dbg !2899
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !2247, metadata !DIExpression()) #11, !dbg !2900
  call void @llvm.dbg.value(metadata %struct.record* %__x, metadata !2251, metadata !DIExpression()) #11, !dbg !2902
  %19 = getelementptr inbounds %struct.record, %struct.record* %cond.i, i64 %sub.ptr.div.i, i32 0, i64 0, !dbg !2903
  %20 = getelementptr inbounds %struct.record, %struct.record* %__x, i64 0, i32 0, i64 0, !dbg !2904
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %19, i8* nonnull align 4 %20, i64 60, i1 false) #11, !dbg !2904, !tbaa.struct !1742
  call void @llvm.dbg.value(metadata %struct.record* null, metadata !2721, metadata !DIExpression()), !dbg !2896
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, metadata !2712, metadata !DIExpression()), !dbg !2741
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !2905, metadata !DIExpression()), !dbg !2917
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2910, metadata !DIExpression()), !dbg !2919
  call void @llvm.dbg.value(metadata %struct.record* %cond.i, metadata !2911, metadata !DIExpression()), !dbg !2920
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !2921, metadata !DIExpression()), !dbg !2928
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2924, metadata !DIExpression()), !dbg !2930
  call void @llvm.dbg.value(metadata %struct.record* %cond.i, metadata !2925, metadata !DIExpression()), !dbg !2931
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !2932, metadata !DIExpression()), !dbg !2939
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2935, metadata !DIExpression()), !dbg !2941
  call void @llvm.dbg.value(metadata %struct.record* %cond.i, metadata !2936, metadata !DIExpression()), !dbg !2942
  call void @llvm.dbg.value(metadata i8 1, metadata !2937, metadata !DIExpression()), !dbg !2943
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !2944, metadata !DIExpression()), !dbg !2950
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2948, metadata !DIExpression()), !dbg !2952
  call void @llvm.dbg.value(metadata %struct.record* %cond.i, metadata !2949, metadata !DIExpression()), !dbg !2953
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !2954, metadata !DIExpression()), !dbg !2962
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2957, metadata !DIExpression()), !dbg !2964
  call void @llvm.dbg.value(metadata %struct.record* %cond.i, metadata !2958, metadata !DIExpression()), !dbg !2965
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !2966, metadata !DIExpression()), !dbg !2972
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2969, metadata !DIExpression()), !dbg !2974
  call void @llvm.dbg.value(metadata %struct.record* %cond.i, metadata !2970, metadata !DIExpression()), !dbg !2975
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !2976, metadata !DIExpression()), !dbg !2982
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2979, metadata !DIExpression()), !dbg !2984
  call void @llvm.dbg.value(metadata %struct.record* %cond.i, metadata !2980, metadata !DIExpression()), !dbg !2985
  call void @llvm.dbg.value(metadata i8 1, metadata !2981, metadata !DIExpression()), !dbg !2986
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !2987, metadata !DIExpression()) #11, !dbg !2994
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2991, metadata !DIExpression()) #11, !dbg !2996
  call void @llvm.dbg.value(metadata %struct.record* %cond.i, metadata !2992, metadata !DIExpression()) #11, !dbg !2997
  %sub.ptr.rhs.cast.i.i.i.i.i.i.i.i103 = ptrtoint %struct.record* %18 to i64, !dbg !2998
  %sub.ptr.sub.i.i.i.i.i.i.i.i104 = sub i64 %0, %sub.ptr.rhs.cast.i.i.i.i.i.i.i.i103, !dbg !2998
  %sub.ptr.div.i.i.i.i.i.i.i.i105 = sdiv exact i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, 60, !dbg !2998
  call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i.i.i.i.i.i.i.i105, metadata !2993, metadata !DIExpression()) #11, !dbg !2999
  %21 = icmp eq i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, 0, !dbg !3000
  br i1 %21, label %invoke.cont30, label %if.then.i.i.i.i.i.i.i.i106, !dbg !3002

if.then.i.i.i.i.i.i.i.i106:                       ; preds = %invoke.cont
  %22 = getelementptr inbounds %struct.record, %struct.record* %cond.i, i64 0, i32 0, i64 0, !dbg !3003
  %23 = getelementptr inbounds %struct.record, %struct.record* %18, i64 0, i32 0, i64 0, !dbg !3003
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %22, i8* align 4 %23, i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, i1 false) #11, !dbg !3003
  br label %invoke.cont30, !dbg !3003

invoke.cont30:                                    ; preds = %if.then.i.i.i.i.i.i.i.i106, %invoke.cont
  %add.ptr.i.i.i.i.i.i.i.i107 = getelementptr inbounds %struct.record, %struct.record* %cond.i, i64 %sub.ptr.div.i.i.i.i.i.i.i.i105, !dbg !3004
  call void @llvm.dbg.value(metadata %struct.record* %add.ptr.i.i.i.i.i.i.i.i107, metadata !2721, metadata !DIExpression()), !dbg !2896
  %incdec.ptr32 = getelementptr inbounds %struct.record, %struct.record* %add.ptr.i.i.i.i.i.i.i.i107, i64 1, !dbg !3005
  call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, metadata !2721, metadata !DIExpression()), !dbg !2896
  call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, metadata !2712, metadata !DIExpression()), !dbg !2741
  %24 = load i64, i64* %11, align 8, !dbg !3006, !tbaa !2229
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2905, metadata !DIExpression()), !dbg !3007
  call void @llvm.dbg.value(metadata %struct.record** %_M_finish, metadata !2910, metadata !DIExpression(DW_OP_deref)), !dbg !3009
  call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, metadata !2911, metadata !DIExpression()), !dbg !3010
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2921, metadata !DIExpression()), !dbg !3011
  call void @llvm.dbg.value(metadata %struct.record** %_M_finish, metadata !2924, metadata !DIExpression(DW_OP_deref)), !dbg !3013
  call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, metadata !2925, metadata !DIExpression()), !dbg !3014
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2932, metadata !DIExpression()), !dbg !3015
  call void @llvm.dbg.value(metadata %struct.record** %_M_finish, metadata !2935, metadata !DIExpression(DW_OP_deref)), !dbg !3017
  call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, metadata !2936, metadata !DIExpression()), !dbg !3018
  call void @llvm.dbg.value(metadata i8 1, metadata !2937, metadata !DIExpression()), !dbg !3019
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2944, metadata !DIExpression()), !dbg !3020
  call void @llvm.dbg.value(metadata %struct.record** %_M_finish, metadata !2948, metadata !DIExpression(DW_OP_deref)), !dbg !3022
  call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, metadata !2949, metadata !DIExpression()), !dbg !3023
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2954, metadata !DIExpression()), !dbg !3024
  call void @llvm.dbg.value(metadata %struct.record** %_M_finish, metadata !2957, metadata !DIExpression(DW_OP_deref)), !dbg !3026
  call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, metadata !2958, metadata !DIExpression()), !dbg !3027
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2966, metadata !DIExpression()), !dbg !3028
  call void @llvm.dbg.value(metadata %struct.record** %_M_finish, metadata !2969, metadata !DIExpression(DW_OP_deref)), !dbg !3030
  call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, metadata !2970, metadata !DIExpression()), !dbg !3031
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2976, metadata !DIExpression()), !dbg !3032
  call void @llvm.dbg.value(metadata %struct.record** %_M_finish, metadata !2979, metadata !DIExpression(DW_OP_deref)), !dbg !3034
  call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, metadata !2980, metadata !DIExpression()), !dbg !3035
  call void @llvm.dbg.value(metadata i8 1, metadata !2981, metadata !DIExpression()), !dbg !3036
  call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, metadata !2987, metadata !DIExpression()) #11, !dbg !3037
  call void @llvm.dbg.value(metadata %struct.record** %_M_finish, metadata !2991, metadata !DIExpression(DW_OP_deref)) #11, !dbg !3039
  call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, metadata !2992, metadata !DIExpression()) #11, !dbg !3040
  %sub.ptr.sub.i.i.i.i.i.i.i.i = sub i64 %24, %0, !dbg !3041
  %sub.ptr.div.i.i.i.i.i.i.i.i = sdiv exact i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, 60, !dbg !3041
  call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i.i.i.i.i.i.i.i, metadata !2993, metadata !DIExpression()) #11, !dbg !3042
  %25 = icmp eq i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, 0, !dbg !3043
  br i1 %25, label %invoke.cont39, label %if.then.i.i.i.i.i.i.i.i, !dbg !3044

if.then.i.i.i.i.i.i.i.i:                          ; preds = %invoke.cont30
  %26 = getelementptr inbounds %struct.record, %struct.record* %incdec.ptr32, i64 0, i32 0, i64 0, !dbg !3045
  %27 = getelementptr inbounds %struct.record, %struct.record* %__position.coerce, i64 0, i32 0, i64 0, !dbg !3045
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 4 %26, i8* align 4 %27, i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, i1 false) #11, !dbg !3045
  br label %invoke.cont39, !dbg !3045

invoke.cont39:                                    ; preds = %if.then.i.i.i.i.i.i.i.i, %invoke.cont30
  %add.ptr.i.i.i.i.i.i.i.i = getelementptr inbounds %struct.record, %struct.record* %incdec.ptr32, i64 %sub.ptr.div.i.i.i.i.i.i.i.i, !dbg !3046
  call void @llvm.dbg.value(metadata %struct.record* %add.ptr.i.i.i.i.i.i.i.i, metadata !2721, metadata !DIExpression()), !dbg !2896
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !1848, metadata !DIExpression(DW_OP_stack_value)), !dbg !3047
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !1851, metadata !DIExpression()), !dbg !3049
  %tobool.i97 = icmp eq %struct.record* %18, null, !dbg !3050
  br i1 %tobool.i97, label %_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m.exit99, label %if.then.i98, !dbg !3051

if.then.i98:                                      ; preds = %invoke.cont39
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !1859, metadata !DIExpression(DW_OP_stack_value)), !dbg !3052
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !1862, metadata !DIExpression()), !dbg !3054
  call void @llvm.dbg.value(metadata %"class.std::vector"* %this, metadata !1867, metadata !DIExpression(DW_OP_stack_value)) #11, !dbg !3055
  call void @llvm.dbg.value(metadata %struct.record* %18, metadata !1870, metadata !DIExpression()) #11, !dbg !3057
  %28 = getelementptr inbounds %struct.record, %struct.record* %18, i64 0, i32 0, i64 0, !dbg !3058
  tail call void @_ZdlPv(i8* nonnull %28) #11, !dbg !3059
  br label %_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m.exit99, !dbg !3060

_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m.exit99: ; preds = %invoke.cont39, %if.then.i98
  store %struct.record* %cond.i, %struct.record** %15, align 8, !dbg !3061, !tbaa !1704
  store %struct.record* %add.ptr.i.i.i.i.i.i.i.i, %struct.record** %_M_finish, align 8, !dbg !3062, !tbaa !2229
  %add.ptr67 = getelementptr inbounds %struct.record, %struct.record* %cond.i, i64 %cond.i112, !dbg !3063
  store %struct.record* %add.ptr67, %struct.record** %_M_end_of_storage, align 8, !dbg !3064, !tbaa !2231
  br label %if.end70

if.end70:                                         ; preds = %_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m.exit99, %_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit
  ret void, !dbg !3065
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #11

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #11

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #11

; Function Attrs: nounwind
declare i8* @fgets_unlocked(i8*, i32, %struct._IO_FILE* nocapture) local_unnamed_addr #11

; Function Attrs: nounwind
declare i32 @fgetc_unlocked(%struct._IO_FILE* nocapture) local_unnamed_addr #11

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind }
attributes #12 = { cold }
attributes #13 = { noreturn nounwind }
attributes #14 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!1305, !1306, !1307}
!llvm.ident = !{!1308}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 (trunk 333411)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !38, imports: !761)
!1 = !DIFile(filename: "nn_cuda.cu", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!2 = !{!3, !12, !26}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 808, baseType: !5, size: 32, elements: !6, identifier: "_ZTS14cudaMemcpyKind")
!4 = !DIFile(filename: "/usr/local/cuda-8.0/include/driver_types.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11}
!7 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0, isUnsigned: true)
!8 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1, isUnsigned: true)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2, isUnsigned: true)
!10 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!11 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4, isUnsigned: true)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, scope: !14, file: !13, line: 113, baseType: !5, size: 32, elements: !24, identifier: "_ZTSNSt10__are_sameI7latLongS0_EUt_E")
!13 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/cpp_type_traits.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__are_same<latLong, latLong>", scope: !15, file: !13, line: 111, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !17, identifier: "_ZTSSt10__are_sameI7latLongS0_E")
!15 = !DINamespace(name: "std", scope: null)
!16 = !{}
!17 = !{!18, !18}
!18 = !DITemplateTypeParameter(type: !19)
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "latLong", file: !1, line: 35, size: 64, flags: DIFlagTypePassByValue, elements: !20, identifier: "_ZTS7latLong")
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "lat", scope: !19, file: !1, line: 37, baseType: !22, size: 32)
!22 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "lng", scope: !19, file: !1, line: 38, baseType: !22, size: 32, offset: 32)
!24 = !{!25}
!25 = !DIEnumerator(name: "__value", value: 1, isUnsigned: true)
!26 = !DICompositeType(tag: DW_TAG_enumeration_type, scope: !27, file: !13, line: 113, baseType: !5, size: 32, elements: !24, identifier: "_ZTSNSt10__are_sameI6recordS0_EUt_E")
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__are_same<record, record>", scope: !15, file: !13, line: 111, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !28, identifier: "_ZTSSt10__are_sameI6recordS0_E")
!28 = !{!29, !29}
!29 = !DITemplateTypeParameter(type: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "record", file: !1, line: 41, size: 480, flags: DIFlagTypePassByValue, elements: !31, identifier: "_ZTS6record")
!31 = !{!32, !37}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "recString", scope: !30, file: !1, line: 43, baseType: !33, size: 424)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 424, elements: !35)
!34 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!35 = !{!36}
!36 = !DISubrange(count: 53)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "distance", scope: !30, file: !1, line: 44, baseType: !22, size: 32, offset: 448)
!38 = !{!39, !40, !41, !43, !45, !46, !210, !42, !363, !246, !103, !364, !365, !87, !566, !567}
!39 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Tp_alloc_type", scope: !49, file: !48, line: 75, baseType: !204)
!48 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_vector.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_base<record, std::allocator<record> >", scope: !15, file: !48, line: 72, size: 192, flags: DIFlagTypePassByReference, elements: !50, templateParams: !203, identifier: "_ZTSSt12_Vector_baseI6recordSaIS0_EE")
!50 = !{!51, !167, !172, !177, !181, !184, !189, !192, !195, !196, !199, !202}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_M_impl", scope: !49, file: !48, line: 164, baseType: !52, size: 192)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_impl", scope: !49, file: !48, line: 79, size: 192, flags: DIFlagTypePassByReference, elements: !53, identifier: "_ZTSNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implE")
!53 = !{!54, !55, !152, !153, !154, !158, !163}
!54 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !52, baseType: !47, extraData: i32 0)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_M_start", scope: !52, file: !48, line: 82, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !49, file: !48, line: 77, baseType: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !59, file: !58, line: 172, baseType: !151)
!58 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/ext/alloc_traits.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!59 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__alloc_traits<std::allocator<record> >", scope: !60, file: !58, line: 95, size: 8, flags: DIFlagTypePassByValue, elements: !61, templateParams: !149, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI6recordEEE")
!60 = !DINamespace(name: "__gnu_cxx", scope: null)
!61 = !{!62, !134, !137, !140, !143, !146}
!62 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m", scope: !59, file: !58, line: 181, type: !63, isLocal: false, isDefinition: false, scopeLine: 181, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!63 = !DISubroutineType(types: !64)
!64 = !{!57, !65, !132}
!65 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !66, size: 64)
!66 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<record>", scope: !15, file: !67, line: 92, size: 8, flags: DIFlagTypePassByReference, elements: !68, templateParams: !120, identifier: "_ZTSSaI6recordE")
!67 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/allocator.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!68 = !{!69, !122, !126, !131}
!69 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !66, baseType: !70, flags: DIFlagPublic, extraData: i32 0)
!70 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "new_allocator<record>", scope: !60, file: !71, line: 58, size: 8, flags: DIFlagTypePassByReference, elements: !72, templateParams: !120, identifier: "_ZTSN9__gnu_cxx13new_allocatorI6recordEE")
!71 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/ext/new_allocator.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!72 = !{!73, !77, !82, !83, !91, !99, !108, !111, !114, !117}
!73 = !DISubprogram(name: "new_allocator", scope: !70, file: !71, line: 79, type: !74, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!74 = !DISubroutineType(types: !75)
!75 = !{null, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!77 = !DISubprogram(name: "new_allocator", scope: !70, file: !71, line: 81, type: !78, isLocal: false, isDefinition: false, scopeLine: 81, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!78 = !DISubroutineType(types: !79)
!79 = !{null, !76, !80}
!80 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!82 = !DISubprogram(name: "~new_allocator", scope: !70, file: !71, line: 86, type: !74, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!83 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI6recordE7addressERS1_", scope: !70, file: !71, line: 89, type: !84, isLocal: false, isDefinition: false, scopeLine: 89, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !88, !89}
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !70, file: !71, line: 63, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !70, file: !71, line: 65, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !30, size: 64)
!91 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI6recordE7addressERKS1_", scope: !70, file: !71, line: 93, type: !92, isLocal: false, isDefinition: false, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !88, !97}
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !70, file: !71, line: 64, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !70, file: !71, line: 66, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !96, size: 64)
!99 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv", scope: !70, file: !71, line: 99, type: !100, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!100 = !DISubroutineType(types: !101)
!101 = !{!86, !76, !102, !106}
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !71, line: 61, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !15, file: !104, line: 196, baseType: !105)
!104 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!105 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!108 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m", scope: !70, file: !71, line: 109, type: !109, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!109 = !DISubroutineType(types: !110)
!110 = !{null, !76, !86, !102}
!111 = !DISubprogram(name: "max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv", scope: !70, file: !71, line: 113, type: !112, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!112 = !DISubroutineType(types: !113)
!113 = !{!102, !88}
!114 = !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_", scope: !70, file: !71, line: 129, type: !115, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!115 = !DISubroutineType(types: !116)
!116 = !{null, !76, !86, !98}
!117 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE7destroyEPS1_", scope: !70, file: !71, line: 133, type: !118, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!118 = !DISubroutineType(types: !119)
!119 = !{null, !76, !86}
!120 = !{!121}
!121 = !DITemplateTypeParameter(name: "_Tp", type: !30)
!122 = !DISubprogram(name: "allocator", scope: !66, file: !67, line: 113, type: !123, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!123 = !DISubroutineType(types: !124)
!124 = !{null, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!126 = !DISubprogram(name: "allocator", scope: !66, file: !67, line: 115, type: !127, isLocal: false, isDefinition: false, scopeLine: 115, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!127 = !DISubroutineType(types: !128)
!128 = !{null, !125, !129}
!129 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !130, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !66)
!131 = !DISubprogram(name: "~allocator", scope: !66, file: !67, line: 121, type: !123, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!132 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !59, file: !58, line: 177, baseType: !133)
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !66, file: !67, line: 95, baseType: !103)
!134 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m", scope: !59, file: !58, line: 184, type: !135, isLocal: false, isDefinition: false, scopeLine: 184, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!135 = !DISubroutineType(types: !136)
!136 = !{null, !65, !57, !132}
!137 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE7destroyERS2_PS1_", scope: !59, file: !58, line: 191, type: !138, isLocal: false, isDefinition: false, scopeLine: 191, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!138 = !DISubroutineType(types: !139)
!139 = !{null, !65, !57}
!140 = !DISubprogram(name: "max_size", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8max_sizeERKS2_", scope: !59, file: !58, line: 194, type: !141, isLocal: false, isDefinition: false, scopeLine: 194, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!141 = !DISubroutineType(types: !142)
!142 = !{!132, !129}
!143 = !DISubprogram(name: "_S_select_on_copy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE17_S_select_on_copyERKS2_", scope: !59, file: !58, line: 197, type: !144, isLocal: false, isDefinition: false, scopeLine: 197, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!144 = !DISubroutineType(types: !145)
!145 = !{!129, !129}
!146 = !DISubprogram(name: "_S_on_swap", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10_S_on_swapERS2_S4_", scope: !59, file: !58, line: 199, type: !147, isLocal: false, isDefinition: false, scopeLine: 199, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!147 = !DISubroutineType(types: !148)
!148 = !{null, !65, !65}
!149 = !{!150}
!150 = !DITemplateTypeParameter(name: "_Alloc", type: !66)
!151 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !66, file: !67, line: 97, baseType: !87)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "_M_finish", scope: !52, file: !48, line: 83, baseType: !56, size: 64, offset: 64)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "_M_end_of_storage", scope: !52, file: !48, line: 84, baseType: !56, size: 64, offset: 128)
!154 = !DISubprogram(name: "_Vector_impl", scope: !52, file: !48, line: 86, type: !155, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: true)
!155 = !DISubroutineType(types: !156)
!156 = !{null, !157}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!158 = !DISubprogram(name: "_Vector_impl", scope: !52, file: !48, line: 90, type: !159, isLocal: false, isDefinition: false, scopeLine: 90, flags: DIFlagPrototyped, isOptimized: true)
!159 = !DISubroutineType(types: !160)
!160 = !{null, !157, !161}
!161 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !162, size: 64)
!162 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !47)
!163 = !DISubprogram(name: "_M_swap_data", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_impl12_M_swap_dataERS3_", scope: !52, file: !48, line: 101, type: !164, isLocal: false, isDefinition: false, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: true)
!164 = !DISubroutineType(types: !165)
!165 = !{null, !157, !166}
!166 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !52, size: 64)
!167 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv", scope: !49, file: !48, line: 113, type: !168, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPrototyped, isOptimized: true)
!168 = !DISubroutineType(types: !169)
!169 = !{!170, !171}
!170 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !47, size: 64)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!172 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNKSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv", scope: !49, file: !48, line: 117, type: !173, isLocal: false, isDefinition: false, scopeLine: 117, flags: DIFlagPrototyped, isOptimized: true)
!173 = !DISubroutineType(types: !174)
!174 = !{!161, !175}
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!176 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !49)
!177 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt12_Vector_baseI6recordSaIS0_EE13get_allocatorEv", scope: !49, file: !48, line: 121, type: !178, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPrototyped, isOptimized: true)
!178 = !DISubroutineType(types: !179)
!179 = !{!180, !175}
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !49, file: !48, line: 110, baseType: !66)
!181 = !DISubprogram(name: "_Vector_base", scope: !49, file: !48, line: 124, type: !182, isLocal: false, isDefinition: false, scopeLine: 124, flags: DIFlagPrototyped, isOptimized: true)
!182 = !DISubroutineType(types: !183)
!183 = !{null, !171}
!184 = !DISubprogram(name: "_Vector_base", scope: !49, file: !48, line: 127, type: !185, isLocal: false, isDefinition: false, scopeLine: 127, flags: DIFlagPrototyped, isOptimized: true)
!185 = !DISubroutineType(types: !186)
!186 = !{null, !171, !187}
!187 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !188, size: 64)
!188 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !180)
!189 = !DISubprogram(name: "_Vector_base", scope: !49, file: !48, line: 130, type: !190, isLocal: false, isDefinition: false, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: true)
!190 = !DISubroutineType(types: !191)
!191 = !{null, !171, !103}
!192 = !DISubprogram(name: "_Vector_base", scope: !49, file: !48, line: 134, type: !193, isLocal: false, isDefinition: false, scopeLine: 134, flags: DIFlagPrototyped, isOptimized: true)
!193 = !DISubroutineType(types: !194)
!194 = !{null, !171, !103, !187}
!195 = !DISubprogram(name: "~_Vector_base", scope: !49, file: !48, line: 159, type: !182, isLocal: false, isDefinition: false, scopeLine: 159, flags: DIFlagPrototyped, isOptimized: true)
!196 = !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm", scope: !49, file: !48, line: 167, type: !197, isLocal: false, isDefinition: false, scopeLine: 167, flags: DIFlagPrototyped, isOptimized: true)
!197 = !DISubroutineType(types: !198)
!198 = !{!56, !171, !103}
!199 = !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m", scope: !49, file: !48, line: 174, type: !200, isLocal: false, isDefinition: false, scopeLine: 174, flags: DIFlagPrototyped, isOptimized: true)
!200 = !DISubroutineType(types: !201)
!201 = !{null, !171, !56, !103}
!202 = !DISubprogram(name: "_M_create_storage", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE17_M_create_storageEm", scope: !49, file: !48, line: 183, type: !190, isLocal: false, isDefinition: false, scopeLine: 183, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: true)
!203 = !{!121, !150}
!204 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !205, file: !58, line: 208, baseType: !206)
!205 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<record>", scope: !59, file: !58, line: 207, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !120, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI6recordEE6rebindIS1_EE")
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !207, file: !67, line: 105, baseType: !66)
!207 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<record>", scope: !66, file: !67, line: 104, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !208, identifier: "_ZTSNSaI6recordE6rebindIS_EE")
!208 = !{!209}
!209 = !DITemplateTypeParameter(name: "_Tp1", type: !30)
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Tp_alloc_type", scope: !212, file: !48, line: 75, baseType: !357)
!212 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_base<latLong, std::allocator<latLong> >", scope: !15, file: !48, line: 72, size: 192, flags: DIFlagTypePassByReference, elements: !213, templateParams: !356, identifier: "_ZTSSt12_Vector_baseI7latLongSaIS0_EE")
!213 = !{!214, !320, !325, !330, !334, !337, !342, !345, !348, !349, !352, !355}
!214 = !DIDerivedType(tag: DW_TAG_member, name: "_M_impl", scope: !212, file: !48, line: 164, baseType: !215, size: 192)
!215 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_impl", scope: !212, file: !48, line: 79, size: 192, flags: DIFlagTypePassByReference, elements: !216, identifier: "_ZTSNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implE")
!216 = !{!217, !218, !305, !306, !307, !311, !316}
!217 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !215, baseType: !211, extraData: i32 0)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "_M_start", scope: !215, file: !48, line: 82, baseType: !219, size: 64)
!219 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !212, file: !48, line: 77, baseType: !220)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !221, file: !58, line: 172, baseType: !304)
!221 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__alloc_traits<std::allocator<latLong> >", scope: !60, file: !58, line: 95, size: 8, flags: DIFlagTypePassByValue, elements: !222, templateParams: !302, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI7latLongEEE")
!222 = !{!223, !287, !290, !293, !296, !299}
!223 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m", scope: !221, file: !58, line: 181, type: !224, isLocal: false, isDefinition: false, scopeLine: 181, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!224 = !DISubroutineType(types: !225)
!225 = !{!220, !226, !285}
!226 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !227, size: 64)
!227 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<latLong>", scope: !15, file: !67, line: 92, size: 8, flags: DIFlagTypePassByReference, elements: !228, templateParams: !273, identifier: "_ZTSSaI7latLongE")
!228 = !{!229, !275, !279, !284}
!229 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !227, baseType: !230, flags: DIFlagPublic, extraData: i32 0)
!230 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "new_allocator<latLong>", scope: !60, file: !71, line: 58, size: 8, flags: DIFlagTypePassByReference, elements: !231, templateParams: !273, identifier: "_ZTSN9__gnu_cxx13new_allocatorI7latLongEE")
!231 = !{!232, !236, !241, !242, !250, !258, !261, !264, !267, !270}
!232 = !DISubprogram(name: "new_allocator", scope: !230, file: !71, line: 79, type: !233, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!233 = !DISubroutineType(types: !234)
!234 = !{null, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!236 = !DISubprogram(name: "new_allocator", scope: !230, file: !71, line: 81, type: !237, isLocal: false, isDefinition: false, scopeLine: 81, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!237 = !DISubroutineType(types: !238)
!238 = !{null, !235, !239}
!239 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !240, size: 64)
!240 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !230)
!241 = !DISubprogram(name: "~new_allocator", scope: !230, file: !71, line: 86, type: !233, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!242 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI7latLongE7addressERS1_", scope: !230, file: !71, line: 89, type: !243, isLocal: false, isDefinition: false, scopeLine: 89, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!243 = !DISubroutineType(types: !244)
!244 = !{!245, !247, !248}
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !230, file: !71, line: 63, baseType: !246)
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!248 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !230, file: !71, line: 65, baseType: !249)
!249 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !19, size: 64)
!250 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI7latLongE7addressERKS1_", scope: !230, file: !71, line: 93, type: !251, isLocal: false, isDefinition: false, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!251 = !DISubroutineType(types: !252)
!252 = !{!253, !247, !256}
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !230, file: !71, line: 64, baseType: !254)
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !255, size: 64)
!255 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!256 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !230, file: !71, line: 66, baseType: !257)
!257 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !255, size: 64)
!258 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv", scope: !230, file: !71, line: 99, type: !259, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!259 = !DISubroutineType(types: !260)
!260 = !{!245, !235, !102, !106}
!261 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m", scope: !230, file: !71, line: 109, type: !262, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!262 = !DISubroutineType(types: !263)
!263 = !{null, !235, !245, !102}
!264 = !DISubprogram(name: "max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv", scope: !230, file: !71, line: 113, type: !265, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!265 = !DISubroutineType(types: !266)
!266 = !{!102, !247}
!267 = !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_", scope: !230, file: !71, line: 129, type: !268, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!268 = !DISubroutineType(types: !269)
!269 = !{null, !235, !245, !257}
!270 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE7destroyEPS1_", scope: !230, file: !71, line: 133, type: !271, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!271 = !DISubroutineType(types: !272)
!272 = !{null, !235, !245}
!273 = !{!274}
!274 = !DITemplateTypeParameter(name: "_Tp", type: !19)
!275 = !DISubprogram(name: "allocator", scope: !227, file: !67, line: 113, type: !276, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!276 = !DISubroutineType(types: !277)
!277 = !{null, !278}
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !227, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!279 = !DISubprogram(name: "allocator", scope: !227, file: !67, line: 115, type: !280, isLocal: false, isDefinition: false, scopeLine: 115, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!280 = !DISubroutineType(types: !281)
!281 = !{null, !278, !282}
!282 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !283, size: 64)
!283 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !227)
!284 = !DISubprogram(name: "~allocator", scope: !227, file: !67, line: 121, type: !276, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!285 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !221, file: !58, line: 177, baseType: !286)
!286 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !227, file: !67, line: 95, baseType: !103)
!287 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m", scope: !221, file: !58, line: 184, type: !288, isLocal: false, isDefinition: false, scopeLine: 184, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!288 = !DISubroutineType(types: !289)
!289 = !{null, !226, !220, !285}
!290 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE7destroyERS2_PS1_", scope: !221, file: !58, line: 191, type: !291, isLocal: false, isDefinition: false, scopeLine: 191, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!291 = !DISubroutineType(types: !292)
!292 = !{null, !226, !220}
!293 = !DISubprogram(name: "max_size", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8max_sizeERKS2_", scope: !221, file: !58, line: 194, type: !294, isLocal: false, isDefinition: false, scopeLine: 194, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!294 = !DISubroutineType(types: !295)
!295 = !{!285, !282}
!296 = !DISubprogram(name: "_S_select_on_copy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE17_S_select_on_copyERKS2_", scope: !221, file: !58, line: 197, type: !297, isLocal: false, isDefinition: false, scopeLine: 197, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!297 = !DISubroutineType(types: !298)
!298 = !{!282, !282}
!299 = !DISubprogram(name: "_S_on_swap", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10_S_on_swapERS2_S4_", scope: !221, file: !58, line: 199, type: !300, isLocal: false, isDefinition: false, scopeLine: 199, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true)
!300 = !DISubroutineType(types: !301)
!301 = !{null, !226, !226}
!302 = !{!303}
!303 = !DITemplateTypeParameter(name: "_Alloc", type: !227)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !227, file: !67, line: 97, baseType: !246)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "_M_finish", scope: !215, file: !48, line: 83, baseType: !219, size: 64, offset: 64)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "_M_end_of_storage", scope: !215, file: !48, line: 84, baseType: !219, size: 64, offset: 128)
!307 = !DISubprogram(name: "_Vector_impl", scope: !215, file: !48, line: 86, type: !308, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: true)
!308 = !DISubroutineType(types: !309)
!309 = !{null, !310}
!310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!311 = !DISubprogram(name: "_Vector_impl", scope: !215, file: !48, line: 90, type: !312, isLocal: false, isDefinition: false, scopeLine: 90, flags: DIFlagPrototyped, isOptimized: true)
!312 = !DISubroutineType(types: !313)
!313 = !{null, !310, !314}
!314 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !315, size: 64)
!315 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !211)
!316 = !DISubprogram(name: "_M_swap_data", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_impl12_M_swap_dataERS3_", scope: !215, file: !48, line: 101, type: !317, isLocal: false, isDefinition: false, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: true)
!317 = !DISubroutineType(types: !318)
!318 = !{null, !310, !319}
!319 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !215, size: 64)
!320 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv", scope: !212, file: !48, line: 113, type: !321, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPrototyped, isOptimized: true)
!321 = !DISubroutineType(types: !322)
!322 = !{!323, !324}
!323 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !211, size: 64)
!324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!325 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNKSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv", scope: !212, file: !48, line: 117, type: !326, isLocal: false, isDefinition: false, scopeLine: 117, flags: DIFlagPrototyped, isOptimized: true)
!326 = !DISubroutineType(types: !327)
!327 = !{!314, !328}
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !329, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!329 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !212)
!330 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt12_Vector_baseI7latLongSaIS0_EE13get_allocatorEv", scope: !212, file: !48, line: 121, type: !331, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPrototyped, isOptimized: true)
!331 = !DISubroutineType(types: !332)
!332 = !{!333, !328}
!333 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !212, file: !48, line: 110, baseType: !227)
!334 = !DISubprogram(name: "_Vector_base", scope: !212, file: !48, line: 124, type: !335, isLocal: false, isDefinition: false, scopeLine: 124, flags: DIFlagPrototyped, isOptimized: true)
!335 = !DISubroutineType(types: !336)
!336 = !{null, !324}
!337 = !DISubprogram(name: "_Vector_base", scope: !212, file: !48, line: 127, type: !338, isLocal: false, isDefinition: false, scopeLine: 127, flags: DIFlagPrototyped, isOptimized: true)
!338 = !DISubroutineType(types: !339)
!339 = !{null, !324, !340}
!340 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !341, size: 64)
!341 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !333)
!342 = !DISubprogram(name: "_Vector_base", scope: !212, file: !48, line: 130, type: !343, isLocal: false, isDefinition: false, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: true)
!343 = !DISubroutineType(types: !344)
!344 = !{null, !324, !103}
!345 = !DISubprogram(name: "_Vector_base", scope: !212, file: !48, line: 134, type: !346, isLocal: false, isDefinition: false, scopeLine: 134, flags: DIFlagPrototyped, isOptimized: true)
!346 = !DISubroutineType(types: !347)
!347 = !{null, !324, !103, !340}
!348 = !DISubprogram(name: "~_Vector_base", scope: !212, file: !48, line: 159, type: !335, isLocal: false, isDefinition: false, scopeLine: 159, flags: DIFlagPrototyped, isOptimized: true)
!349 = !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm", scope: !212, file: !48, line: 167, type: !350, isLocal: false, isDefinition: false, scopeLine: 167, flags: DIFlagPrototyped, isOptimized: true)
!350 = !DISubroutineType(types: !351)
!351 = !{!219, !324, !103}
!352 = !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m", scope: !212, file: !48, line: 174, type: !353, isLocal: false, isDefinition: false, scopeLine: 174, flags: DIFlagPrototyped, isOptimized: true)
!353 = !DISubroutineType(types: !354)
!354 = !{null, !324, !219, !103}
!355 = !DISubprogram(name: "_M_create_storage", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE17_M_create_storageEm", scope: !212, file: !48, line: 183, type: !343, isLocal: false, isDefinition: false, scopeLine: 183, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: true)
!356 = !{!274, !303}
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !358, file: !58, line: 208, baseType: !359)
!358 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<latLong>", scope: !221, file: !58, line: 207, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !273, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI7latLongEE6rebindIS1_EE")
!359 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !360, file: !67, line: 105, baseType: !227)
!360 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<latLong>", scope: !227, file: !67, line: 104, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !361, identifier: "_ZTSNSaI7latLongE6rebindIS_EE")
!361 = !{!362}
!362 = !DITemplateTypeParameter(name: "_Tp1", type: !19)
!363 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !48, line: 236, baseType: !103)
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !366, file: !48, line: 231, baseType: !509)
!366 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<latLong, std::allocator<latLong> >", scope: !15, file: !48, line: 214, size: 192, flags: DIFlagTypePassByReference, elements: !367, templateParams: !356, identifier: "_ZTSSt6vectorI7latLongSaIS0_EE")
!367 = !{!368, !369, !373, !379, !385, !390, !391, !395, !398, !401, !408, !409, !410, !415, !420, !421, !422, !425, !426, !429, !430, !434, !437, !443, !449, !452, !453, !454, !457, !460, !461, !462, !466, !472, !475, !476, !479, !482, !485, !488, !491, !492, !493, !494, !495, !498, !504, !507, !508}
!368 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !366, baseType: !212, flags: DIFlagProtected, extraData: i32 0)
!369 = !DISubprogram(name: "vector", scope: !366, file: !48, line: 253, type: !370, isLocal: false, isDefinition: false, scopeLine: 253, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!370 = !DISubroutineType(types: !371)
!371 = !{null, !372}
!372 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !366, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!373 = !DISubprogram(name: "vector", scope: !366, file: !48, line: 264, type: !374, isLocal: false, isDefinition: false, scopeLine: 264, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!374 = !DISubroutineType(types: !375)
!375 = !{null, !372, !376}
!376 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !377, size: 64)
!377 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !378)
!378 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !366, file: !48, line: 238, baseType: !227)
!379 = !DISubprogram(name: "vector", scope: !366, file: !48, line: 303, type: !380, isLocal: false, isDefinition: false, scopeLine: 303, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!380 = !DISubroutineType(types: !381)
!381 = !{null, !372, !363, !382, !376}
!382 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !383, size: 64)
!383 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !384)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !366, file: !48, line: 226, baseType: !19)
!385 = !DISubprogram(name: "vector", scope: !366, file: !48, line: 318, type: !386, isLocal: false, isDefinition: false, scopeLine: 318, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!386 = !DISubroutineType(types: !387)
!387 = !{null, !372, !388}
!388 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !389, size: 64)
!389 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !366)
!390 = !DISubprogram(name: "~vector", scope: !366, file: !48, line: 423, type: !370, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!391 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEaSERKS2_", scope: !366, file: !48, line: 436, type: !392, isLocal: false, isDefinition: false, scopeLine: 436, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!392 = !DISubroutineType(types: !393)
!393 = !{!394, !372, !388}
!394 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !366, size: 64)
!395 = !DISubprogram(name: "assign", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6assignEmRKS0_", scope: !366, file: !48, line: 488, type: !396, isLocal: false, isDefinition: false, scopeLine: 488, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!396 = !DISubroutineType(types: !397)
!397 = !{null, !372, !363, !382}
!398 = !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5beginEv", scope: !366, file: !48, line: 547, type: !399, isLocal: false, isDefinition: false, scopeLine: 547, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!399 = !DISubroutineType(types: !400)
!400 = !{!365, !372}
!401 = !DISubprogram(name: "begin", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE5beginEv", scope: !366, file: !48, line: 556, type: !402, isLocal: false, isDefinition: false, scopeLine: 556, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!402 = !DISubroutineType(types: !403)
!403 = !{!404, !407}
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !366, file: !48, line: 233, baseType: !405)
!405 = !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<const latLong *, std::vector<latLong, std::allocator<latLong> > >", scope: !60, file: !406, line: 721, flags: DIFlagFwdDecl, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIPK7latLongSt6vectorIS1_SaIS1_EEEE")
!406 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_iterator.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!407 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !389, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!408 = !DISubprogram(name: "end", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE3endEv", scope: !366, file: !48, line: 565, type: !399, isLocal: false, isDefinition: false, scopeLine: 565, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!409 = !DISubprogram(name: "end", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE3endEv", scope: !366, file: !48, line: 574, type: !402, isLocal: false, isDefinition: false, scopeLine: 574, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!410 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6rbeginEv", scope: !366, file: !48, line: 583, type: !411, isLocal: false, isDefinition: false, scopeLine: 583, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!411 = !DISubroutineType(types: !412)
!412 = !{!413, !372}
!413 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !366, file: !48, line: 235, baseType: !414)
!414 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<latLong *, std::vector<latLong, std::allocator<latLong> > > >", scope: !15, file: !406, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS2_SaIS2_EEEEE")
!415 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE6rbeginEv", scope: !366, file: !48, line: 592, type: !416, isLocal: false, isDefinition: false, scopeLine: 592, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!416 = !DISubroutineType(types: !417)
!417 = !{!418, !407}
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !366, file: !48, line: 234, baseType: !419)
!419 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<const latLong *, std::vector<latLong, std::allocator<latLong> > > >", scope: !15, file: !406, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPK7latLongSt6vectorIS2_SaIS2_EEEEE")
!420 = !DISubprogram(name: "rend", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4rendEv", scope: !366, file: !48, line: 601, type: !411, isLocal: false, isDefinition: false, scopeLine: 601, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!421 = !DISubprogram(name: "rend", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4rendEv", scope: !366, file: !48, line: 610, type: !416, isLocal: false, isDefinition: false, scopeLine: 610, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!422 = !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv", scope: !366, file: !48, line: 654, type: !423, isLocal: false, isDefinition: false, scopeLine: 654, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!423 = !DISubroutineType(types: !424)
!424 = !{!363, !407}
!425 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv", scope: !366, file: !48, line: 659, type: !423, isLocal: false, isDefinition: false, scopeLine: 659, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!426 = !DISubprogram(name: "resize", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6resizeEmS0_", scope: !366, file: !48, line: 713, type: !427, isLocal: false, isDefinition: false, scopeLine: 713, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!427 = !DISubroutineType(types: !428)
!428 = !{null, !372, !363, !384}
!429 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE8capacityEv", scope: !366, file: !48, line: 734, type: !423, isLocal: false, isDefinition: false, scopeLine: 734, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!430 = !DISubprogram(name: "empty", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE5emptyEv", scope: !366, file: !48, line: 743, type: !431, isLocal: false, isDefinition: false, scopeLine: 743, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!431 = !DISubroutineType(types: !432)
!432 = !{!433, !407}
!433 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!434 = !DISubprogram(name: "reserve", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE7reserveEm", scope: !366, file: !48, line: 764, type: !435, isLocal: false, isDefinition: false, scopeLine: 764, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!435 = !DISubroutineType(types: !436)
!436 = !{null, !372, !363}
!437 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEixEm", scope: !366, file: !48, line: 779, type: !438, isLocal: false, isDefinition: false, scopeLine: 779, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!438 = !DISubroutineType(types: !439)
!439 = !{!440, !372, !363}
!440 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !366, file: !48, line: 229, baseType: !441)
!441 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !221, file: !58, line: 175, baseType: !442)
!442 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !227, file: !67, line: 99, baseType: !249)
!443 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EEixEm", scope: !366, file: !48, line: 794, type: !444, isLocal: false, isDefinition: false, scopeLine: 794, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!444 = !DISubroutineType(types: !445)
!445 = !{!446, !407, !363}
!446 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !366, file: !48, line: 230, baseType: !447)
!447 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !221, file: !58, line: 176, baseType: !448)
!448 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !227, file: !67, line: 100, baseType: !257)
!449 = !DISubprogram(name: "_M_range_check", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE14_M_range_checkEm", scope: !366, file: !48, line: 800, type: !450, isLocal: false, isDefinition: false, scopeLine: 800, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!450 = !DISubroutineType(types: !451)
!451 = !{null, !407, !363}
!452 = !DISubprogram(name: "at", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE2atEm", scope: !366, file: !48, line: 822, type: !438, isLocal: false, isDefinition: false, scopeLine: 822, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!453 = !DISubprogram(name: "at", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE2atEm", scope: !366, file: !48, line: 840, type: !444, isLocal: false, isDefinition: false, scopeLine: 840, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!454 = !DISubprogram(name: "front", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5frontEv", scope: !366, file: !48, line: 851, type: !455, isLocal: false, isDefinition: false, scopeLine: 851, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!455 = !DISubroutineType(types: !456)
!456 = !{!440, !372}
!457 = !DISubprogram(name: "front", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE5frontEv", scope: !366, file: !48, line: 859, type: !458, isLocal: false, isDefinition: false, scopeLine: 859, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!458 = !DISubroutineType(types: !459)
!459 = !{!446, !407}
!460 = !DISubprogram(name: "back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4backEv", scope: !366, file: !48, line: 867, type: !455, isLocal: false, isDefinition: false, scopeLine: 867, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!461 = !DISubprogram(name: "back", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4backEv", scope: !366, file: !48, line: 875, type: !458, isLocal: false, isDefinition: false, scopeLine: 875, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!462 = !DISubprogram(name: "data", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4dataEv", scope: !366, file: !48, line: 890, type: !463, isLocal: false, isDefinition: false, scopeLine: 890, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!463 = !DISubroutineType(types: !464)
!464 = !{!465, !372}
!465 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !366, file: !48, line: 227, baseType: !219)
!466 = !DISubprogram(name: "data", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4dataEv", scope: !366, file: !48, line: 898, type: !467, isLocal: false, isDefinition: false, scopeLine: 898, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!467 = !DISubroutineType(types: !468)
!468 = !{!469, !407}
!469 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !366, file: !48, line: 228, baseType: !470)
!470 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !221, file: !58, line: 173, baseType: !471)
!471 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !227, file: !67, line: 98, baseType: !254)
!472 = !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_", scope: !366, file: !48, line: 913, type: !473, isLocal: false, isDefinition: false, scopeLine: 913, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!473 = !DISubroutineType(types: !474)
!474 = !{null, !372, !382}
!475 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE8pop_backEv", scope: !366, file: !48, line: 949, type: !370, isLocal: false, isDefinition: false, scopeLine: 949, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!476 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !366, file: !48, line: 998, type: !477, isLocal: false, isDefinition: false, scopeLine: 998, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!477 = !DISubroutineType(types: !478)
!478 = !{!365, !372, !365, !382}
!479 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !366, file: !48, line: 1072, type: !480, isLocal: false, isDefinition: false, scopeLine: 1072, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!480 = !DISubroutineType(types: !481)
!481 = !{null, !372, !365, !363, !382}
!482 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EE", scope: !366, file: !48, line: 1149, type: !483, isLocal: false, isDefinition: false, scopeLine: 1149, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!483 = !DISubroutineType(types: !484)
!484 = !{!365, !372, !365}
!485 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EES6_", scope: !366, file: !48, line: 1180, type: !486, isLocal: false, isDefinition: false, scopeLine: 1180, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!486 = !DISubroutineType(types: !487)
!487 = !{!365, !372, !365, !365}
!488 = !DISubprogram(name: "swap", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4swapERS2_", scope: !366, file: !48, line: 1194, type: !489, isLocal: false, isDefinition: false, scopeLine: 1194, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!489 = !DISubroutineType(types: !490)
!490 = !{null, !372, !394}
!491 = !DISubprogram(name: "clear", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5clearEv", scope: !366, file: !48, line: 1211, type: !370, isLocal: false, isDefinition: false, scopeLine: 1211, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!492 = !DISubprogram(name: "_M_fill_initialize", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE18_M_fill_initializeEmRKS0_", scope: !366, file: !48, line: 1298, type: !396, isLocal: false, isDefinition: false, scopeLine: 1298, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!493 = !DISubprogram(name: "_M_fill_assign", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE14_M_fill_assignEmRKS0_", scope: !366, file: !48, line: 1354, type: !396, isLocal: false, isDefinition: false, scopeLine: 1354, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!494 = !DISubprogram(name: "_M_fill_insert", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !366, file: !48, line: 1395, type: !480, isLocal: false, isDefinition: false, scopeLine: 1395, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!495 = !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !366, file: !48, line: 1409, type: !496, isLocal: false, isDefinition: false, scopeLine: 1409, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!496 = !DISubroutineType(types: !497)
!497 = !{null, !372, !365, !382}
!498 = !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc", scope: !366, file: !48, line: 1422, type: !499, isLocal: false, isDefinition: false, scopeLine: 1422, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!499 = !DISubroutineType(types: !500)
!500 = !{!501, !407, !363, !502}
!501 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !366, file: !48, line: 236, baseType: !103)
!502 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !503, size: 64)
!503 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!504 = !DISubprogram(name: "_M_erase_at_end", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE15_M_erase_at_endEPS0_", scope: !366, file: !48, line: 1436, type: !505, isLocal: false, isDefinition: false, scopeLine: 1436, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!505 = !DISubroutineType(types: !506)
!506 = !{null, !372, !465}
!507 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE8_M_eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EE", scope: !366, file: !48, line: 1443, type: !483, isLocal: false, isDefinition: false, scopeLine: 1443, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!508 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE8_M_eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EES6_", scope: !366, file: !48, line: 1446, type: !486, isLocal: false, isDefinition: false, scopeLine: 1446, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!509 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<latLong *, std::vector<latLong, std::allocator<latLong> > >", scope: !60, file: !406, line: 721, size: 64, flags: DIFlagTypePassByValue, elements: !510, templateParams: !564, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEE")
!510 = !{!511, !512, !516, !521, !532, !537, !541, !544, !545, !546, !553, !556, !559, !560, !561}
!511 = !DIDerivedType(tag: DW_TAG_member, name: "_M_current", scope: !509, file: !406, line: 724, baseType: !246, size: 64, flags: DIFlagProtected)
!512 = !DISubprogram(name: "__normal_iterator", scope: !509, file: !406, line: 736, type: !513, isLocal: false, isDefinition: false, scopeLine: 736, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!513 = !DISubroutineType(types: !514)
!514 = !{null, !515}
!515 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !509, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!516 = !DISubprogram(name: "__normal_iterator", scope: !509, file: !406, line: 740, type: !517, isLocal: false, isDefinition: false, scopeLine: 740, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!517 = !DISubroutineType(types: !518)
!518 = !{null, !515, !519}
!519 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !520, size: 64)
!520 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !246)
!521 = !DISubprogram(name: "operator*", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEdeEv", scope: !509, file: !406, line: 753, type: !522, isLocal: false, isDefinition: false, scopeLine: 753, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!522 = !DISubroutineType(types: !523)
!523 = !{!524, !530}
!524 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !509, file: !406, line: 733, baseType: !525)
!525 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !527, file: !526, line: 184, baseType: !249)
!526 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_iterator_base_types.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!527 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iterator_traits<latLong *>", scope: !15, file: !526, line: 178, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !528, identifier: "_ZTSSt15iterator_traitsIP7latLongE")
!528 = !{!529}
!529 = !DITemplateTypeParameter(name: "_Iterator", type: !246)
!530 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !531, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!531 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !509)
!532 = !DISubprogram(name: "operator->", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEptEv", scope: !509, file: !406, line: 757, type: !533, isLocal: false, isDefinition: false, scopeLine: 757, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!533 = !DISubroutineType(types: !534)
!534 = !{!535, !530}
!535 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !509, file: !406, line: 734, baseType: !536)
!536 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !527, file: !526, line: 183, baseType: !246)
!537 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEppEv", scope: !509, file: !406, line: 761, type: !538, isLocal: false, isDefinition: false, scopeLine: 761, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!538 = !DISubroutineType(types: !539)
!539 = !{!540, !515}
!540 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !509, size: 64)
!541 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEppEi", scope: !509, file: !406, line: 768, type: !542, isLocal: false, isDefinition: false, scopeLine: 768, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!542 = !DISubroutineType(types: !543)
!543 = !{!509, !515, !45}
!544 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmmEv", scope: !509, file: !406, line: 773, type: !538, isLocal: false, isDefinition: false, scopeLine: 773, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!545 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmmEi", scope: !509, file: !406, line: 780, type: !542, isLocal: false, isDefinition: false, scopeLine: 780, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!546 = !DISubprogram(name: "operator[]", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEixEl", scope: !509, file: !406, line: 785, type: !547, isLocal: false, isDefinition: false, scopeLine: 785, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!547 = !DISubroutineType(types: !548)
!548 = !{!524, !530, !549}
!549 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !509, file: !406, line: 732, baseType: !550)
!550 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !527, file: !526, line: 182, baseType: !551)
!551 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !15, file: !104, line: 197, baseType: !552)
!552 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!553 = !DISubprogram(name: "operator+=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEpLEl", scope: !509, file: !406, line: 789, type: !554, isLocal: false, isDefinition: false, scopeLine: 789, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!554 = !DISubroutineType(types: !555)
!555 = !{!540, !515, !549}
!556 = !DISubprogram(name: "operator+", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEplEl", scope: !509, file: !406, line: 793, type: !557, isLocal: false, isDefinition: false, scopeLine: 793, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!557 = !DISubroutineType(types: !558)
!558 = !{!509, !530, !549}
!559 = !DISubprogram(name: "operator-=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmIEl", scope: !509, file: !406, line: 797, type: !554, isLocal: false, isDefinition: false, scopeLine: 797, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!560 = !DISubprogram(name: "operator-", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmiEl", scope: !509, file: !406, line: 801, type: !557, isLocal: false, isDefinition: false, scopeLine: 801, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!561 = !DISubprogram(name: "base", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv", scope: !509, file: !406, line: 805, type: !562, isLocal: false, isDefinition: false, scopeLine: 805, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!562 = !DISubroutineType(types: !563)
!563 = !{!519, !530}
!564 = !{!529, !565}
!565 = !DITemplateTypeParameter(name: "_Container", type: !366)
!566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!567 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !568, file: !48, line: 231, baseType: !707)
!568 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<record, std::allocator<record> >", scope: !15, file: !48, line: 214, size: 192, flags: DIFlagTypePassByReference, elements: !569, templateParams: !203, identifier: "_ZTSSt6vectorI6recordSaIS0_EE")
!569 = !{!570, !571, !575, !581, !587, !592, !593, !597, !600, !603, !609, !610, !611, !616, !621, !622, !623, !626, !627, !630, !631, !634, !637, !643, !649, !652, !653, !654, !657, !660, !661, !662, !666, !672, !675, !676, !679, !682, !685, !688, !691, !692, !693, !694, !695, !698, !702, !705, !706}
!570 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !568, baseType: !49, flags: DIFlagProtected, extraData: i32 0)
!571 = !DISubprogram(name: "vector", scope: !568, file: !48, line: 253, type: !572, isLocal: false, isDefinition: false, scopeLine: 253, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!572 = !DISubroutineType(types: !573)
!573 = !{null, !574}
!574 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !568, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!575 = !DISubprogram(name: "vector", scope: !568, file: !48, line: 264, type: !576, isLocal: false, isDefinition: false, scopeLine: 264, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!576 = !DISubroutineType(types: !577)
!577 = !{null, !574, !578}
!578 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !579, size: 64)
!579 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !580)
!580 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !568, file: !48, line: 238, baseType: !66)
!581 = !DISubprogram(name: "vector", scope: !568, file: !48, line: 303, type: !582, isLocal: false, isDefinition: false, scopeLine: 303, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!582 = !DISubroutineType(types: !583)
!583 = !{null, !574, !363, !584, !578}
!584 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !585, size: 64)
!585 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !586)
!586 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !568, file: !48, line: 226, baseType: !30)
!587 = !DISubprogram(name: "vector", scope: !568, file: !48, line: 318, type: !588, isLocal: false, isDefinition: false, scopeLine: 318, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!588 = !DISubroutineType(types: !589)
!589 = !{null, !574, !590}
!590 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !591, size: 64)
!591 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !568)
!592 = !DISubprogram(name: "~vector", scope: !568, file: !48, line: 423, type: !572, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!593 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6vectorI6recordSaIS0_EEaSERKS2_", scope: !568, file: !48, line: 436, type: !594, isLocal: false, isDefinition: false, scopeLine: 436, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!594 = !DISubroutineType(types: !595)
!595 = !{!596, !574, !590}
!596 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !568, size: 64)
!597 = !DISubprogram(name: "assign", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6assignEmRKS0_", scope: !568, file: !48, line: 488, type: !598, isLocal: false, isDefinition: false, scopeLine: 488, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!598 = !DISubroutineType(types: !599)
!599 = !{null, !574, !363, !584}
!600 = !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5beginEv", scope: !568, file: !48, line: 547, type: !601, isLocal: false, isDefinition: false, scopeLine: 547, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!601 = !DISubroutineType(types: !602)
!602 = !{!567, !574}
!603 = !DISubprogram(name: "begin", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE5beginEv", scope: !568, file: !48, line: 556, type: !604, isLocal: false, isDefinition: false, scopeLine: 556, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!604 = !DISubroutineType(types: !605)
!605 = !{!606, !608}
!606 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !568, file: !48, line: 233, baseType: !607)
!607 = !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<const record *, std::vector<record, std::allocator<record> > >", scope: !60, file: !406, line: 721, flags: DIFlagFwdDecl, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIPK6recordSt6vectorIS1_SaIS1_EEEE")
!608 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !591, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!609 = !DISubprogram(name: "end", linkageName: "_ZNSt6vectorI6recordSaIS0_EE3endEv", scope: !568, file: !48, line: 565, type: !601, isLocal: false, isDefinition: false, scopeLine: 565, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!610 = !DISubprogram(name: "end", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE3endEv", scope: !568, file: !48, line: 574, type: !604, isLocal: false, isDefinition: false, scopeLine: 574, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!611 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6rbeginEv", scope: !568, file: !48, line: 583, type: !612, isLocal: false, isDefinition: false, scopeLine: 583, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!612 = !DISubroutineType(types: !613)
!613 = !{!614, !574}
!614 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !568, file: !48, line: 235, baseType: !615)
!615 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<record *, std::vector<record, std::allocator<record> > > >", scope: !15, file: !406, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS2_SaIS2_EEEEE")
!616 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE6rbeginEv", scope: !568, file: !48, line: 592, type: !617, isLocal: false, isDefinition: false, scopeLine: 592, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!617 = !DISubroutineType(types: !618)
!618 = !{!619, !608}
!619 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !568, file: !48, line: 234, baseType: !620)
!620 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<const record *, std::vector<record, std::allocator<record> > > >", scope: !15, file: !406, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPK6recordSt6vectorIS2_SaIS2_EEEEE")
!621 = !DISubprogram(name: "rend", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4rendEv", scope: !568, file: !48, line: 601, type: !612, isLocal: false, isDefinition: false, scopeLine: 601, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!622 = !DISubprogram(name: "rend", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4rendEv", scope: !568, file: !48, line: 610, type: !617, isLocal: false, isDefinition: false, scopeLine: 610, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!623 = !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4sizeEv", scope: !568, file: !48, line: 654, type: !624, isLocal: false, isDefinition: false, scopeLine: 654, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!624 = !DISubroutineType(types: !625)
!625 = !{!363, !608}
!626 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv", scope: !568, file: !48, line: 659, type: !624, isLocal: false, isDefinition: false, scopeLine: 659, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!627 = !DISubprogram(name: "resize", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6resizeEmS0_", scope: !568, file: !48, line: 713, type: !628, isLocal: false, isDefinition: false, scopeLine: 713, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!628 = !DISubroutineType(types: !629)
!629 = !{null, !574, !363, !586}
!630 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE8capacityEv", scope: !568, file: !48, line: 734, type: !624, isLocal: false, isDefinition: false, scopeLine: 734, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!631 = !DISubprogram(name: "empty", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE5emptyEv", scope: !568, file: !48, line: 743, type: !632, isLocal: false, isDefinition: false, scopeLine: 743, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!632 = !DISubroutineType(types: !633)
!633 = !{!433, !608}
!634 = !DISubprogram(name: "reserve", linkageName: "_ZNSt6vectorI6recordSaIS0_EE7reserveEm", scope: !568, file: !48, line: 764, type: !635, isLocal: false, isDefinition: false, scopeLine: 764, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!635 = !DISubroutineType(types: !636)
!636 = !{null, !574, !363}
!637 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI6recordSaIS0_EEixEm", scope: !568, file: !48, line: 779, type: !638, isLocal: false, isDefinition: false, scopeLine: 779, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!638 = !DISubroutineType(types: !639)
!639 = !{!640, !574, !363}
!640 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !568, file: !48, line: 229, baseType: !641)
!641 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !59, file: !58, line: 175, baseType: !642)
!642 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !66, file: !67, line: 99, baseType: !90)
!643 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt6vectorI6recordSaIS0_EEixEm", scope: !568, file: !48, line: 794, type: !644, isLocal: false, isDefinition: false, scopeLine: 794, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!644 = !DISubroutineType(types: !645)
!645 = !{!646, !608, !363}
!646 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !568, file: !48, line: 230, baseType: !647)
!647 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !59, file: !58, line: 176, baseType: !648)
!648 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !66, file: !67, line: 100, baseType: !98)
!649 = !DISubprogram(name: "_M_range_check", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE14_M_range_checkEm", scope: !568, file: !48, line: 800, type: !650, isLocal: false, isDefinition: false, scopeLine: 800, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!650 = !DISubroutineType(types: !651)
!651 = !{null, !608, !363}
!652 = !DISubprogram(name: "at", linkageName: "_ZNSt6vectorI6recordSaIS0_EE2atEm", scope: !568, file: !48, line: 822, type: !638, isLocal: false, isDefinition: false, scopeLine: 822, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!653 = !DISubprogram(name: "at", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE2atEm", scope: !568, file: !48, line: 840, type: !644, isLocal: false, isDefinition: false, scopeLine: 840, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!654 = !DISubprogram(name: "front", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5frontEv", scope: !568, file: !48, line: 851, type: !655, isLocal: false, isDefinition: false, scopeLine: 851, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!655 = !DISubroutineType(types: !656)
!656 = !{!640, !574}
!657 = !DISubprogram(name: "front", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE5frontEv", scope: !568, file: !48, line: 859, type: !658, isLocal: false, isDefinition: false, scopeLine: 859, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!658 = !DISubroutineType(types: !659)
!659 = !{!646, !608}
!660 = !DISubprogram(name: "back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4backEv", scope: !568, file: !48, line: 867, type: !655, isLocal: false, isDefinition: false, scopeLine: 867, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!661 = !DISubprogram(name: "back", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4backEv", scope: !568, file: !48, line: 875, type: !658, isLocal: false, isDefinition: false, scopeLine: 875, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!662 = !DISubprogram(name: "data", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4dataEv", scope: !568, file: !48, line: 890, type: !663, isLocal: false, isDefinition: false, scopeLine: 890, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!663 = !DISubroutineType(types: !664)
!664 = !{!665, !574}
!665 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !568, file: !48, line: 227, baseType: !56)
!666 = !DISubprogram(name: "data", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4dataEv", scope: !568, file: !48, line: 898, type: !667, isLocal: false, isDefinition: false, scopeLine: 898, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!667 = !DISubroutineType(types: !668)
!668 = !{!669, !608}
!669 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !568, file: !48, line: 228, baseType: !670)
!670 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !59, file: !58, line: 173, baseType: !671)
!671 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !66, file: !67, line: 98, baseType: !95)
!672 = !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_", scope: !568, file: !48, line: 913, type: !673, isLocal: false, isDefinition: false, scopeLine: 913, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!673 = !DISubroutineType(types: !674)
!674 = !{null, !574, !584}
!675 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE8pop_backEv", scope: !568, file: !48, line: 949, type: !572, isLocal: false, isDefinition: false, scopeLine: 949, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!676 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !568, file: !48, line: 998, type: !677, isLocal: false, isDefinition: false, scopeLine: 998, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!677 = !DISubroutineType(types: !678)
!678 = !{!567, !574, !567, !584}
!679 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !568, file: !48, line: 1072, type: !680, isLocal: false, isDefinition: false, scopeLine: 1072, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!680 = !DISubroutineType(types: !681)
!681 = !{null, !574, !567, !363, !584}
!682 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EE", scope: !568, file: !48, line: 1149, type: !683, isLocal: false, isDefinition: false, scopeLine: 1149, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!683 = !DISubroutineType(types: !684)
!684 = !{!567, !574, !567}
!685 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EES6_", scope: !568, file: !48, line: 1180, type: !686, isLocal: false, isDefinition: false, scopeLine: 1180, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!686 = !DISubroutineType(types: !687)
!687 = !{!567, !574, !567, !567}
!688 = !DISubprogram(name: "swap", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4swapERS2_", scope: !568, file: !48, line: 1194, type: !689, isLocal: false, isDefinition: false, scopeLine: 1194, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!689 = !DISubroutineType(types: !690)
!690 = !{null, !574, !596}
!691 = !DISubprogram(name: "clear", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5clearEv", scope: !568, file: !48, line: 1211, type: !572, isLocal: false, isDefinition: false, scopeLine: 1211, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!692 = !DISubprogram(name: "_M_fill_initialize", linkageName: "_ZNSt6vectorI6recordSaIS0_EE18_M_fill_initializeEmRKS0_", scope: !568, file: !48, line: 1298, type: !598, isLocal: false, isDefinition: false, scopeLine: 1298, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!693 = !DISubprogram(name: "_M_fill_assign", linkageName: "_ZNSt6vectorI6recordSaIS0_EE14_M_fill_assignEmRKS0_", scope: !568, file: !48, line: 1354, type: !598, isLocal: false, isDefinition: false, scopeLine: 1354, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!694 = !DISubprogram(name: "_M_fill_insert", linkageName: "_ZNSt6vectorI6recordSaIS0_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !568, file: !48, line: 1395, type: !680, isLocal: false, isDefinition: false, scopeLine: 1395, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!695 = !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !568, file: !48, line: 1409, type: !696, isLocal: false, isDefinition: false, scopeLine: 1409, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!696 = !DISubroutineType(types: !697)
!697 = !{null, !574, !567, !584}
!698 = !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc", scope: !568, file: !48, line: 1422, type: !699, isLocal: false, isDefinition: false, scopeLine: 1422, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!699 = !DISubroutineType(types: !700)
!700 = !{!701, !608, !363, !502}
!701 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !568, file: !48, line: 236, baseType: !103)
!702 = !DISubprogram(name: "_M_erase_at_end", linkageName: "_ZNSt6vectorI6recordSaIS0_EE15_M_erase_at_endEPS0_", scope: !568, file: !48, line: 1436, type: !703, isLocal: false, isDefinition: false, scopeLine: 1436, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!703 = !DISubroutineType(types: !704)
!704 = !{null, !574, !665}
!705 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt6vectorI6recordSaIS0_EE8_M_eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EE", scope: !568, file: !48, line: 1443, type: !683, isLocal: false, isDefinition: false, scopeLine: 1443, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!706 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt6vectorI6recordSaIS0_EE8_M_eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EES6_", scope: !568, file: !48, line: 1446, type: !686, isLocal: false, isDefinition: false, scopeLine: 1446, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!707 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<record *, std::vector<record, std::allocator<record> > >", scope: !60, file: !406, line: 721, size: 64, flags: DIFlagTypePassByValue, elements: !708, templateParams: !759, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEE")
!708 = !{!709, !710, !714, !719, !729, !734, !738, !741, !742, !743, !748, !751, !754, !755, !756}
!709 = !DIDerivedType(tag: DW_TAG_member, name: "_M_current", scope: !707, file: !406, line: 724, baseType: !87, size: 64, flags: DIFlagProtected)
!710 = !DISubprogram(name: "__normal_iterator", scope: !707, file: !406, line: 736, type: !711, isLocal: false, isDefinition: false, scopeLine: 736, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!711 = !DISubroutineType(types: !712)
!712 = !{null, !713}
!713 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !707, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!714 = !DISubprogram(name: "__normal_iterator", scope: !707, file: !406, line: 740, type: !715, isLocal: false, isDefinition: false, scopeLine: 740, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!715 = !DISubroutineType(types: !716)
!716 = !{null, !713, !717}
!717 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !718, size: 64)
!718 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !87)
!719 = !DISubprogram(name: "operator*", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEdeEv", scope: !707, file: !406, line: 753, type: !720, isLocal: false, isDefinition: false, scopeLine: 753, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!720 = !DISubroutineType(types: !721)
!721 = !{!722, !727}
!722 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !707, file: !406, line: 733, baseType: !723)
!723 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !724, file: !526, line: 184, baseType: !90)
!724 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iterator_traits<record *>", scope: !15, file: !526, line: 178, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !725, identifier: "_ZTSSt15iterator_traitsIP6recordE")
!725 = !{!726}
!726 = !DITemplateTypeParameter(name: "_Iterator", type: !87)
!727 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !728, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!728 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !707)
!729 = !DISubprogram(name: "operator->", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEptEv", scope: !707, file: !406, line: 757, type: !730, isLocal: false, isDefinition: false, scopeLine: 757, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!730 = !DISubroutineType(types: !731)
!731 = !{!732, !727}
!732 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !707, file: !406, line: 734, baseType: !733)
!733 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !724, file: !526, line: 183, baseType: !87)
!734 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEppEv", scope: !707, file: !406, line: 761, type: !735, isLocal: false, isDefinition: false, scopeLine: 761, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!735 = !DISubroutineType(types: !736)
!736 = !{!737, !713}
!737 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !707, size: 64)
!738 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEppEi", scope: !707, file: !406, line: 768, type: !739, isLocal: false, isDefinition: false, scopeLine: 768, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!739 = !DISubroutineType(types: !740)
!740 = !{!707, !713, !45}
!741 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmmEv", scope: !707, file: !406, line: 773, type: !735, isLocal: false, isDefinition: false, scopeLine: 773, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!742 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmmEi", scope: !707, file: !406, line: 780, type: !739, isLocal: false, isDefinition: false, scopeLine: 780, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!743 = !DISubprogram(name: "operator[]", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEixEl", scope: !707, file: !406, line: 785, type: !744, isLocal: false, isDefinition: false, scopeLine: 785, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!744 = !DISubroutineType(types: !745)
!745 = !{!722, !727, !746}
!746 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !707, file: !406, line: 732, baseType: !747)
!747 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !724, file: !526, line: 182, baseType: !551)
!748 = !DISubprogram(name: "operator+=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEpLEl", scope: !707, file: !406, line: 789, type: !749, isLocal: false, isDefinition: false, scopeLine: 789, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!749 = !DISubroutineType(types: !750)
!750 = !{!737, !713, !746}
!751 = !DISubprogram(name: "operator+", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEplEl", scope: !707, file: !406, line: 793, type: !752, isLocal: false, isDefinition: false, scopeLine: 793, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!752 = !DISubroutineType(types: !753)
!753 = !{!707, !727, !746}
!754 = !DISubprogram(name: "operator-=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmIEl", scope: !707, file: !406, line: 797, type: !749, isLocal: false, isDefinition: false, scopeLine: 797, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!755 = !DISubprogram(name: "operator-", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmiEl", scope: !707, file: !406, line: 801, type: !752, isLocal: false, isDefinition: false, scopeLine: 801, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!756 = !DISubprogram(name: "base", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv", scope: !707, file: !406, line: 805, type: !757, isLocal: false, isDefinition: false, scopeLine: 805, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!757 = !DISubroutineType(types: !758)
!758 = !{!717, !727}
!759 = !{!726, !760}
!760 = !DITemplateTypeParameter(name: "_Container", type: !568)
!761 = !{!762, !768, !772, !774, !776, !778, !780, !784, !786, !788, !790, !792, !794, !796, !798, !800, !802, !804, !806, !808, !810, !812, !816, !818, !820, !822, !826, !831, !833, !835, !839, !843, !845, !847, !849, !851, !853, !855, !857, !859, !863, !867, !869, !871, !875, !877, !879, !881, !883, !885, !889, !891, !893, !897, !901, !905, !907, !909, !911, !913, !917, !919, !921, !925, !927, !929, !931, !933, !935, !937, !939, !941, !943, !949, !951, !953, !957, !959, !961, !963, !965, !967, !969, !971, !975, !979, !981, !983, !988, !990, !992, !994, !996, !998, !1000, !1005, !1011, !1015, !1019, !1024, !1029, !1035, !1039, !1050, !1054, !1058, !1062, !1066, !1070, !1072, !1076, !1080, !1084, !1092, !1096, !1100, !1104, !1108, !1112, !1117, !1121, !1125, !1127, !1135, !1139, !1145, !1147, !1149, !1153, !1157, !1161, !1166, !1170, !1175, !1176, !1177, !1178, !1180, !1181, !1182, !1183, !1184, !1185, !1186, !1190, !1192, !1194, !1196, !1198, !1200, !1202, !1204, !1207, !1209, !1211, !1213, !1215, !1217, !1219, !1221, !1223, !1225, !1227, !1229, !1231, !1233, !1235, !1237, !1239, !1241, !1243, !1245, !1247, !1249, !1251, !1253, !1255, !1257, !1259, !1261, !1263, !1265, !1267, !1269, !1271, !1273, !1275, !1277, !1279, !1281, !1283, !1285, !1287, !1289, !1291, !1293, !1295, !1297, !1299, !1303, !1304}
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !763, file: !764, line: 202)
!763 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !764, file: !764, line: 44, type: !765, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!764 = !DIFile(filename: "/usr/local/lib/clang/7.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!765 = !DISubroutineType(types: !766)
!766 = !{!767, !767}
!767 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !769, file: !764, line: 203)
!769 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !764, file: !764, line: 46, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!770 = !DISubroutineType(types: !771)
!771 = !{!22, !22}
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !773, file: !764, line: 204)
!773 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !764, file: !764, line: 48, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !775, file: !764, line: 205)
!775 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !764, file: !764, line: 50, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !777, file: !764, line: 206)
!777 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !764, file: !764, line: 52, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !779, file: !764, line: 207)
!779 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !764, file: !764, line: 56, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !781, file: !764, line: 208)
!781 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !764, file: !764, line: 54, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!782 = !DISubroutineType(types: !783)
!783 = !{!22, !22, !22}
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !785, file: !764, line: 209)
!785 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !764, file: !764, line: 58, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !787, file: !764, line: 210)
!787 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !764, file: !764, line: 60, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !789, file: !764, line: 211)
!789 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !764, file: !764, line: 62, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !791, file: !764, line: 212)
!791 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !764, file: !764, line: 64, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !793, file: !764, line: 213)
!793 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !764, file: !764, line: 66, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !795, file: !764, line: 214)
!795 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !764, file: !764, line: 68, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !797, file: !764, line: 215)
!797 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !764, file: !764, line: 72, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !799, file: !764, line: 216)
!799 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !764, file: !764, line: 70, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !801, file: !764, line: 217)
!801 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !764, file: !764, line: 76, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !803, file: !764, line: 218)
!803 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !764, file: !764, line: 74, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !805, file: !764, line: 219)
!805 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !764, file: !764, line: 78, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !807, file: !764, line: 220)
!807 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !764, file: !764, line: 80, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !809, file: !764, line: 221)
!809 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !764, file: !764, line: 82, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !811, file: !764, line: 222)
!811 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !764, file: !764, line: 84, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !813, file: !764, line: 223)
!813 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !764, file: !764, line: 86, type: !814, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!814 = !DISubroutineType(types: !815)
!815 = !{!22, !22, !22, !22}
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !817, file: !764, line: 224)
!817 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !764, file: !764, line: 88, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !819, file: !764, line: 225)
!819 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !764, file: !764, line: 90, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !821, file: !764, line: 226)
!821 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !764, file: !764, line: 92, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !823, file: !764, line: 227)
!823 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !764, file: !764, line: 94, type: !824, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!824 = !DISubroutineType(types: !825)
!825 = !{!45, !22}
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !827, file: !764, line: 228)
!827 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !764, file: !764, line: 96, type: !828, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!828 = !DISubroutineType(types: !829)
!829 = !{!22, !22, !830}
!830 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!831 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !832, file: !764, line: 229)
!832 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !764, file: !764, line: 98, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !834, file: !764, line: 230)
!834 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !764, file: !764, line: 100, type: !824, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !836, file: !764, line: 231)
!836 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !764, file: !764, line: 102, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!837 = !DISubroutineType(types: !838)
!838 = !{!433, !22}
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !840, file: !764, line: 232)
!840 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !764, file: !764, line: 106, type: !841, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!841 = !DISubroutineType(types: !842)
!842 = !{!433, !22, !22}
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !844, file: !764, line: 233)
!844 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !764, file: !764, line: 105, type: !841, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !846, file: !764, line: 234)
!846 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !764, file: !764, line: 108, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !848, file: !764, line: 235)
!848 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !764, file: !764, line: 112, type: !841, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !850, file: !764, line: 236)
!850 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !764, file: !764, line: 111, type: !841, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !852, file: !764, line: 237)
!852 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !764, file: !764, line: 114, type: !841, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !854, file: !764, line: 238)
!854 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !764, file: !764, line: 116, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !856, file: !764, line: 239)
!856 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !764, file: !764, line: 118, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !858, file: !764, line: 240)
!858 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !764, file: !764, line: 120, type: !841, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !860, file: !764, line: 241)
!860 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !764, file: !764, line: 121, type: !861, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!861 = !DISubroutineType(types: !862)
!862 = !{!552, !552}
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !864, file: !764, line: 242)
!864 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !764, file: !764, line: 123, type: !865, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!865 = !DISubroutineType(types: !866)
!866 = !{!22, !22, !45}
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !868, file: !764, line: 243)
!868 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !764, file: !764, line: 125, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !870, file: !764, line: 244)
!870 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !764, file: !764, line: 126, type: !765, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !872, file: !764, line: 245)
!872 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !764, file: !764, line: 128, type: !873, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!873 = !DISubroutineType(types: !874)
!874 = !{!767, !22}
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !876, file: !764, line: 246)
!876 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !764, file: !764, line: 138, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !878, file: !764, line: 247)
!878 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !764, file: !764, line: 130, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !880, file: !764, line: 248)
!880 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !764, file: !764, line: 132, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !882, file: !764, line: 249)
!882 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !764, file: !764, line: 134, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !884, file: !764, line: 250)
!884 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !764, file: !764, line: 136, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !886, file: !764, line: 251)
!886 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !764, file: !764, line: 140, type: !887, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!887 = !DISubroutineType(types: !888)
!888 = !{!552, !22}
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !890, file: !764, line: 252)
!890 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !764, file: !764, line: 142, type: !887, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !892, file: !764, line: 253)
!892 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !764, file: !764, line: 143, type: !873, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !894, file: !764, line: 254)
!894 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !764, file: !764, line: 145, type: !895, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!895 = !DISubroutineType(types: !896)
!896 = !{!22, !22, !40}
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !898, file: !764, line: 255)
!898 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !764, file: !764, line: 146, type: !899, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!899 = !DISubroutineType(types: !900)
!900 = !{!39, !502}
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !902, file: !764, line: 256)
!902 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !764, file: !764, line: 147, type: !903, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!903 = !DISubroutineType(types: !904)
!904 = !{!22, !502}
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !906, file: !764, line: 257)
!906 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !764, file: !764, line: 149, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !908, file: !764, line: 258)
!908 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !764, file: !764, line: 151, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !910, file: !764, line: 259)
!910 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !764, file: !764, line: 155, type: !865, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !912, file: !764, line: 260)
!912 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !764, file: !764, line: 157, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !914, file: !764, line: 261)
!914 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !764, file: !764, line: 159, type: !915, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!915 = !DISubroutineType(types: !916)
!916 = !{!22, !22, !22, !830}
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !918, file: !764, line: 262)
!918 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !764, file: !764, line: 161, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !920, file: !764, line: 263)
!920 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !764, file: !764, line: 163, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !922, file: !764, line: 264)
!922 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !764, file: !764, line: 165, type: !923, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!923 = !DISubroutineType(types: !924)
!924 = !{!22, !22, !552}
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !926, file: !764, line: 265)
!926 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !764, file: !764, line: 167, type: !865, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !928, file: !764, line: 266)
!928 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !764, file: !764, line: 169, type: !837, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !930, file: !764, line: 267)
!930 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !764, file: !764, line: 171, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !932, file: !764, line: 268)
!932 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !764, file: !764, line: 173, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !934, file: !764, line: 269)
!934 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !764, file: !764, line: 175, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !936, file: !764, line: 270)
!936 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !764, file: !764, line: 177, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !938, file: !764, line: 271)
!938 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !764, file: !764, line: 179, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !940, file: !764, line: 272)
!940 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !764, file: !764, line: 181, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !942, file: !764, line: 273)
!942 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !764, file: !764, line: 183, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !944, file: !948, line: 102)
!944 = !DISubprogram(name: "acos", scope: !945, file: !945, line: 54, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!945 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!946 = !DISubroutineType(types: !947)
!947 = !{!39, !39}
!948 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cmath", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !950, file: !948, line: 121)
!950 = !DISubprogram(name: "asin", scope: !945, file: !945, line: 56, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !952, file: !948, line: 140)
!952 = !DISubprogram(name: "atan", scope: !945, file: !945, line: 58, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !954, file: !948, line: 159)
!954 = !DISubprogram(name: "atan2", scope: !945, file: !945, line: 60, type: !955, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!955 = !DISubroutineType(types: !956)
!956 = !{!39, !39, !39}
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !958, file: !948, line: 180)
!958 = !DISubprogram(name: "ceil", scope: !945, file: !945, line: 178, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !960, file: !948, line: 199)
!960 = !DISubprogram(name: "cos", scope: !945, file: !945, line: 63, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !962, file: !948, line: 218)
!962 = !DISubprogram(name: "cosh", scope: !945, file: !945, line: 72, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !964, file: !948, line: 237)
!964 = !DISubprogram(name: "exp", scope: !945, file: !945, line: 100, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !966, file: !948, line: 256)
!966 = !DISubprogram(name: "fabs", scope: !945, file: !945, line: 181, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !968, file: !948, line: 275)
!968 = !DISubprogram(name: "floor", scope: !945, file: !945, line: 184, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !970, file: !948, line: 294)
!970 = !DISubprogram(name: "fmod", scope: !945, file: !945, line: 187, type: !955, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !972, file: !948, line: 315)
!972 = !DISubprogram(name: "frexp", scope: !945, file: !945, line: 103, type: !973, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!973 = !DISubroutineType(types: !974)
!974 = !{!39, !39, !830}
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !976, file: !948, line: 334)
!976 = !DISubprogram(name: "ldexp", scope: !945, file: !945, line: 106, type: !977, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!977 = !DISubroutineType(types: !978)
!978 = !{!39, !39, !45}
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !980, file: !948, line: 353)
!980 = !DISubprogram(name: "log", scope: !945, file: !945, line: 109, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !982, file: !948, line: 372)
!982 = !DISubprogram(name: "log10", scope: !945, file: !945, line: 112, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !984, file: !948, line: 391)
!984 = !DISubprogram(name: "modf", scope: !945, file: !945, line: 115, type: !985, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!985 = !DISubroutineType(types: !986)
!986 = !{!39, !39, !987}
!987 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!988 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !989, file: !948, line: 403)
!989 = !DISubprogram(name: "pow", scope: !945, file: !945, line: 153, type: !955, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !991, file: !948, line: 440)
!991 = !DISubprogram(name: "sin", scope: !945, file: !945, line: 65, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !993, file: !948, line: 459)
!993 = !DISubprogram(name: "sinh", scope: !945, file: !945, line: 74, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !995, file: !948, line: 478)
!995 = !DISubprogram(name: "sqrt", scope: !945, file: !945, line: 156, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !997, file: !948, line: 497)
!997 = !DISubprogram(name: "tan", scope: !945, file: !945, line: 67, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !999, file: !948, line: 516)
!999 = !DISubprogram(name: "tanh", scope: !945, file: !945, line: 76, type: !946, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1001, file: !1004, line: 118)
!1001 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1002, line: 101, baseType: !1003)
!1002 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1003 = !DICompositeType(tag: DW_TAG_structure_type, file: !1002, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!1004 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1006, file: !1004, line: 119)
!1006 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1002, line: 109, baseType: !1007)
!1007 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1002, line: 105, size: 128, flags: DIFlagTypePassByValue, elements: !1008, identifier: "_ZTS6ldiv_t")
!1008 = !{!1009, !1010}
!1009 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1007, file: !1002, line: 107, baseType: !552, size: 64)
!1010 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1007, file: !1002, line: 108, baseType: !552, size: 64, offset: 64)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1012, file: !1004, line: 121)
!1012 = !DISubprogram(name: "abort", scope: !1002, file: !1002, line: 515, type: !1013, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!1013 = !DISubroutineType(types: !1014)
!1014 = !{null}
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1016, file: !1004, line: 122)
!1016 = !DISubprogram(name: "abs", scope: !1002, file: !1002, line: 774, type: !1017, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!45, !45}
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1020, file: !1004, line: 123)
!1020 = !DISubprogram(name: "atexit", scope: !1002, file: !1002, line: 519, type: !1021, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!45, !1023}
!1023 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1013, size: 64)
!1024 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1025, file: !1004, line: 129)
!1025 = distinct !DISubprogram(name: "atof", scope: !1026, file: !1026, line: 26, type: !899, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !1027)
!1026 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1027 = !{!1028}
!1028 = !DILocalVariable(name: "__nptr", arg: 1, scope: !1025, file: !1026, line: 26, type: !502)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1030, file: !1004, line: 130)
!1030 = distinct !DISubprogram(name: "atoi", scope: !1002, file: !1002, line: 278, type: !1031, isLocal: false, isDefinition: true, scopeLine: 279, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !1033)
!1031 = !DISubroutineType(types: !1032)
!1032 = !{!45, !502}
!1033 = !{!1034}
!1034 = !DILocalVariable(name: "__nptr", arg: 1, scope: !1030, file: !1002, line: 278, type: !502)
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1036, file: !1004, line: 131)
!1036 = !DISubprogram(name: "atol", scope: !1002, file: !1002, line: 283, type: !1037, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1037 = !DISubroutineType(types: !1038)
!1038 = !{!552, !502}
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1040, file: !1004, line: 132)
!1040 = !DISubprogram(name: "bsearch", scope: !1041, file: !1041, line: 20, type: !1042, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1041 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!42, !106, !106, !1044, !1044, !1046}
!1044 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1045, line: 62, baseType: !105)
!1045 = !DIFile(filename: "/usr/local/lib/clang/7.0.0/include/stddef.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1046 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !1002, line: 741, baseType: !1047)
!1047 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1048, size: 64)
!1048 = !DISubroutineType(types: !1049)
!1049 = !{!45, !106, !106}
!1050 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1051, file: !1004, line: 133)
!1051 = !DISubprogram(name: "calloc", scope: !1002, file: !1002, line: 468, type: !1052, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1052 = !DISubroutineType(types: !1053)
!1053 = !{!42, !1044, !1044}
!1054 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1055, file: !1004, line: 134)
!1055 = !DISubprogram(name: "div", scope: !1002, file: !1002, line: 788, type: !1056, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1056 = !DISubroutineType(types: !1057)
!1057 = !{!1001, !45, !45}
!1058 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1059, file: !1004, line: 135)
!1059 = !DISubprogram(name: "exit", scope: !1002, file: !1002, line: 543, type: !1060, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!1060 = !DISubroutineType(types: !1061)
!1061 = !{null, !45}
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1063, file: !1004, line: 136)
!1063 = !DISubprogram(name: "free", scope: !1002, file: !1002, line: 483, type: !1064, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1064 = !DISubroutineType(types: !1065)
!1065 = !{null, !42}
!1066 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1067, file: !1004, line: 137)
!1067 = !DISubprogram(name: "getenv", scope: !1002, file: !1002, line: 564, type: !1068, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1068 = !DISubroutineType(types: !1069)
!1069 = !{!44, !502}
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1071, file: !1004, line: 138)
!1071 = !DISubprogram(name: "labs", scope: !1002, file: !1002, line: 775, type: !861, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1072 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1073, file: !1004, line: 139)
!1073 = !DISubprogram(name: "ldiv", scope: !1002, file: !1002, line: 790, type: !1074, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1074 = !DISubroutineType(types: !1075)
!1075 = !{!1006, !552, !552}
!1076 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1077, file: !1004, line: 140)
!1077 = !DISubprogram(name: "malloc", scope: !1002, file: !1002, line: 466, type: !1078, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1078 = !DISubroutineType(types: !1079)
!1079 = !{!42, !1044}
!1080 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1081, file: !1004, line: 142)
!1081 = !DISubprogram(name: "mblen", scope: !1002, file: !1002, line: 862, type: !1082, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1082 = !DISubroutineType(types: !1083)
!1083 = !{!45, !502, !1044}
!1084 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1085, file: !1004, line: 143)
!1085 = !DISubprogram(name: "mbstowcs", scope: !1002, file: !1002, line: 873, type: !1086, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1086 = !DISubroutineType(types: !1087)
!1087 = !{!1044, !1088, !1091, !1044}
!1088 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1089)
!1089 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1090, size: 64)
!1090 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!1091 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !502)
!1092 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1093, file: !1004, line: 144)
!1093 = !DISubprogram(name: "mbtowc", scope: !1002, file: !1002, line: 865, type: !1094, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1094 = !DISubroutineType(types: !1095)
!1095 = !{!45, !1088, !1091, !1044}
!1096 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1097, file: !1004, line: 146)
!1097 = !DISubprogram(name: "qsort", scope: !1002, file: !1002, line: 764, type: !1098, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1098 = !DISubroutineType(types: !1099)
!1099 = !{null, !42, !1044, !1044, !1046}
!1100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1101, file: !1004, line: 152)
!1101 = !DISubprogram(name: "rand", scope: !1002, file: !1002, line: 374, type: !1102, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1102 = !DISubroutineType(types: !1103)
!1103 = !{!45}
!1104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1105, file: !1004, line: 153)
!1105 = !DISubprogram(name: "realloc", scope: !1002, file: !1002, line: 480, type: !1106, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1106 = !DISubroutineType(types: !1107)
!1107 = !{!42, !42, !1044}
!1108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1109, file: !1004, line: 154)
!1109 = !DISubprogram(name: "srand", scope: !1002, file: !1002, line: 376, type: !1110, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1110 = !DISubroutineType(types: !1111)
!1111 = !{null, !5}
!1112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1113, file: !1004, line: 155)
!1113 = !DISubprogram(name: "strtod", scope: !1002, file: !1002, line: 164, type: !1114, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1114 = !DISubroutineType(types: !1115)
!1115 = !{!39, !1091, !1116}
!1116 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !43)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1118, file: !1004, line: 156)
!1118 = !DISubprogram(name: "strtol", scope: !1002, file: !1002, line: 183, type: !1119, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1119 = !DISubroutineType(types: !1120)
!1120 = !{!552, !1091, !1116, !45}
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1122, file: !1004, line: 157)
!1122 = !DISubprogram(name: "strtoul", scope: !1002, file: !1002, line: 187, type: !1123, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{!105, !1091, !1116, !45}
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1126, file: !1004, line: 158)
!1126 = !DISubprogram(name: "system", scope: !1002, file: !1002, line: 716, type: !1031, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1128, file: !1004, line: 160)
!1128 = !DISubprogram(name: "wcstombs", scope: !1002, file: !1002, line: 876, type: !1129, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!1044, !1131, !1132, !1044}
!1131 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !44)
!1132 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1133)
!1133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1134, size: 64)
!1134 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1090)
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1136, file: !1004, line: 161)
!1136 = !DISubprogram(name: "wctomb", scope: !1002, file: !1002, line: 869, type: !1137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{!45, !44, !1090}
!1139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1140, file: !1004, line: 214)
!1140 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1002, line: 121, baseType: !1141)
!1141 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1002, line: 117, size: 128, flags: DIFlagTypePassByValue, elements: !1142, identifier: "_ZTS7lldiv_t")
!1142 = !{!1143, !1144}
!1143 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1141, file: !1002, line: 119, baseType: !767, size: 64)
!1144 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1141, file: !1002, line: 120, baseType: !767, size: 64, offset: 64)
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1146, file: !1004, line: 220)
!1146 = !DISubprogram(name: "_Exit", scope: !1002, file: !1002, line: 557, type: !1060, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1148, file: !1004, line: 224)
!1148 = !DISubprogram(name: "llabs", scope: !1002, file: !1002, line: 779, type: !765, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1150, file: !1004, line: 230)
!1150 = !DISubprogram(name: "lldiv", scope: !1002, file: !1002, line: 796, type: !1151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1151 = !DISubroutineType(types: !1152)
!1152 = !{!1140, !767, !767}
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1154, file: !1004, line: 241)
!1154 = !DISubprogram(name: "atoll", scope: !1002, file: !1002, line: 292, type: !1155, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{!767, !502}
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1158, file: !1004, line: 242)
!1158 = !DISubprogram(name: "strtoll", scope: !1002, file: !1002, line: 209, type: !1159, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1159 = !DISubroutineType(types: !1160)
!1160 = !{!767, !1091, !1116, !45}
!1161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1162, file: !1004, line: 243)
!1162 = !DISubprogram(name: "strtoull", scope: !1002, file: !1002, line: 214, type: !1163, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1163 = !DISubroutineType(types: !1164)
!1164 = !{!1165, !1091, !1116, !45}
!1165 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1167, file: !1004, line: 245)
!1167 = !DISubprogram(name: "strtof", scope: !1002, file: !1002, line: 172, type: !1168, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1168 = !DISubroutineType(types: !1169)
!1169 = !{!22, !1091, !1116}
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1171, file: !1004, line: 246)
!1171 = !DISubprogram(name: "strtold", scope: !1002, file: !1002, line: 175, type: !1172, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1172 = !DISubroutineType(types: !1173)
!1173 = !{!1174, !1091, !1116}
!1174 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1140, file: !1004, line: 254)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1146, file: !1004, line: 256)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1148, file: !1004, line: 258)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1179, file: !1004, line: 259)
!1179 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !60, file: !1004, line: 227, type: !1151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1150, file: !1004, line: 260)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1154, file: !1004, line: 262)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1167, file: !1004, line: 263)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1158, file: !1004, line: 264)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1162, file: !1004, line: 265)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1171, file: !1004, line: 266)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1187, file: !1189, line: 405)
!1187 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !1188, file: !1188, line: 1342, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1188 = !DIFile(filename: "/usr/local/cuda-8.0/include/math_functions.hpp", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1189 = !DIFile(filename: "/usr/local/lib/clang/7.0.0/include/__clang_cuda_cmath.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1191, file: !1189, line: 406)
!1191 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !1188, file: !1188, line: 1370, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1193, file: !1189, line: 407)
!1193 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !1188, file: !1188, line: 1337, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1195, file: !1189, line: 408)
!1195 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !1188, file: !1188, line: 1375, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1197, file: !1189, line: 409)
!1197 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !1188, file: !1188, line: 1327, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1199, file: !1189, line: 410)
!1199 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !1188, file: !1188, line: 1332, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1201, file: !1189, line: 411)
!1201 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !1188, file: !1188, line: 1380, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1203, file: !1189, line: 412)
!1203 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !1188, file: !1188, line: 1430, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1205, file: !1189, line: 413)
!1205 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !1206, file: !1206, line: 667, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1206 = !DIFile(filename: "/usr/local/cuda-8.0/include/device_functions.hpp", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1208, file: !1189, line: 414)
!1208 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !1188, file: !1188, line: 1189, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1210, file: !1189, line: 415)
!1210 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !1188, file: !1188, line: 1243, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1212, file: !1189, line: 416)
!1212 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !1188, file: !1188, line: 1312, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1214, file: !1189, line: 417)
!1214 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !1188, file: !1188, line: 1490, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1216, file: !1189, line: 418)
!1216 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !1188, file: !1188, line: 1480, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1218, file: !1189, line: 419)
!1218 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !1206, file: !1206, line: 657, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1220, file: !1189, line: 420)
!1220 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !1188, file: !1188, line: 1294, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1222, file: !1189, line: 421)
!1222 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !1188, file: !1188, line: 1385, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1224, file: !1189, line: 422)
!1224 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !1206, file: !1206, line: 607, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1226, file: !1189, line: 423)
!1226 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !1188, file: !1188, line: 1616, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1228, file: !1189, line: 424)
!1228 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !1206, file: !1206, line: 597, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1230, file: !1189, line: 425)
!1230 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !1188, file: !1188, line: 1568, type: !814, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1232, file: !1189, line: 426)
!1232 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !1206, file: !1206, line: 622, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1234, file: !1189, line: 427)
!1234 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !1206, file: !1206, line: 617, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1236, file: !1189, line: 428)
!1236 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !1188, file: !1188, line: 1553, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1238, file: !1189, line: 429)
!1238 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !1188, file: !1188, line: 1543, type: !828, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1240, file: !1189, line: 430)
!1240 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !1188, file: !1188, line: 1390, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1242, file: !1189, line: 431)
!1242 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !1188, file: !1188, line: 1621, type: !824, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1244, file: !1189, line: 432)
!1244 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !1188, file: !1188, line: 1520, type: !865, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1246, file: !1189, line: 433)
!1246 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !1188, file: !1188, line: 1515, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1248, file: !1189, line: 434)
!1248 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !1188, file: !1188, line: 1149, type: !873, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1250, file: !1189, line: 435)
!1250 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !1188, file: !1188, line: 1602, type: !873, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1252, file: !1189, line: 436)
!1252 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !1188, file: !1188, line: 1356, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1254, file: !1189, line: 437)
!1254 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !1188, file: !1188, line: 1365, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1256, file: !1189, line: 438)
!1256 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !1188, file: !1188, line: 1285, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1258, file: !1189, line: 439)
!1258 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !1188, file: !1188, line: 1626, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1260, file: !1189, line: 440)
!1260 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !1188, file: !1188, line: 1347, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1262, file: !1189, line: 441)
!1262 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !1188, file: !1188, line: 1140, type: !887, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1264, file: !1189, line: 442)
!1264 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !1188, file: !1188, line: 1607, type: !887, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1266, file: !1189, line: 443)
!1266 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !1188, file: !1188, line: 1548, type: !895, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1268, file: !1189, line: 444)
!1268 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !1188, file: !1188, line: 1154, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1270, file: !1189, line: 445)
!1270 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !1188, file: !1188, line: 1218, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1272, file: !1189, line: 446)
!1272 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !1188, file: !1188, line: 1583, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1274, file: !1189, line: 447)
!1274 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !1188, file: !1188, line: 1558, type: !782, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1276, file: !1189, line: 448)
!1276 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !1188, file: !1188, line: 1563, type: !915, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1278, file: !1189, line: 449)
!1278 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !1188, file: !1188, line: 1135, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1280, file: !1189, line: 450)
!1280 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !1188, file: !1188, line: 1597, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1282, file: !1189, line: 451)
!1282 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !1188, file: !1188, line: 1530, type: !923, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1284, file: !1189, line: 452)
!1284 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !1188, file: !1188, line: 1525, type: !865, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1286, file: !1189, line: 453)
!1286 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !1188, file: !1188, line: 1234, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1288, file: !1189, line: 454)
!1288 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !1188, file: !1188, line: 1317, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1290, file: !1189, line: 455)
!1290 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !1206, file: !1206, line: 907, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1292, file: !1189, line: 456)
!1292 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !1188, file: !1188, line: 1276, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1294, file: !1189, line: 457)
!1294 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !1188, file: !1188, line: 1322, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1296, file: !1189, line: 458)
!1296 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !1188, file: !1188, line: 1592, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !1298, file: !1189, line: 459)
!1298 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !1206, file: !1206, line: 662, type: !770, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1300, entity: !1301, file: !1302, line: 56)
!1300 = !DINamespace(name: "__gnu_debug", scope: null)
!1301 = !DINamespace(name: "__debug", scope: !15)
!1302 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/debug/debug.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !103, file: !71, line: 44)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !551, file: !71, line: 45)
!1305 = !{i32 2, !"Dwarf Version", i32 4}
!1306 = !{i32 2, !"Debug Info Version", i32 3}
!1307 = !{i32 1, !"wchar_size", i32 4}
!1308 = !{!"clang version 7.0.0 (trunk 333411)"}
!1309 = distinct !DISubprogram(name: "get_time", linkageName: "_Z8get_timev", scope: !1, file: !1, line: 25, type: !1310, isLocal: false, isDefinition: true, scopeLine: 25, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !1312)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{!39}
!1312 = !{!1313}
!1313 = !DILocalVariable(name: "time", scope: !1309, file: !1, line: 26, type: !1314)
!1314 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !1315, line: 30, size: 128, flags: DIFlagTypePassByValue, elements: !1316, identifier: "_ZTS7timeval")
!1315 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1316 = !{!1317, !1320}
!1317 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1314, file: !1315, line: 32, baseType: !1318, size: 64)
!1318 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !1319, line: 139, baseType: !552)
!1319 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1320 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !1314, file: !1315, line: 33, baseType: !1321, size: 64, offset: 64)
!1321 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !1319, line: 141, baseType: !552)
!1322 = !DILocation(line: 26, column: 5, scope: !1309)
!1323 = !DILocation(line: 26, column: 20, scope: !1309)
!1324 = !DILocation(line: 27, column: 9, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1309, file: !1, line: 27, column: 9)
!1326 = !DILocation(line: 27, column: 9, scope: !1309)
!1327 = !DILocation(line: 31, column: 25, scope: !1309)
!1328 = !{!1329, !1330, i64 0}
!1329 = !{!"_ZTS7timeval", !1330, i64 0, !1330, i64 8}
!1330 = !{!"long", !1331, i64 0}
!1331 = !{!"omnipotent char", !1332, i64 0}
!1332 = !{!"Simple C++ TBAA"}
!1333 = !DILocation(line: 31, column: 20, scope: !1309)
!1334 = !DILocation(line: 31, column: 47, scope: !1309)
!1335 = !{!1329, !1330, i64 8}
!1336 = !DILocation(line: 31, column: 42, scope: !1309)
!1337 = !DILocation(line: 31, column: 55, scope: !1309)
!1338 = !DILocation(line: 31, column: 32, scope: !1309)
!1339 = !DILocation(line: 31, column: 5, scope: !1309)
!1340 = !DILocation(line: 0, scope: !1309)
!1341 = !DILocation(line: 32, column: 1, scope: !1309)
!1342 = distinct !DISubprogram(name: "euclid", linkageName: "_Z6euclidP7latLongPfiff", scope: !1, file: !1, line: 58, type: !1343, isLocal: false, isDefinition: true, scopeLine: 59, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !1347)
!1343 = !DISubroutineType(types: !1344)
!1344 = !{null, !1345, !40, !45, !22, !22}
!1345 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1346, size: 64)
!1346 = !DIDerivedType(tag: DW_TAG_typedef, name: "LatLong", file: !1, line: 39, baseType: !19)
!1347 = !{!1348, !1349, !1350, !1351, !1352}
!1348 = !DILocalVariable(name: "d_locations", arg: 1, scope: !1342, file: !1, line: 58, type: !1345)
!1349 = !DILocalVariable(name: "d_distances", arg: 2, scope: !1342, file: !1, line: 58, type: !40)
!1350 = !DILocalVariable(name: "numRecords", arg: 3, scope: !1342, file: !1, line: 58, type: !45)
!1351 = !DILocalVariable(name: "lat", arg: 4, scope: !1342, file: !1, line: 58, type: !22)
!1352 = !DILocalVariable(name: "lng", arg: 5, scope: !1342, file: !1, line: 58, type: !22)
!1353 = !DILocation(line: 58, column: 33, scope: !1342)
!1354 = !{!1355, !1355, i64 0}
!1355 = !{!"any pointer", !1331, i64 0}
!1356 = !DILocation(line: 58, column: 53, scope: !1342)
!1357 = !DILocation(line: 58, column: 70, scope: !1342)
!1358 = !{!1359, !1359, i64 0}
!1359 = !{!"int", !1331, i64 0}
!1360 = !DILocation(line: 58, column: 87, scope: !1342)
!1361 = !{!1362, !1362, i64 0}
!1362 = !{!"float", !1331, i64 0}
!1363 = !DILocation(line: 58, column: 98, scope: !1342)
!1364 = !DILocation(line: 59, column: 1, scope: !1342)
!1365 = !DILocation(line: 67, column: 1, scope: !1342)
!1366 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 73, type: !1367, isLocal: false, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !1369)
!1367 = !DISubroutineType(types: !1368)
!1368 = !{!45, !45, !43}
!1369 = !{!1370, !1371, !1372, !1373, !1374, !1375, !1376, !1377, !1378, !1379, !1380, !1381, !1385, !1386, !1387, !1388, !1389, !1390, !1468, !1469, !1470, !1471, !1472, !1473, !1474, !1475, !1476, !1477, !1501, !1502}
!1370 = !DILocalVariable(name: "argc", arg: 1, scope: !1366, file: !1, line: 73, type: !45)
!1371 = !DILocalVariable(name: "argv", arg: 2, scope: !1366, file: !1, line: 73, type: !43)
!1372 = !DILocalVariable(name: "i", scope: !1366, file: !1, line: 75, type: !45)
!1373 = !DILocalVariable(name: "lat", scope: !1366, file: !1, line: 76, type: !22)
!1374 = !DILocalVariable(name: "lng", scope: !1366, file: !1, line: 76, type: !22)
!1375 = !DILocalVariable(name: "quiet", scope: !1366, file: !1, line: 77, type: !45)
!1376 = !DILocalVariable(name: "timing", scope: !1366, file: !1, line: 77, type: !45)
!1377 = !DILocalVariable(name: "platform", scope: !1366, file: !1, line: 77, type: !45)
!1378 = !DILocalVariable(name: "device", scope: !1366, file: !1, line: 77, type: !45)
!1379 = !DILocalVariable(name: "records", scope: !1366, file: !1, line: 79, type: !568)
!1380 = !DILocalVariable(name: "locations", scope: !1366, file: !1, line: 80, type: !366)
!1381 = !DILocalVariable(name: "filename", scope: !1366, file: !1, line: 81, type: !1382)
!1382 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 800, elements: !1383)
!1383 = !{!1384}
!1384 = !DISubrange(count: 100)
!1385 = !DILocalVariable(name: "resultsCount", scope: !1366, file: !1, line: 82, type: !45)
!1386 = !DILocalVariable(name: "numRecords", scope: !1366, file: !1, line: 91, type: !45)
!1387 = !DILocalVariable(name: "distances", scope: !1366, file: !1, line: 99, type: !40)
!1388 = !DILocalVariable(name: "d_locations", scope: !1366, file: !1, line: 101, type: !1345)
!1389 = !DILocalVariable(name: "d_distances", scope: !1366, file: !1, line: 102, type: !40)
!1390 = !DILocalVariable(name: "deviceProp", scope: !1366, file: !1, line: 106, type: !1391)
!1391 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cudaDeviceProp", file: !4, line: 1308, size: 5184, flags: DIFlagTypePassByValue, elements: !1392, identifier: "_ZTS14cudaDeviceProp")
!1392 = !{!1393, !1397, !1398, !1399, !1400, !1401, !1402, !1403, !1407, !1408, !1409, !1410, !1411, !1412, !1413, !1414, !1415, !1416, !1417, !1418, !1419, !1420, !1421, !1422, !1423, !1427, !1428, !1429, !1430, !1431, !1432, !1433, !1434, !1435, !1436, !1437, !1438, !1439, !1440, !1441, !1442, !1443, !1444, !1445, !1446, !1447, !1448, !1449, !1450, !1451, !1452, !1453, !1454, !1455, !1456, !1457, !1458, !1459, !1460, !1461, !1462, !1463, !1464, !1465, !1466, !1467}
!1393 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !1391, file: !4, line: 1310, baseType: !1394, size: 2048)
!1394 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 2048, elements: !1395)
!1395 = !{!1396}
!1396 = !DISubrange(count: 256)
!1397 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !1391, file: !4, line: 1311, baseType: !1044, size: 64, offset: 2048)
!1398 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !1391, file: !4, line: 1312, baseType: !1044, size: 64, offset: 2112)
!1399 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !1391, file: !4, line: 1313, baseType: !45, size: 32, offset: 2176)
!1400 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !1391, file: !4, line: 1314, baseType: !45, size: 32, offset: 2208)
!1401 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !1391, file: !4, line: 1315, baseType: !1044, size: 64, offset: 2240)
!1402 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !1391, file: !4, line: 1316, baseType: !45, size: 32, offset: 2304)
!1403 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !1391, file: !4, line: 1317, baseType: !1404, size: 96, offset: 2336)
!1404 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 96, elements: !1405)
!1405 = !{!1406}
!1406 = !DISubrange(count: 3)
!1407 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !1391, file: !4, line: 1318, baseType: !1404, size: 96, offset: 2432)
!1408 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !1391, file: !4, line: 1319, baseType: !45, size: 32, offset: 2528)
!1409 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !1391, file: !4, line: 1320, baseType: !1044, size: 64, offset: 2560)
!1410 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !1391, file: !4, line: 1321, baseType: !45, size: 32, offset: 2624)
!1411 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !1391, file: !4, line: 1322, baseType: !45, size: 32, offset: 2656)
!1412 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !1391, file: !4, line: 1323, baseType: !1044, size: 64, offset: 2688)
!1413 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !1391, file: !4, line: 1324, baseType: !1044, size: 64, offset: 2752)
!1414 = !DIDerivedType(tag: DW_TAG_member, name: "deviceOverlap", scope: !1391, file: !4, line: 1325, baseType: !45, size: 32, offset: 2816)
!1415 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !1391, file: !4, line: 1326, baseType: !45, size: 32, offset: 2848)
!1416 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !1391, file: !4, line: 1327, baseType: !45, size: 32, offset: 2880)
!1417 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !1391, file: !4, line: 1328, baseType: !45, size: 32, offset: 2912)
!1418 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !1391, file: !4, line: 1329, baseType: !45, size: 32, offset: 2944)
!1419 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !1391, file: !4, line: 1330, baseType: !45, size: 32, offset: 2976)
!1420 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !1391, file: !4, line: 1331, baseType: !45, size: 32, offset: 3008)
!1421 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DMipmap", scope: !1391, file: !4, line: 1332, baseType: !45, size: 32, offset: 3040)
!1422 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !1391, file: !4, line: 1333, baseType: !45, size: 32, offset: 3072)
!1423 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !1391, file: !4, line: 1334, baseType: !1424, size: 64, offset: 3104)
!1424 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 64, elements: !1425)
!1425 = !{!1426}
!1426 = !DISubrange(count: 2)
!1427 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DMipmap", scope: !1391, file: !4, line: 1335, baseType: !1424, size: 64, offset: 3168)
!1428 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLinear", scope: !1391, file: !4, line: 1336, baseType: !1404, size: 96, offset: 3232)
!1429 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DGather", scope: !1391, file: !4, line: 1337, baseType: !1424, size: 64, offset: 3328)
!1430 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !1391, file: !4, line: 1338, baseType: !1404, size: 96, offset: 3392)
!1431 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3DAlt", scope: !1391, file: !4, line: 1339, baseType: !1404, size: 96, offset: 3488)
!1432 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemap", scope: !1391, file: !4, line: 1340, baseType: !45, size: 32, offset: 3584)
!1433 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLayered", scope: !1391, file: !4, line: 1341, baseType: !1424, size: 64, offset: 3616)
!1434 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLayered", scope: !1391, file: !4, line: 1342, baseType: !1404, size: 96, offset: 3680)
!1435 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemapLayered", scope: !1391, file: !4, line: 1343, baseType: !1424, size: 64, offset: 3776)
!1436 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1D", scope: !1391, file: !4, line: 1344, baseType: !45, size: 32, offset: 3840)
!1437 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2D", scope: !1391, file: !4, line: 1345, baseType: !1424, size: 64, offset: 3872)
!1438 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface3D", scope: !1391, file: !4, line: 1346, baseType: !1404, size: 96, offset: 3936)
!1439 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1DLayered", scope: !1391, file: !4, line: 1347, baseType: !1424, size: 64, offset: 4032)
!1440 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2DLayered", scope: !1391, file: !4, line: 1348, baseType: !1404, size: 96, offset: 4096)
!1441 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemap", scope: !1391, file: !4, line: 1349, baseType: !45, size: 32, offset: 4192)
!1442 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemapLayered", scope: !1391, file: !4, line: 1350, baseType: !1424, size: 64, offset: 4224)
!1443 = !DIDerivedType(tag: DW_TAG_member, name: "surfaceAlignment", scope: !1391, file: !4, line: 1351, baseType: !1044, size: 64, offset: 4288)
!1444 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !1391, file: !4, line: 1352, baseType: !45, size: 32, offset: 4352)
!1445 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !1391, file: !4, line: 1353, baseType: !45, size: 32, offset: 4384)
!1446 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !1391, file: !4, line: 1354, baseType: !45, size: 32, offset: 4416)
!1447 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !1391, file: !4, line: 1355, baseType: !45, size: 32, offset: 4448)
!1448 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !1391, file: !4, line: 1356, baseType: !45, size: 32, offset: 4480)
!1449 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !1391, file: !4, line: 1357, baseType: !45, size: 32, offset: 4512)
!1450 = !DIDerivedType(tag: DW_TAG_member, name: "asyncEngineCount", scope: !1391, file: !4, line: 1358, baseType: !45, size: 32, offset: 4544)
!1451 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedAddressing", scope: !1391, file: !4, line: 1359, baseType: !45, size: 32, offset: 4576)
!1452 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !1391, file: !4, line: 1360, baseType: !45, size: 32, offset: 4608)
!1453 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !1391, file: !4, line: 1361, baseType: !45, size: 32, offset: 4640)
!1454 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !1391, file: !4, line: 1362, baseType: !45, size: 32, offset: 4672)
!1455 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !1391, file: !4, line: 1363, baseType: !45, size: 32, offset: 4704)
!1456 = !DIDerivedType(tag: DW_TAG_member, name: "streamPrioritiesSupported", scope: !1391, file: !4, line: 1364, baseType: !45, size: 32, offset: 4736)
!1457 = !DIDerivedType(tag: DW_TAG_member, name: "globalL1CacheSupported", scope: !1391, file: !4, line: 1365, baseType: !45, size: 32, offset: 4768)
!1458 = !DIDerivedType(tag: DW_TAG_member, name: "localL1CacheSupported", scope: !1391, file: !4, line: 1366, baseType: !45, size: 32, offset: 4800)
!1459 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerMultiprocessor", scope: !1391, file: !4, line: 1367, baseType: !1044, size: 64, offset: 4864)
!1460 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerMultiprocessor", scope: !1391, file: !4, line: 1368, baseType: !45, size: 32, offset: 4928)
!1461 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !1391, file: !4, line: 1369, baseType: !45, size: 32, offset: 4960)
!1462 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !1391, file: !4, line: 1370, baseType: !45, size: 32, offset: 4992)
!1463 = !DIDerivedType(tag: DW_TAG_member, name: "multiGpuBoardGroupID", scope: !1391, file: !4, line: 1371, baseType: !45, size: 32, offset: 5024)
!1464 = !DIDerivedType(tag: DW_TAG_member, name: "hostNativeAtomicSupported", scope: !1391, file: !4, line: 1372, baseType: !45, size: 32, offset: 5056)
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "singleToDoublePrecisionPerfRatio", scope: !1391, file: !4, line: 1373, baseType: !45, size: 32, offset: 5088)
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "pageableMemoryAccess", scope: !1391, file: !4, line: 1374, baseType: !45, size: 32, offset: 5120)
!1467 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentManagedAccess", scope: !1391, file: !4, line: 1375, baseType: !45, size: 32, offset: 5152)
!1468 = !DILocalVariable(name: "maxGridX", scope: !1366, file: !1, line: 109, type: !105)
!1469 = !DILocalVariable(name: "threadsPerBlock", scope: !1366, file: !1, line: 110, type: !105)
!1470 = !DILocalVariable(name: "totalDeviceMemory", scope: !1366, file: !1, line: 111, type: !1044)
!1471 = !DILocalVariable(name: "freeDeviceMemory", scope: !1366, file: !1, line: 112, type: !1044)
!1472 = !DILocalVariable(name: "usableDeviceMemory", scope: !1366, file: !1, line: 115, type: !105)
!1473 = !DILocalVariable(name: "maxThreads", scope: !1366, file: !1, line: 116, type: !105)
!1474 = !DILocalVariable(name: "blocks", scope: !1366, file: !1, line: 122, type: !105)
!1475 = !DILocalVariable(name: "gridY", scope: !1366, file: !1, line: 123, type: !105)
!1476 = !DILocalVariable(name: "gridX", scope: !1366, file: !1, line: 124, type: !105)
!1477 = !DILocalVariable(name: "gridDim", scope: !1366, file: !1, line: 126, type: !1478)
!1478 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1479, line: 427, baseType: !1480)
!1479 = !DIFile(filename: "/usr/local/cuda-8.0/include/vector_types.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!1480 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1479, line: 417, size: 96, flags: DIFlagTypePassByValue, elements: !1481, identifier: "_ZTS4dim3")
!1481 = !{!1482, !1483, !1484, !1485, !1489, !1498}
!1482 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1480, file: !1479, line: 419, baseType: !5, size: 32)
!1483 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1480, file: !1479, line: 419, baseType: !5, size: 32, offset: 32)
!1484 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1480, file: !1479, line: 419, baseType: !5, size: 32, offset: 64)
!1485 = !DISubprogram(name: "dim3", scope: !1480, file: !1479, line: 421, type: !1486, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!1486 = !DISubroutineType(types: !1487)
!1487 = !{null, !1488, !5, !5, !5}
!1488 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1480, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1489 = !DISubprogram(name: "dim3", scope: !1480, file: !1479, line: 422, type: !1490, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!1490 = !DISubroutineType(types: !1491)
!1491 = !{null, !1488, !1492}
!1492 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1479, line: 383, baseType: !1493)
!1493 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1479, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !1494, identifier: "_ZTS5uint3")
!1494 = !{!1495, !1496, !1497}
!1495 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1493, file: !1479, line: 192, baseType: !5, size: 32)
!1496 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1493, file: !1479, line: 192, baseType: !5, size: 32, offset: 32)
!1497 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1493, file: !1479, line: 192, baseType: !5, size: 32, offset: 64)
!1498 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1480, file: !1479, line: 423, type: !1499, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!1499 = !DISubroutineType(types: !1500)
!1500 = !{!1492, !1488}
!1501 = !DILocalVariable(name: "t0", scope: !1366, file: !1, line: 159, type: !39)
!1502 = !DILocalVariable(name: "t1", scope: !1366, file: !1, line: 163, type: !39)
!1503 = !DILocation(line: 73, column: 14, scope: !1366)
!1504 = !DILocation(line: 73, column: 26, scope: !1366)
!1505 = !DILocation(line: 75, column: 9, scope: !1366)
!1506 = !DILocation(line: 76, column: 2, scope: !1366)
!1507 = !DILocation(line: 77, column: 2, scope: !1366)
!1508 = !DILocation(line: 77, column: 6, scope: !1366)
!1509 = !DILocation(line: 77, column: 14, scope: !1366)
!1510 = !DILocation(line: 77, column: 23, scope: !1366)
!1511 = !DILocation(line: 77, column: 34, scope: !1366)
!1512 = !DILocation(line: 79, column: 5, scope: !1366)
!1513 = !DILocation(line: 79, column: 25, scope: !1366)
!1514 = !DILocalVariable(name: "this", arg: 1, scope: !1515, type: !1517, flags: DIFlagArtificial | DIFlagObjectPointer)
!1515 = distinct !DISubprogram(name: "vector", linkageName: "_ZNSt6vectorI6recordSaIS0_EEC2Ev", scope: !568, file: !48, line: 253, type: !572, isLocal: false, isDefinition: true, scopeLine: 257, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !571, retainedNodes: !1516)
!1516 = !{!1514}
!1517 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !568, size: 64)
!1518 = !DILocation(line: 0, scope: !1515, inlinedAt: !1519)
!1519 = distinct !DILocation(line: 79, column: 25, scope: !1366)
!1520 = !DILocalVariable(name: "this", arg: 1, scope: !1521, type: !1523, flags: DIFlagArtificial | DIFlagObjectPointer)
!1521 = distinct !DISubprogram(name: "_Vector_base", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EEC2Ev", scope: !49, file: !48, line: 124, type: !182, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !181, retainedNodes: !1522)
!1522 = !{!1520}
!1523 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!1524 = !DILocation(line: 0, scope: !1521, inlinedAt: !1525)
!1525 = distinct !DILocation(line: 257, column: 9, scope: !1515, inlinedAt: !1519)
!1526 = !DILocalVariable(name: "this", arg: 1, scope: !1527, type: !1529, flags: DIFlagArtificial | DIFlagObjectPointer)
!1527 = distinct !DISubprogram(name: "_Vector_impl", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implC2Ev", scope: !52, file: !48, line: 86, type: !155, isLocal: false, isDefinition: true, scopeLine: 88, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !154, retainedNodes: !1528)
!1528 = !{!1526}
!1529 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!1530 = !DILocation(line: 0, scope: !1527, inlinedAt: !1531)
!1531 = distinct !DILocation(line: 125, column: 9, scope: !1521, inlinedAt: !1525)
!1532 = !DILocation(line: 87, column: 34, scope: !1527, inlinedAt: !1531)
!1533 = !DILocation(line: 80, column: 2, scope: !1366)
!1534 = !DILocalVariable(name: "this", arg: 1, scope: !1535, type: !1537, flags: DIFlagArtificial | DIFlagObjectPointer)
!1535 = distinct !DISubprogram(name: "vector", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEC2Ev", scope: !366, file: !48, line: 253, type: !370, isLocal: false, isDefinition: true, scopeLine: 257, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !369, retainedNodes: !1536)
!1536 = !{!1534}
!1537 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !366, size: 64)
!1538 = !DILocation(line: 0, scope: !1535, inlinedAt: !1539)
!1539 = distinct !DILocation(line: 80, column: 23, scope: !1366)
!1540 = !DILocalVariable(name: "this", arg: 1, scope: !1541, type: !1543, flags: DIFlagArtificial | DIFlagObjectPointer)
!1541 = distinct !DISubprogram(name: "_Vector_base", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EEC2Ev", scope: !212, file: !48, line: 124, type: !335, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !334, retainedNodes: !1542)
!1542 = !{!1540}
!1543 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64)
!1544 = !DILocation(line: 0, scope: !1541, inlinedAt: !1545)
!1545 = distinct !DILocation(line: 257, column: 9, scope: !1535, inlinedAt: !1539)
!1546 = !DILocalVariable(name: "this", arg: 1, scope: !1547, type: !1549, flags: DIFlagArtificial | DIFlagObjectPointer)
!1547 = distinct !DISubprogram(name: "_Vector_impl", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implC2Ev", scope: !215, file: !48, line: 86, type: !308, isLocal: false, isDefinition: true, scopeLine: 88, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !307, retainedNodes: !1548)
!1548 = !{!1546}
!1549 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!1550 = !DILocation(line: 0, scope: !1547, inlinedAt: !1551)
!1551 = distinct !DILocation(line: 125, column: 9, scope: !1541, inlinedAt: !1545)
!1552 = !DILocation(line: 87, column: 34, scope: !1547, inlinedAt: !1551)
!1553 = !DILocation(line: 81, column: 2, scope: !1366)
!1554 = !DILocation(line: 81, column: 7, scope: !1366)
!1555 = !DILocation(line: 82, column: 2, scope: !1366)
!1556 = !DILocation(line: 82, column: 6, scope: !1366)
!1557 = !DILocation(line: 76, column: 8, scope: !1366)
!1558 = !DILocation(line: 76, column: 13, scope: !1366)
!1559 = !DILocation(line: 85, column: 9, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1366, file: !1, line: 85, column: 9)
!1561 = !DILocation(line: 85, column: 9, scope: !1366)
!1562 = !DILocation(line: 87, column: 7, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1560, file: !1, line: 86, column: 60)
!1564 = !DILocation(line: 91, column: 22, scope: !1366)
!1565 = !DILocation(line: 91, column: 9, scope: !1366)
!1566 = !DILocation(line: 92, column: 9, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1366, file: !1, line: 92, column: 9)
!1568 = !DILocation(line: 92, column: 22, scope: !1567)
!1569 = !DILocation(line: 92, column: 9, scope: !1366)
!1570 = !DILocation(line: 92, column: 49, scope: !1567)
!1571 = !DILocation(line: 92, column: 36, scope: !1567)
!1572 = !DILocation(line: 182, column: 1, scope: !1366)
!1573 = !DILocation(line: 101, column: 2, scope: !1366)
!1574 = !DILocation(line: 102, column: 2, scope: !1366)
!1575 = !DILocation(line: 106, column: 2, scope: !1366)
!1576 = !DILocation(line: 107, column: 2, scope: !1366)
!1577 = !DILocation(line: 108, column: 2, scope: !1366)
!1578 = !DILocation(line: 109, column: 27, scope: !1366)
!1579 = !DILocation(line: 109, column: 16, scope: !1366)
!1580 = !DILocation(line: 110, column: 34, scope: !1366)
!1581 = !{!1582, !1359, i64 288}
!1582 = !{!"_ZTS14cudaDeviceProp", !1331, i64 0, !1330, i64 256, !1330, i64 264, !1359, i64 272, !1359, i64 276, !1330, i64 280, !1359, i64 288, !1331, i64 292, !1331, i64 304, !1359, i64 316, !1330, i64 320, !1359, i64 328, !1359, i64 332, !1330, i64 336, !1330, i64 344, !1359, i64 352, !1359, i64 356, !1359, i64 360, !1359, i64 364, !1359, i64 368, !1359, i64 372, !1359, i64 376, !1359, i64 380, !1359, i64 384, !1331, i64 388, !1331, i64 396, !1331, i64 404, !1331, i64 416, !1331, i64 424, !1331, i64 436, !1359, i64 448, !1331, i64 452, !1331, i64 460, !1331, i64 472, !1359, i64 480, !1331, i64 484, !1331, i64 492, !1331, i64 504, !1331, i64 512, !1359, i64 524, !1331, i64 528, !1330, i64 536, !1359, i64 544, !1359, i64 548, !1359, i64 552, !1359, i64 556, !1359, i64 560, !1359, i64 564, !1359, i64 568, !1359, i64 572, !1359, i64 576, !1359, i64 580, !1359, i64 584, !1359, i64 588, !1359, i64 592, !1359, i64 596, !1359, i64 600, !1330, i64 608, !1359, i64 616, !1359, i64 620, !1359, i64 624, !1359, i64 628, !1359, i64 632, !1359, i64 636, !1359, i64 640, !1359, i64 644}
!1583 = !DILocation(line: 110, column: 16, scope: !1366)
!1584 = !DILocation(line: 111, column: 2, scope: !1366)
!1585 = !DILocation(line: 112, column: 2, scope: !1366)
!1586 = !DILocation(line: 113, column: 2, scope: !1366)
!1587 = !DILocation(line: 114, column: 2, scope: !1366)
!1588 = !DILocation(line: 115, column: 37, scope: !1366)
!1589 = !{!1330, !1330, i64 0}
!1590 = !DILocation(line: 112, column: 9, scope: !1366)
!1591 = !DILocation(line: 115, column: 54, scope: !1366)
!1592 = !DILocation(line: 116, column: 48, scope: !1366)
!1593 = !DILocation(line: 116, column: 16, scope: !1366)
!1594 = !DILocation(line: 117, column: 7, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1366, file: !1, line: 117, column: 7)
!1596 = !DILocation(line: 117, column: 18, scope: !1595)
!1597 = !DILocation(line: 117, column: 7, scope: !1366)
!1598 = !DILocation(line: 119, column: 12, scope: !1599)
!1599 = distinct !DILexicalBlock(scope: !1595, file: !1, line: 118, column: 2)
!1600 = !DILocation(line: 119, column: 3, scope: !1599)
!1601 = !DILocation(line: 120, column: 3, scope: !1599)
!1602 = !DILocation(line: 122, column: 25, scope: !1366)
!1603 = !DILocation(line: 122, column: 16, scope: !1366)
!1604 = !DILocation(line: 123, column: 24, scope: !1366)
!1605 = !DILocation(line: 123, column: 16, scope: !1366)
!1606 = !DILocation(line: 124, column: 24, scope: !1366)
!1607 = !DILocation(line: 124, column: 16, scope: !1366)
!1608 = !DILocation(line: 126, column: 7, scope: !1366)
!1609 = !DILocation(line: 145, column: 44, scope: !1366)
!1610 = !DILocation(line: 145, column: 23, scope: !1366)
!1611 = !DILocation(line: 145, column: 14, scope: !1366)
!1612 = !DILocation(line: 99, column: 9, scope: !1366)
!1613 = !DILocation(line: 146, column: 13, scope: !1366)
!1614 = !DILocation(line: 146, column: 52, scope: !1366)
!1615 = !DILocation(line: 146, column: 2, scope: !1366)
!1616 = !DILocation(line: 147, column: 13, scope: !1366)
!1617 = !DILocation(line: 147, column: 2, scope: !1366)
!1618 = !DILocation(line: 152, column: 17, scope: !1366)
!1619 = !DILocation(line: 101, column: 11, scope: !1366)
!1620 = !DILocation(line: 80, column: 23, scope: !1366)
!1621 = !DILocalVariable(name: "this", arg: 1, scope: !1622, type: !1537, flags: DIFlagArtificial | DIFlagObjectPointer)
!1622 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEixEm", scope: !366, file: !48, line: 779, type: !438, isLocal: false, isDefinition: true, scopeLine: 780, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !437, retainedNodes: !1623)
!1623 = !{!1621, !1624}
!1624 = !DILocalVariable(name: "__n", arg: 2, scope: !1622, file: !48, line: 779, type: !363)
!1625 = !DILocation(line: 0, scope: !1622, inlinedAt: !1626)
!1626 = distinct !DILocation(line: 152, column: 31, scope: !1366)
!1627 = !DILocation(line: 779, column: 28, scope: !1622, inlinedAt: !1626)
!1628 = !DILocation(line: 780, column: 32, scope: !1622, inlinedAt: !1626)
!1629 = !{!1630, !1355, i64 0}
!1630 = !{!"_ZTSSt12_Vector_baseI7latLongSaIS0_EE", !1631, i64 0}
!1631 = !{!"_ZTSNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implE", !1355, i64 0, !1355, i64 8, !1355, i64 16}
!1632 = !DILocation(line: 152, column: 5, scope: !1366)
!1633 = !DILocation(line: 158, column: 5, scope: !1366)
!1634 = !DILocation(line: 26, column: 5, scope: !1309, inlinedAt: !1635)
!1635 = distinct !DILocation(line: 159, column: 14, scope: !1366)
!1636 = !DILocation(line: 26, column: 20, scope: !1309, inlinedAt: !1635)
!1637 = !DILocation(line: 27, column: 9, scope: !1325, inlinedAt: !1635)
!1638 = !DILocation(line: 27, column: 9, scope: !1309, inlinedAt: !1635)
!1639 = !DILocation(line: 31, column: 25, scope: !1309, inlinedAt: !1635)
!1640 = !DILocation(line: 31, column: 20, scope: !1309, inlinedAt: !1635)
!1641 = !DILocation(line: 31, column: 47, scope: !1309, inlinedAt: !1635)
!1642 = !DILocation(line: 31, column: 42, scope: !1309, inlinedAt: !1635)
!1643 = !DILocation(line: 31, column: 55, scope: !1309, inlinedAt: !1635)
!1644 = !DILocation(line: 31, column: 32, scope: !1309, inlinedAt: !1635)
!1645 = !DILocation(line: 31, column: 5, scope: !1309, inlinedAt: !1635)
!1646 = !DILocation(line: 0, scope: !1309, inlinedAt: !1635)
!1647 = !DILocation(line: 32, column: 1, scope: !1309, inlinedAt: !1635)
!1648 = !DILocation(line: 159, column: 9, scope: !1366)
!1649 = !DILocation(line: 161, column: 15, scope: !1366)
!1650 = !DILocation(line: 161, column: 11, scope: !1366)
!1651 = !DILocation(line: 161, column: 5, scope: !1366)
!1652 = !DILocation(line: 161, column: 44, scope: !1366)
!1653 = !DILocation(line: 161, column: 56, scope: !1366)
!1654 = !DILocation(line: 102, column: 9, scope: !1366)
!1655 = !DILocation(line: 161, column: 79, scope: !1366)
!1656 = !DILocation(line: 161, column: 83, scope: !1366)
!1657 = !DILocation(line: 162, column: 5, scope: !1366)
!1658 = !DILocation(line: 26, column: 5, scope: !1309, inlinedAt: !1659)
!1659 = distinct !DILocation(line: 163, column: 14, scope: !1366)
!1660 = !DILocation(line: 26, column: 20, scope: !1309, inlinedAt: !1659)
!1661 = !DILocation(line: 27, column: 9, scope: !1325, inlinedAt: !1659)
!1662 = !DILocation(line: 27, column: 9, scope: !1309, inlinedAt: !1659)
!1663 = !DILocation(line: 31, column: 25, scope: !1309, inlinedAt: !1659)
!1664 = !DILocation(line: 31, column: 20, scope: !1309, inlinedAt: !1659)
!1665 = !DILocation(line: 31, column: 47, scope: !1309, inlinedAt: !1659)
!1666 = !DILocation(line: 31, column: 42, scope: !1309, inlinedAt: !1659)
!1667 = !DILocation(line: 31, column: 55, scope: !1309, inlinedAt: !1659)
!1668 = !DILocation(line: 31, column: 32, scope: !1309, inlinedAt: !1659)
!1669 = !DILocation(line: 31, column: 5, scope: !1309, inlinedAt: !1659)
!1670 = !DILocation(line: 0, scope: !1309, inlinedAt: !1659)
!1671 = !DILocation(line: 32, column: 1, scope: !1309, inlinedAt: !1659)
!1672 = !DILocation(line: 163, column: 9, scope: !1366)
!1673 = !DILocation(line: 164, column: 10, scope: !1366)
!1674 = !DILocation(line: 164, column: 28, scope: !1366)
!1675 = !DILocation(line: 164, column: 2, scope: !1366)
!1676 = !DILocation(line: 167, column: 28, scope: !1366)
!1677 = !DILocation(line: 167, column: 5, scope: !1366)
!1678 = !DILocalVariable(name: "records", arg: 1, scope: !1679, file: !1, line: 238, type: !596)
!1679 = distinct !DISubprogram(name: "findLowest", linkageName: "_Z10findLowestRSt6vectorI6recordSaIS0_EEPfii", scope: !1, file: !1, line: 238, type: !1680, isLocal: false, isDefinition: true, scopeLine: 238, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !1682)
!1680 = !DISubroutineType(types: !1681)
!1681 = !{null, !596, !40, !45, !45}
!1682 = !{!1678, !1683, !1684, !1685, !1686, !1687, !1688, !1689, !1690, !1693}
!1683 = !DILocalVariable(name: "distances", arg: 2, scope: !1679, file: !1, line: 238, type: !40)
!1684 = !DILocalVariable(name: "numRecords", arg: 3, scope: !1679, file: !1, line: 238, type: !45)
!1685 = !DILocalVariable(name: "topN", arg: 4, scope: !1679, file: !1, line: 238, type: !45)
!1686 = !DILocalVariable(name: "i", scope: !1679, file: !1, line: 239, type: !45)
!1687 = !DILocalVariable(name: "j", scope: !1679, file: !1, line: 239, type: !45)
!1688 = !DILocalVariable(name: "val", scope: !1679, file: !1, line: 240, type: !22)
!1689 = !DILocalVariable(name: "minLoc", scope: !1679, file: !1, line: 241, type: !45)
!1690 = !DILocalVariable(name: "tempRec", scope: !1679, file: !1, line: 242, type: !1691)
!1691 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1692, size: 64)
!1692 = !DIDerivedType(tag: DW_TAG_typedef, name: "Record", file: !1, line: 45, baseType: !30)
!1693 = !DILocalVariable(name: "tempDist", scope: !1679, file: !1, line: 243, type: !22)
!1694 = !DILocation(line: 238, column: 38, scope: !1679, inlinedAt: !1695)
!1695 = distinct !DILocation(line: 170, column: 5, scope: !1366)
!1696 = !DILocation(line: 238, column: 53, scope: !1679, inlinedAt: !1695)
!1697 = !DILocation(line: 238, column: 67, scope: !1679, inlinedAt: !1695)
!1698 = !DILocation(line: 238, column: 82, scope: !1679, inlinedAt: !1695)
!1699 = !DILocation(line: 239, column: 7, scope: !1679, inlinedAt: !1695)
!1700 = !DILocation(line: 245, column: 12, scope: !1701, inlinedAt: !1695)
!1701 = distinct !DILexicalBlock(scope: !1702, file: !1, line: 245, column: 3)
!1702 = distinct !DILexicalBlock(scope: !1679, file: !1, line: 245, column: 3)
!1703 = !DILocation(line: 245, column: 3, scope: !1702, inlinedAt: !1695)
!1704 = !{!1705, !1355, i64 0}
!1705 = !{!"_ZTSSt12_Vector_baseI6recordSaIS0_EE", !1706, i64 0}
!1706 = !{!"_ZTSNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implE", !1355, i64 0, !1355, i64 8, !1355, i64 16}
!1707 = !DILocation(line: 239, column: 9, scope: !1679, inlinedAt: !1695)
!1708 = !DILocation(line: 241, column: 7, scope: !1679, inlinedAt: !1695)
!1709 = !DILocation(line: 247, column: 14, scope: !1710, inlinedAt: !1695)
!1710 = distinct !DILexicalBlock(scope: !1711, file: !1, line: 247, column: 5)
!1711 = distinct !DILexicalBlock(scope: !1712, file: !1, line: 247, column: 5)
!1712 = distinct !DILexicalBlock(scope: !1701, file: !1, line: 245, column: 23)
!1713 = !DILocation(line: 247, column: 5, scope: !1711, inlinedAt: !1695)
!1714 = !DILocation(line: 248, column: 13, scope: !1715, inlinedAt: !1695)
!1715 = distinct !DILexicalBlock(scope: !1710, file: !1, line: 247, column: 31)
!1716 = !DILocation(line: 240, column: 9, scope: !1679, inlinedAt: !1695)
!1717 = !DILocation(line: 249, column: 17, scope: !1718, inlinedAt: !1695)
!1718 = distinct !DILexicalBlock(scope: !1715, file: !1, line: 249, column: 11)
!1719 = !DILocation(line: 249, column: 15, scope: !1718, inlinedAt: !1695)
!1720 = !DILocation(line: 249, column: 11, scope: !1715, inlinedAt: !1695)
!1721 = !DILocation(line: 247, column: 27, scope: !1710, inlinedAt: !1695)
!1722 = distinct !{!1722, !1723}
!1723 = !{!"llvm.loop.unroll.disable"}
!1724 = distinct !{!1724, !1725, !1726}
!1725 = !DILocation(line: 247, column: 5, scope: !1711)
!1726 = !DILocation(line: 250, column: 5, scope: !1711)
!1727 = !DILocalVariable(name: "this", arg: 1, scope: !1728, type: !1517, flags: DIFlagArtificial | DIFlagObjectPointer)
!1728 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI6recordSaIS0_EEixEm", scope: !568, file: !48, line: 779, type: !638, isLocal: false, isDefinition: true, scopeLine: 780, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !637, retainedNodes: !1729)
!1729 = !{!1727, !1730}
!1730 = !DILocalVariable(name: "__n", arg: 2, scope: !1728, file: !48, line: 779, type: !363)
!1731 = !DILocation(line: 0, scope: !1728, inlinedAt: !1732)
!1732 = distinct !DILocation(line: 252, column: 16, scope: !1712, inlinedAt: !1695)
!1733 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !1732)
!1734 = !DILocation(line: 253, column: 26, scope: !1712, inlinedAt: !1695)
!1735 = !DILocation(line: 0, scope: !1728, inlinedAt: !1736)
!1736 = distinct !DILocation(line: 253, column: 18, scope: !1712, inlinedAt: !1695)
!1737 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !1736)
!1738 = !DILocation(line: 0, scope: !1728, inlinedAt: !1739)
!1739 = distinct !DILocation(line: 253, column: 5, scope: !1712, inlinedAt: !1695)
!1740 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !1739)
!1741 = !DILocation(line: 253, column: 16, scope: !1712, inlinedAt: !1695)
!1742 = !{i64 0, i64 53, !1743, i64 56, i64 4, !1361}
!1743 = !{!1331, !1331, i64 0}
!1744 = !DILocation(line: 0, scope: !1728, inlinedAt: !1745)
!1745 = distinct !DILocation(line: 254, column: 5, scope: !1712, inlinedAt: !1695)
!1746 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !1745)
!1747 = !DILocation(line: 256, column: 16, scope: !1712, inlinedAt: !1695)
!1748 = !DILocation(line: 243, column: 9, scope: !1679, inlinedAt: !1695)
!1749 = !DILocation(line: 257, column: 20, scope: !1712, inlinedAt: !1695)
!1750 = !DILocation(line: 257, column: 18, scope: !1712, inlinedAt: !1695)
!1751 = !DILocation(line: 258, column: 23, scope: !1712, inlinedAt: !1695)
!1752 = !DILocation(line: 261, column: 27, scope: !1712, inlinedAt: !1695)
!1753 = !DILocation(line: 0, scope: !1728, inlinedAt: !1754)
!1754 = distinct !DILocation(line: 261, column: 5, scope: !1712, inlinedAt: !1695)
!1755 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !1754)
!1756 = !DILocation(line: 261, column: 16, scope: !1712, inlinedAt: !1695)
!1757 = !DILocation(line: 261, column: 25, scope: !1712, inlinedAt: !1695)
!1758 = !{!1759, !1362, i64 56}
!1759 = !{!"_ZTS6record", !1331, i64 0, !1362, i64 56}
!1760 = !DILocation(line: 245, column: 19, scope: !1701, inlinedAt: !1695)
!1761 = distinct !{!1761, !1762, !1763}
!1762 = !DILocation(line: 245, column: 3, scope: !1702)
!1763 = !DILocation(line: 262, column: 3, scope: !1702)
!1764 = !DILocation(line: 173, column: 10, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1366, file: !1, line: 173, column: 9)
!1766 = !DILocation(line: 173, column: 9, scope: !1366)
!1767 = !DILocation(line: 174, column: 5, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1765, file: !1, line: 174, column: 5)
!1769 = !DILocation(line: 0, scope: !1728, inlinedAt: !1770)
!1770 = distinct !DILocation(line: 175, column: 37, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1772, file: !1, line: 174, column: 33)
!1772 = distinct !DILexicalBlock(scope: !1768, file: !1, line: 174, column: 5)
!1773 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !1770)
!1774 = !DILocation(line: 780, column: 32, scope: !1728, inlinedAt: !1770)
!1775 = !DILocation(line: 175, column: 37, scope: !1771)
!1776 = !DILocation(line: 0, scope: !1728, inlinedAt: !1777)
!1777 = distinct !DILocation(line: 175, column: 58, scope: !1771)
!1778 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !1777)
!1779 = !DILocation(line: 175, column: 69, scope: !1771)
!1780 = !DILocation(line: 175, column: 58, scope: !1771)
!1781 = !DILocation(line: 175, column: 7, scope: !1771)
!1782 = !DILocation(line: 174, column: 29, scope: !1772)
!1783 = !DILocation(line: 174, column: 14, scope: !1772)
!1784 = distinct !{!1784, !1767, !1785}
!1785 = !DILocation(line: 176, column: 5, scope: !1768)
!1786 = !DILocation(line: 177, column: 5, scope: !1366)
!1787 = !DILocation(line: 179, column: 11, scope: !1366)
!1788 = !DILocation(line: 179, column: 2, scope: !1366)
!1789 = !DILocation(line: 180, column: 11, scope: !1366)
!1790 = !DILocation(line: 180, column: 2, scope: !1366)
!1791 = !DILocalVariable(name: "this", arg: 1, scope: !1792, type: !1537, flags: DIFlagArtificial | DIFlagObjectPointer)
!1792 = distinct !DISubprogram(name: "~vector", linkageName: "_ZNSt6vectorI7latLongSaIS0_EED2Ev", scope: !366, file: !48, line: 423, type: !370, isLocal: false, isDefinition: true, scopeLine: 424, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !390, retainedNodes: !1793)
!1793 = !{!1791}
!1794 = !DILocation(line: 0, scope: !1792, inlinedAt: !1795)
!1795 = distinct !DILocation(line: 182, column: 1, scope: !1366)
!1796 = !DILocalVariable(name: "this", arg: 1, scope: !1797, type: !1543, flags: DIFlagArtificial | DIFlagObjectPointer)
!1797 = distinct !DISubprogram(name: "~_Vector_base", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev", scope: !212, file: !48, line: 159, type: !335, isLocal: false, isDefinition: true, scopeLine: 160, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !348, retainedNodes: !1798)
!1798 = !{!1796}
!1799 = !DILocation(line: 0, scope: !1797, inlinedAt: !1800)
!1800 = distinct !DILocation(line: 425, column: 33, scope: !1801, inlinedAt: !1795)
!1801 = distinct !DILexicalBlock(scope: !1792, file: !48, line: 424, column: 7)
!1802 = !DILocation(line: 160, column: 37, scope: !1803, inlinedAt: !1800)
!1803 = distinct !DILexicalBlock(scope: !1797, file: !48, line: 160, column: 7)
!1804 = !DILocalVariable(name: "this", arg: 1, scope: !1805, type: !1543, flags: DIFlagArtificial | DIFlagObjectPointer)
!1805 = distinct !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m", scope: !212, file: !48, line: 174, type: !353, isLocal: false, isDefinition: true, scopeLine: 175, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !352, retainedNodes: !1806)
!1806 = !{!1804, !1807, !1808}
!1807 = !DILocalVariable(name: "__p", arg: 2, scope: !1805, file: !48, line: 174, type: !219)
!1808 = !DILocalVariable(name: "__n", arg: 3, scope: !1805, file: !48, line: 174, type: !103)
!1809 = !DILocation(line: 0, scope: !1805, inlinedAt: !1810)
!1810 = distinct !DILocation(line: 160, column: 9, scope: !1803, inlinedAt: !1800)
!1811 = !DILocation(line: 174, column: 29, scope: !1805, inlinedAt: !1810)
!1812 = !DILocation(line: 177, column: 6, scope: !1813, inlinedAt: !1810)
!1813 = distinct !DILexicalBlock(scope: !1805, file: !48, line: 177, column: 6)
!1814 = !DILocation(line: 177, column: 6, scope: !1805, inlinedAt: !1810)
!1815 = !DILocalVariable(name: "__a", arg: 1, scope: !1816, file: !58, line: 184, type: !226)
!1816 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m", scope: !221, file: !58, line: 184, type: !288, isLocal: false, isDefinition: true, scopeLine: 185, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !287, retainedNodes: !1817)
!1817 = !{!1815, !1818, !1819}
!1818 = !DILocalVariable(name: "__p", arg: 2, scope: !1816, file: !58, line: 184, type: !220)
!1819 = !DILocalVariable(name: "__n", arg: 3, scope: !1816, file: !58, line: 184, type: !285)
!1820 = !DILocation(line: 184, column: 36, scope: !1816, inlinedAt: !1821)
!1821 = distinct !DILocation(line: 178, column: 4, scope: !1813, inlinedAt: !1810)
!1822 = !DILocation(line: 184, column: 49, scope: !1816, inlinedAt: !1821)
!1823 = !DILocalVariable(name: "this", arg: 1, scope: !1824, type: !1828, flags: DIFlagArtificial | DIFlagObjectPointer)
!1824 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m", scope: !230, file: !71, line: 109, type: !262, isLocal: false, isDefinition: true, scopeLine: 110, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !261, retainedNodes: !1825)
!1825 = !{!1823, !1826, !1827}
!1826 = !DILocalVariable(name: "__p", arg: 2, scope: !1824, file: !71, line: 109, type: !245)
!1827 = !DILocalVariable(arg: 3, scope: !1824, file: !71, line: 109, type: !102)
!1828 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!1829 = !DILocation(line: 0, scope: !1824, inlinedAt: !1830)
!1830 = distinct !DILocation(line: 185, column: 11, scope: !1816, inlinedAt: !1821)
!1831 = !DILocation(line: 109, column: 26, scope: !1824, inlinedAt: !1830)
!1832 = !DILocation(line: 110, column: 27, scope: !1824, inlinedAt: !1830)
!1833 = !DILocation(line: 110, column: 9, scope: !1824, inlinedAt: !1830)
!1834 = !DILocation(line: 178, column: 4, scope: !1813, inlinedAt: !1810)
!1835 = !DILocalVariable(name: "this", arg: 1, scope: !1836, type: !1517, flags: DIFlagArtificial | DIFlagObjectPointer)
!1836 = distinct !DISubprogram(name: "~vector", linkageName: "_ZNSt6vectorI6recordSaIS0_EED2Ev", scope: !568, file: !48, line: 423, type: !572, isLocal: false, isDefinition: true, scopeLine: 424, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !592, retainedNodes: !1837)
!1837 = !{!1835}
!1838 = !DILocation(line: 0, scope: !1836, inlinedAt: !1839)
!1839 = distinct !DILocation(line: 182, column: 1, scope: !1366)
!1840 = !DILocalVariable(name: "this", arg: 1, scope: !1841, type: !1523, flags: DIFlagArtificial | DIFlagObjectPointer)
!1841 = distinct !DISubprogram(name: "~_Vector_base", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev", scope: !49, file: !48, line: 159, type: !182, isLocal: false, isDefinition: true, scopeLine: 160, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !195, retainedNodes: !1842)
!1842 = !{!1840}
!1843 = !DILocation(line: 0, scope: !1841, inlinedAt: !1844)
!1844 = distinct !DILocation(line: 425, column: 33, scope: !1845, inlinedAt: !1839)
!1845 = distinct !DILexicalBlock(scope: !1836, file: !48, line: 424, column: 7)
!1846 = !DILocation(line: 160, column: 37, scope: !1847, inlinedAt: !1844)
!1847 = distinct !DILexicalBlock(scope: !1841, file: !48, line: 160, column: 7)
!1848 = !DILocalVariable(name: "this", arg: 1, scope: !1849, type: !1523, flags: DIFlagArtificial | DIFlagObjectPointer)
!1849 = distinct !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m", scope: !49, file: !48, line: 174, type: !200, isLocal: false, isDefinition: true, scopeLine: 175, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !199, retainedNodes: !1850)
!1850 = !{!1848, !1851, !1852}
!1851 = !DILocalVariable(name: "__p", arg: 2, scope: !1849, file: !48, line: 174, type: !56)
!1852 = !DILocalVariable(name: "__n", arg: 3, scope: !1849, file: !48, line: 174, type: !103)
!1853 = !DILocation(line: 0, scope: !1849, inlinedAt: !1854)
!1854 = distinct !DILocation(line: 160, column: 9, scope: !1847, inlinedAt: !1844)
!1855 = !DILocation(line: 174, column: 29, scope: !1849, inlinedAt: !1854)
!1856 = !DILocation(line: 177, column: 6, scope: !1857, inlinedAt: !1854)
!1857 = distinct !DILexicalBlock(scope: !1849, file: !48, line: 177, column: 6)
!1858 = !DILocation(line: 177, column: 6, scope: !1849, inlinedAt: !1854)
!1859 = !DILocalVariable(name: "__a", arg: 1, scope: !1860, file: !58, line: 184, type: !65)
!1860 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m", scope: !59, file: !58, line: 184, type: !135, isLocal: false, isDefinition: true, scopeLine: 185, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !134, retainedNodes: !1861)
!1861 = !{!1859, !1862, !1863}
!1862 = !DILocalVariable(name: "__p", arg: 2, scope: !1860, file: !58, line: 184, type: !57)
!1863 = !DILocalVariable(name: "__n", arg: 3, scope: !1860, file: !58, line: 184, type: !132)
!1864 = !DILocation(line: 184, column: 36, scope: !1860, inlinedAt: !1865)
!1865 = distinct !DILocation(line: 178, column: 4, scope: !1857, inlinedAt: !1854)
!1866 = !DILocation(line: 184, column: 49, scope: !1860, inlinedAt: !1865)
!1867 = !DILocalVariable(name: "this", arg: 1, scope: !1868, type: !1872, flags: DIFlagArtificial | DIFlagObjectPointer)
!1868 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m", scope: !70, file: !71, line: 109, type: !109, isLocal: false, isDefinition: true, scopeLine: 110, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !108, retainedNodes: !1869)
!1869 = !{!1867, !1870, !1871}
!1870 = !DILocalVariable(name: "__p", arg: 2, scope: !1868, file: !71, line: 109, type: !86)
!1871 = !DILocalVariable(arg: 3, scope: !1868, file: !71, line: 109, type: !102)
!1872 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!1873 = !DILocation(line: 0, scope: !1868, inlinedAt: !1874)
!1874 = distinct !DILocation(line: 185, column: 11, scope: !1860, inlinedAt: !1865)
!1875 = !DILocation(line: 109, column: 26, scope: !1868, inlinedAt: !1874)
!1876 = !DILocation(line: 110, column: 27, scope: !1868, inlinedAt: !1874)
!1877 = !DILocation(line: 110, column: 9, scope: !1868, inlinedAt: !1874)
!1878 = !DILocation(line: 178, column: 4, scope: !1857, inlinedAt: !1854)
!1879 = !DILocation(line: 182, column: 1, scope: !1599)
!1880 = !DILocation(line: 182, column: 1, scope: !1560)
!1881 = !DILocation(line: 0, scope: !1792, inlinedAt: !1882)
!1882 = distinct !DILocation(line: 182, column: 1, scope: !1366)
!1883 = !DILocation(line: 0, scope: !1797, inlinedAt: !1884)
!1884 = distinct !DILocation(line: 425, column: 33, scope: !1801, inlinedAt: !1882)
!1885 = !DILocation(line: 160, column: 37, scope: !1803, inlinedAt: !1884)
!1886 = !DILocation(line: 0, scope: !1805, inlinedAt: !1887)
!1887 = distinct !DILocation(line: 160, column: 9, scope: !1803, inlinedAt: !1884)
!1888 = !DILocation(line: 174, column: 29, scope: !1805, inlinedAt: !1887)
!1889 = !DILocation(line: 177, column: 6, scope: !1813, inlinedAt: !1887)
!1890 = !DILocation(line: 177, column: 6, scope: !1805, inlinedAt: !1887)
!1891 = !DILocation(line: 184, column: 36, scope: !1816, inlinedAt: !1892)
!1892 = distinct !DILocation(line: 178, column: 4, scope: !1813, inlinedAt: !1887)
!1893 = !DILocation(line: 184, column: 49, scope: !1816, inlinedAt: !1892)
!1894 = !DILocation(line: 0, scope: !1824, inlinedAt: !1895)
!1895 = distinct !DILocation(line: 185, column: 11, scope: !1816, inlinedAt: !1892)
!1896 = !DILocation(line: 109, column: 26, scope: !1824, inlinedAt: !1895)
!1897 = !DILocation(line: 110, column: 27, scope: !1824, inlinedAt: !1895)
!1898 = !DILocation(line: 110, column: 9, scope: !1824, inlinedAt: !1895)
!1899 = !DILocation(line: 178, column: 4, scope: !1813, inlinedAt: !1887)
!1900 = !DILocation(line: 0, scope: !1836, inlinedAt: !1901)
!1901 = distinct !DILocation(line: 182, column: 1, scope: !1366)
!1902 = !DILocation(line: 0, scope: !1841, inlinedAt: !1903)
!1903 = distinct !DILocation(line: 425, column: 33, scope: !1845, inlinedAt: !1901)
!1904 = !DILocation(line: 160, column: 37, scope: !1847, inlinedAt: !1903)
!1905 = !DILocation(line: 0, scope: !1849, inlinedAt: !1906)
!1906 = distinct !DILocation(line: 160, column: 9, scope: !1847, inlinedAt: !1903)
!1907 = !DILocation(line: 174, column: 29, scope: !1849, inlinedAt: !1906)
!1908 = !DILocation(line: 177, column: 6, scope: !1857, inlinedAt: !1906)
!1909 = !DILocation(line: 177, column: 6, scope: !1849, inlinedAt: !1906)
!1910 = !DILocation(line: 184, column: 36, scope: !1860, inlinedAt: !1911)
!1911 = distinct !DILocation(line: 178, column: 4, scope: !1857, inlinedAt: !1906)
!1912 = !DILocation(line: 184, column: 49, scope: !1860, inlinedAt: !1911)
!1913 = !DILocation(line: 0, scope: !1868, inlinedAt: !1914)
!1914 = distinct !DILocation(line: 185, column: 11, scope: !1860, inlinedAt: !1911)
!1915 = !DILocation(line: 109, column: 26, scope: !1868, inlinedAt: !1914)
!1916 = !DILocation(line: 110, column: 27, scope: !1868, inlinedAt: !1914)
!1917 = !DILocation(line: 110, column: 9, scope: !1868, inlinedAt: !1914)
!1918 = !DILocation(line: 178, column: 4, scope: !1857, inlinedAt: !1906)
!1919 = distinct !DISubprogram(name: "parseCommandline", linkageName: "_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_", scope: !1, file: !1, line: 265, type: !1920, isLocal: false, isDefinition: true, scopeLine: 266, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !1922)
!1920 = !DISubroutineType(types: !1921)
!1921 = !{!45, !45, !43, !44, !830, !40, !40, !830, !830, !830, !830}
!1922 = !{!1923, !1924, !1925, !1926, !1927, !1928, !1929, !1930, !1931, !1932, !1933, !1934}
!1923 = !DILocalVariable(name: "argc", arg: 1, scope: !1919, file: !1, line: 265, type: !45)
!1924 = !DILocalVariable(name: "argv", arg: 2, scope: !1919, file: !1, line: 265, type: !43)
!1925 = !DILocalVariable(name: "filename", arg: 3, scope: !1919, file: !1, line: 265, type: !44)
!1926 = !DILocalVariable(name: "r", arg: 4, scope: !1919, file: !1, line: 265, type: !830)
!1927 = !DILocalVariable(name: "lat", arg: 5, scope: !1919, file: !1, line: 265, type: !40)
!1928 = !DILocalVariable(name: "lng", arg: 6, scope: !1919, file: !1, line: 265, type: !40)
!1929 = !DILocalVariable(name: "q", arg: 7, scope: !1919, file: !1, line: 266, type: !830)
!1930 = !DILocalVariable(name: "t", arg: 8, scope: !1919, file: !1, line: 266, type: !830)
!1931 = !DILocalVariable(name: "p", arg: 9, scope: !1919, file: !1, line: 266, type: !830)
!1932 = !DILocalVariable(name: "d", arg: 10, scope: !1919, file: !1, line: 266, type: !830)
!1933 = !DILocalVariable(name: "i", scope: !1919, file: !1, line: 267, type: !45)
!1934 = !DILocalVariable(name: "flag", scope: !1919, file: !1, line: 270, type: !34)
!1935 = !DILocation(line: 265, column: 26, scope: !1919)
!1936 = !DILocation(line: 265, column: 38, scope: !1919)
!1937 = !DILocation(line: 265, column: 52, scope: !1919)
!1938 = !DILocation(line: 265, column: 66, scope: !1919)
!1939 = !DILocation(line: 265, column: 75, scope: !1919)
!1940 = !DILocation(line: 265, column: 86, scope: !1919)
!1941 = !DILocation(line: 266, column: 27, scope: !1919)
!1942 = !DILocation(line: 266, column: 35, scope: !1919)
!1943 = !DILocation(line: 266, column: 43, scope: !1919)
!1944 = !DILocation(line: 266, column: 51, scope: !1919)
!1945 = !DILocation(line: 268, column: 14, scope: !1946)
!1946 = distinct !DILexicalBlock(scope: !1919, file: !1, line: 268, column: 9)
!1947 = !DILocation(line: 268, column: 9, scope: !1919)
!1948 = !DILocation(line: 269, column: 22, scope: !1919)
!1949 = !DILocation(line: 269, column: 5, scope: !1919)
!1950 = !DILocation(line: 267, column: 9, scope: !1919)
!1951 = !DILocation(line: 273, column: 11, scope: !1952)
!1952 = distinct !DILexicalBlock(scope: !1953, file: !1, line: 273, column: 11)
!1953 = distinct !DILexicalBlock(scope: !1954, file: !1, line: 272, column: 25)
!1954 = distinct !DILexicalBlock(scope: !1955, file: !1, line: 272, column: 5)
!1955 = distinct !DILexicalBlock(scope: !1919, file: !1, line: 272, column: 5)
!1956 = !DILocation(line: 273, column: 21, scope: !1952)
!1957 = !DILocation(line: 273, column: 11, scope: !1953)
!1958 = !DILocation(line: 274, column: 16, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1952, file: !1, line: 273, column: 28)
!1960 = !DILocation(line: 270, column: 10, scope: !1919)
!1961 = !DILocation(line: 275, column: 19, scope: !1959)
!1962 = !DILocation(line: 275, column: 11, scope: !1959)
!1963 = !DILocation(line: 277, column: 16, scope: !1964)
!1964 = distinct !DILexicalBlock(scope: !1959, file: !1, line: 275, column: 25)
!1965 = !DILocation(line: 278, column: 25, scope: !1964)
!1966 = !DILocation(line: 278, column: 1, scope: !1030, inlinedAt: !1967)
!1967 = distinct !DILocation(line: 278, column: 20, scope: !1964)
!1968 = !DILocation(line: 280, column: 16, scope: !1030, inlinedAt: !1967)
!1969 = !DILocation(line: 278, column: 18, scope: !1964)
!1970 = !DILocation(line: 279, column: 15, scope: !1964)
!1971 = !DILocation(line: 281, column: 19, scope: !1972)
!1972 = distinct !DILexicalBlock(scope: !1964, file: !1, line: 281, column: 19)
!1973 = !DILocation(line: 281, column: 29, scope: !1972)
!1974 = !DILocation(line: 0, scope: !1975)
!1975 = distinct !DILexicalBlock(scope: !1972, file: !1, line: 284, column: 20)
!1976 = !DILocation(line: 26, column: 1, scope: !1025, inlinedAt: !1977)
!1977 = distinct !DILocation(line: 0, scope: !1975)
!1978 = !DILocation(line: 28, column: 10, scope: !1025, inlinedAt: !1977)
!1979 = !DILocation(line: 281, column: 19, scope: !1964)
!1980 = !DILocation(line: 282, column: 22, scope: !1981)
!1981 = distinct !DILexicalBlock(scope: !1972, file: !1, line: 281, column: 36)
!1982 = !DILocation(line: 283, column: 15, scope: !1981)
!1983 = !DILocation(line: 285, column: 22, scope: !1975)
!1984 = !DILocation(line: 292, column: 18, scope: !1964)
!1985 = !DILocation(line: 293, column: 15, scope: !1964)
!1986 = !DILocation(line: 295, column: 18, scope: !1964)
!1987 = !DILocation(line: 296, column: 15, scope: !1964)
!1988 = !DILocation(line: 298, column: 16, scope: !1964)
!1989 = !DILocation(line: 299, column: 25, scope: !1964)
!1990 = !DILocation(line: 278, column: 1, scope: !1030, inlinedAt: !1991)
!1991 = distinct !DILocation(line: 299, column: 20, scope: !1964)
!1992 = !DILocation(line: 280, column: 16, scope: !1030, inlinedAt: !1991)
!1993 = !DILocation(line: 299, column: 18, scope: !1964)
!1994 = !DILocation(line: 300, column: 15, scope: !1964)
!1995 = !DILocation(line: 302, column: 16, scope: !1964)
!1996 = !DILocation(line: 303, column: 25, scope: !1964)
!1997 = !DILocation(line: 278, column: 1, scope: !1030, inlinedAt: !1998)
!1998 = distinct !DILocation(line: 303, column: 20, scope: !1964)
!1999 = !DILocation(line: 280, column: 16, scope: !1030, inlinedAt: !1998)
!2000 = !DILocation(line: 303, column: 18, scope: !1964)
!2001 = !DILocation(line: 304, column: 15, scope: !1964)
!2002 = !DILocation(line: 0, scope: !1955)
!2003 = !DILocation(line: 272, column: 21, scope: !1954)
!2004 = !DILocation(line: 272, column: 14, scope: !1954)
!2005 = !DILocation(line: 272, column: 5, scope: !1955)
!2006 = distinct !{!2006, !2005, !2007}
!2007 = !DILocation(line: 307, column: 5, scope: !1955)
!2008 = !DILocation(line: 308, column: 10, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !1919, file: !1, line: 308, column: 9)
!2010 = !DILocation(line: 308, column: 13, scope: !2009)
!2011 = !DILocation(line: 0, scope: !2009)
!2012 = !DILocation(line: 308, column: 18, scope: !2009)
!2013 = !DILocation(line: 308, column: 23, scope: !2009)
!2014 = !DILocation(line: 308, column: 27, scope: !2009)
!2015 = !DILocation(line: 308, column: 33, scope: !2009)
!2016 = !DILocation(line: 308, column: 37, scope: !2009)
!2017 = !DILocation(line: 310, column: 5, scope: !1919)
!2018 = !DILocation(line: 0, scope: !1964)
!2019 = !DILocation(line: 311, column: 1, scope: !1919)
!2020 = distinct !DISubprogram(name: "printUsage", linkageName: "_Z10printUsagev", scope: !1, file: !1, line: 313, type: !1013, isLocal: false, isDefinition: true, scopeLine: 313, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !16)
!2021 = !DILocation(line: 314, column: 3, scope: !2020)
!2022 = !DILocation(line: 315, column: 3, scope: !2020)
!2023 = !DILocation(line: 316, column: 3, scope: !2020)
!2024 = !DILocation(line: 317, column: 3, scope: !2020)
!2025 = !DILocation(line: 318, column: 3, scope: !2020)
!2026 = !DILocation(line: 319, column: 3, scope: !2020)
!2027 = !DILocation(line: 320, column: 3, scope: !2020)
!2028 = !DILocation(line: 321, column: 3, scope: !2020)
!2029 = !DILocation(line: 322, column: 3, scope: !2020)
!2030 = !DILocation(line: 323, column: 3, scope: !2020)
!2031 = !DILocation(line: 324, column: 3, scope: !2020)
!2032 = !DILocation(line: 325, column: 3, scope: !2020)
!2033 = !DILocation(line: 326, column: 3, scope: !2020)
!2034 = !DILocation(line: 327, column: 3, scope: !2020)
!2035 = !DILocation(line: 328, column: 3, scope: !2020)
!2036 = !DILocation(line: 329, column: 3, scope: !2020)
!2037 = !DILocation(line: 330, column: 3, scope: !2020)
!2038 = !DILocation(line: 331, column: 3, scope: !2020)
!2039 = !DILocation(line: 332, column: 3, scope: !2020)
!2040 = !DILocation(line: 333, column: 3, scope: !2020)
!2041 = !DILocation(line: 334, column: 3, scope: !2020)
!2042 = !DILocation(line: 335, column: 3, scope: !2020)
!2043 = !DILocation(line: 336, column: 3, scope: !2020)
!2044 = !DILocation(line: 337, column: 1, scope: !2020)
!2045 = distinct !DISubprogram(name: "loadData", linkageName: "_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE", scope: !1, file: !1, line: 184, type: !2046, isLocal: false, isDefinition: true, scopeLine: 184, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !2048)
!2046 = !DISubroutineType(types: !2047)
!2047 = !{!45, !44, !596, !394}
!2048 = !{!2049, !2050, !2051, !2052, !2103, !2104, !2105, !2109, !2110, !2113, !2114}
!2049 = !DILocalVariable(name: "filename", arg: 1, scope: !2045, file: !1, line: 184, type: !44)
!2050 = !DILocalVariable(name: "records", arg: 2, scope: !2045, file: !1, line: 184, type: !596)
!2051 = !DILocalVariable(name: "locations", arg: 3, scope: !2045, file: !1, line: 184, type: !394)
!2052 = !DILocalVariable(name: "flist", scope: !2045, file: !1, line: 185, type: !2053)
!2053 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2054, size: 64)
!2054 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !2055, line: 48, baseType: !2056)
!2055 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!2056 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !2057, line: 241, size: 1728, flags: DIFlagTypePassByValue, elements: !2058, identifier: "_ZTS8_IO_FILE")
!2057 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!2058 = !{!2059, !2060, !2061, !2062, !2063, !2064, !2065, !2066, !2067, !2068, !2069, !2070, !2071, !2074, !2076, !2077, !2078, !2080, !2082, !2084, !2088, !2091, !2093, !2094, !2095, !2096, !2097, !2098, !2099}
!2059 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !2056, file: !2057, line: 242, baseType: !45, size: 32)
!2060 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !2056, file: !2057, line: 247, baseType: !44, size: 64, offset: 64)
!2061 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !2056, file: !2057, line: 248, baseType: !44, size: 64, offset: 128)
!2062 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !2056, file: !2057, line: 249, baseType: !44, size: 64, offset: 192)
!2063 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !2056, file: !2057, line: 250, baseType: !44, size: 64, offset: 256)
!2064 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !2056, file: !2057, line: 251, baseType: !44, size: 64, offset: 320)
!2065 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !2056, file: !2057, line: 252, baseType: !44, size: 64, offset: 384)
!2066 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !2056, file: !2057, line: 253, baseType: !44, size: 64, offset: 448)
!2067 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !2056, file: !2057, line: 254, baseType: !44, size: 64, offset: 512)
!2068 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !2056, file: !2057, line: 256, baseType: !44, size: 64, offset: 576)
!2069 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !2056, file: !2057, line: 257, baseType: !44, size: 64, offset: 640)
!2070 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !2056, file: !2057, line: 258, baseType: !44, size: 64, offset: 704)
!2071 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !2056, file: !2057, line: 260, baseType: !2072, size: 64, offset: 768)
!2072 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2073, size: 64)
!2073 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !2057, line: 156, flags: DIFlagFwdDecl, identifier: "_ZTS10_IO_marker")
!2074 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !2056, file: !2057, line: 262, baseType: !2075, size: 64, offset: 832)
!2075 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2056, size: 64)
!2076 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !2056, file: !2057, line: 264, baseType: !45, size: 32, offset: 896)
!2077 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !2056, file: !2057, line: 268, baseType: !45, size: 32, offset: 928)
!2078 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !2056, file: !2057, line: 270, baseType: !2079, size: 64, offset: 960)
!2079 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !1319, line: 131, baseType: !552)
!2080 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !2056, file: !2057, line: 274, baseType: !2081, size: 16, offset: 1024)
!2081 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!2082 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !2056, file: !2057, line: 275, baseType: !2083, size: 8, offset: 1040)
!2083 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!2084 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !2056, file: !2057, line: 276, baseType: !2085, size: 8, offset: 1048)
!2085 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 8, elements: !2086)
!2086 = !{!2087}
!2087 = !DISubrange(count: 1)
!2088 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !2056, file: !2057, line: 280, baseType: !2089, size: 64, offset: 1088)
!2089 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2090, size: 64)
!2090 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !2057, line: 150, baseType: null)
!2091 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !2056, file: !2057, line: 289, baseType: !2092, size: 64, offset: 1152)
!2092 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !1319, line: 132, baseType: !552)
!2093 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !2056, file: !2057, line: 297, baseType: !42, size: 64, offset: 1216)
!2094 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !2056, file: !2057, line: 298, baseType: !42, size: 64, offset: 1280)
!2095 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !2056, file: !2057, line: 299, baseType: !42, size: 64, offset: 1344)
!2096 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !2056, file: !2057, line: 300, baseType: !42, size: 64, offset: 1408)
!2097 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !2056, file: !2057, line: 302, baseType: !1044, size: 64, offset: 1472)
!2098 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !2056, file: !2057, line: 303, baseType: !45, size: 32, offset: 1536)
!2099 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !2056, file: !2057, line: 305, baseType: !2100, size: 160, offset: 1568)
!2100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 160, elements: !2101)
!2101 = !{!2102}
!2102 = !DISubrange(count: 20)
!2103 = !DILocalVariable(name: "fp", scope: !2045, file: !1, line: 185, type: !2053)
!2104 = !DILocalVariable(name: "i", scope: !2045, file: !1, line: 186, type: !45)
!2105 = !DILocalVariable(name: "dbname", scope: !2045, file: !1, line: 187, type: !2106)
!2106 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 512, elements: !2107)
!2107 = !{!2108}
!2108 = !DISubrange(count: 64)
!2109 = !DILocalVariable(name: "recNum", scope: !2045, file: !1, line: 188, type: !45)
!2110 = !DILocalVariable(name: "record", scope: !2111, file: !1, line: 210, type: !1692)
!2111 = distinct !DILexicalBlock(scope: !2112, file: !1, line: 209, column: 25)
!2112 = distinct !DILexicalBlock(scope: !2045, file: !1, line: 193, column: 22)
!2113 = !DILocalVariable(name: "latLong", scope: !2111, file: !1, line: 211, type: !1346)
!2114 = !DILocalVariable(name: "substr", scope: !2111, file: !1, line: 217, type: !2115)
!2115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 48, elements: !2116)
!2116 = !{!2117}
!2117 = !DISubrange(count: 6)
!2118 = !DILocation(line: 184, column: 20, scope: !2045)
!2119 = !DILocation(line: 184, column: 50, scope: !2045)
!2120 = !DILocation(line: 184, column: 80, scope: !2045)
!2121 = !DILocation(line: 186, column: 9, scope: !2045)
!2122 = !DILocation(line: 187, column: 2, scope: !2045)
!2123 = !DILocation(line: 187, column: 7, scope: !2045)
!2124 = !DILocation(line: 188, column: 6, scope: !2045)
!2125 = !DILocation(line: 192, column: 13, scope: !2045)
!2126 = !DILocation(line: 185, column: 13, scope: !2045)
!2127 = !DILocation(line: 193, column: 9, scope: !2045)
!2128 = !DILocation(line: 193, column: 2, scope: !2045)
!2129 = !DILocation(line: 199, column: 6, scope: !2130)
!2130 = distinct !DILexicalBlock(scope: !2112, file: !1, line: 199, column: 6)
!2131 = !DILocation(line: 199, column: 36, scope: !2130)
!2132 = !DILocation(line: 199, column: 6, scope: !2112)
!2133 = !DILocation(line: 200, column: 21, scope: !2134)
!2134 = distinct !DILexicalBlock(scope: !2130, file: !1, line: 199, column: 42)
!2135 = !DILocation(line: 200, column: 13, scope: !2134)
!2136 = !DILocation(line: 201, column: 13, scope: !2134)
!2137 = !DILocation(line: 203, column: 14, scope: !2112)
!2138 = !DILocation(line: 185, column: 20, scope: !2045)
!2139 = !DILocation(line: 204, column: 13, scope: !2140)
!2140 = distinct !DILexicalBlock(scope: !2112, file: !1, line: 204, column: 12)
!2141 = !DILocation(line: 204, column: 12, scope: !2112)
!2142 = !DILocation(line: 209, column: 16, scope: !2112)
!2143 = !DILocation(line: 209, column: 9, scope: !2112)
!2144 = !DILocation(line: 205, column: 13, scope: !2145)
!2145 = distinct !DILexicalBlock(scope: !2140, file: !1, line: 204, column: 17)
!2146 = !DILocation(line: 206, column: 13, scope: !2145)
!2147 = !DILocation(line: 210, column: 13, scope: !2111)
!2148 = !DILocation(line: 211, column: 21, scope: !2111)
!2149 = !DILocalVariable(name: "__x", arg: 2, scope: !2150, file: !48, line: 913, type: !382)
!2150 = distinct !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_", scope: !366, file: !48, line: 913, type: !473, isLocal: false, isDefinition: true, scopeLine: 914, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !472, retainedNodes: !2151)
!2151 = !{!2152, !2149}
!2152 = !DILocalVariable(name: "this", arg: 1, scope: !2150, type: !1537, flags: DIFlagArtificial | DIFlagObjectPointer)
!2153 = !DILocation(line: 913, column: 35, scope: !2150, inlinedAt: !2154)
!2154 = distinct !DILocation(line: 227, column: 23, scope: !2111)
!2155 = !DILocalVariable(name: "__arg", arg: 3, scope: !2156, file: !58, line: 188, type: !257)
!2156 = distinct !DISubprogram(name: "construct<latLong>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_", scope: !221, file: !58, line: 188, type: !2157, isLocal: false, isDefinition: true, scopeLine: 189, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !273, declaration: !2159, retainedNodes: !2160)
!2157 = !DISubroutineType(types: !2158)
!2158 = !{null, !226, !220, !257}
!2159 = !DISubprogram(name: "construct<latLong>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_", scope: !221, file: !58, line: 188, type: !2157, isLocal: false, isDefinition: false, scopeLine: 188, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true, templateParams: !273)
!2160 = !{!2161, !2162, !2155}
!2161 = !DILocalVariable(name: "__a", arg: 1, scope: !2156, file: !58, line: 188, type: !226)
!2162 = !DILocalVariable(name: "__p", arg: 2, scope: !2156, file: !58, line: 188, type: !220)
!2163 = !DILocation(line: 188, column: 66, scope: !2156, inlinedAt: !2164)
!2164 = distinct !DILocation(line: 917, column: 6, scope: !2165, inlinedAt: !2154)
!2165 = distinct !DILexicalBlock(scope: !2166, file: !48, line: 916, column: 4)
!2166 = distinct !DILexicalBlock(scope: !2150, file: !48, line: 915, column: 6)
!2167 = !DILocalVariable(name: "__val", arg: 3, scope: !2168, file: !71, line: 129, type: !257)
!2168 = distinct !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_", scope: !230, file: !71, line: 129, type: !268, isLocal: false, isDefinition: true, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !267, retainedNodes: !2169)
!2169 = !{!2170, !2171, !2167}
!2170 = !DILocalVariable(name: "this", arg: 1, scope: !2168, type: !1828, flags: DIFlagArtificial | DIFlagObjectPointer)
!2171 = !DILocalVariable(name: "__p", arg: 2, scope: !2168, file: !71, line: 129, type: !245)
!2172 = !DILocation(line: 129, column: 41, scope: !2168, inlinedAt: !2173)
!2173 = distinct !DILocation(line: 189, column: 13, scope: !2156, inlinedAt: !2164)
!2174 = !DILocation(line: 211, column: 13, scope: !2111)
!2175 = !DILocation(line: 212, column: 13, scope: !2111)
!2176 = !DILocation(line: 213, column: 13, scope: !2111)
!2177 = !DILocation(line: 214, column: 17, scope: !2178)
!2178 = distinct !DILexicalBlock(scope: !2111, file: !1, line: 214, column: 17)
!2179 = !DILocation(line: 214, column: 17, scope: !2111)
!2180 = !DILocation(line: 230, column: 9, scope: !2112)
!2181 = !DILocation(line: 217, column: 13, scope: !2111)
!2182 = !DILocation(line: 217, column: 18, scope: !2111)
!2183 = !DILocation(line: 219, column: 40, scope: !2184)
!2184 = distinct !DILexicalBlock(scope: !2185, file: !1, line: 219, column: 13)
!2185 = distinct !DILexicalBlock(scope: !2111, file: !1, line: 219, column: 13)
!2186 = !DILocation(line: 220, column: 23, scope: !2111)
!2187 = !DILocation(line: 26, column: 1, scope: !1025, inlinedAt: !2188)
!2188 = distinct !DILocation(line: 221, column: 27, scope: !2111)
!2189 = !DILocation(line: 28, column: 10, scope: !1025, inlinedAt: !2188)
!2190 = !DILocation(line: 221, column: 27, scope: !2111)
!2191 = !DILocation(line: 221, column: 25, scope: !2111)
!2192 = !{!2193, !1362, i64 0}
!2193 = !{!"_ZTS7latLong", !1362, i64 0, !1362, i64 4}
!2194 = !DILocation(line: 223, column: 40, scope: !2195)
!2195 = distinct !DILexicalBlock(scope: !2196, file: !1, line: 223, column: 13)
!2196 = distinct !DILexicalBlock(scope: !2111, file: !1, line: 223, column: 13)
!2197 = !DILocation(line: 224, column: 23, scope: !2111)
!2198 = !DILocation(line: 26, column: 1, scope: !1025, inlinedAt: !2199)
!2199 = distinct !DILocation(line: 225, column: 27, scope: !2111)
!2200 = !DILocation(line: 28, column: 10, scope: !1025, inlinedAt: !2199)
!2201 = !DILocation(line: 225, column: 27, scope: !2111)
!2202 = !DILocation(line: 225, column: 25, scope: !2111)
!2203 = !{!2193, !1362, i64 4}
!2204 = !DILocation(line: 0, scope: !2150, inlinedAt: !2154)
!2205 = !DILocation(line: 915, column: 20, scope: !2166, inlinedAt: !2154)
!2206 = !{!1630, !1355, i64 8}
!2207 = !DILocation(line: 915, column: 47, scope: !2166, inlinedAt: !2154)
!2208 = !{!1630, !1355, i64 16}
!2209 = !DILocation(line: 915, column: 30, scope: !2166, inlinedAt: !2154)
!2210 = !DILocation(line: 915, column: 6, scope: !2150, inlinedAt: !2154)
!2211 = !DILocation(line: 188, column: 37, scope: !2156, inlinedAt: !2164)
!2212 = !DILocation(line: 188, column: 50, scope: !2156, inlinedAt: !2164)
!2213 = !DILocation(line: 0, scope: !2168, inlinedAt: !2173)
!2214 = !DILocation(line: 129, column: 25, scope: !2168, inlinedAt: !2173)
!2215 = !DILocation(line: 130, column: 28, scope: !2168, inlinedAt: !2173)
!2216 = !DILocation(line: 919, column: 6, scope: !2165, inlinedAt: !2154)
!2217 = !DILocation(line: 920, column: 4, scope: !2165, inlinedAt: !2154)
!2218 = !DILocation(line: 925, column: 4, scope: !2166, inlinedAt: !2154)
!2219 = !DILocation(line: 210, column: 20, scope: !2111)
!2220 = !DILocalVariable(name: "this", arg: 1, scope: !2221, type: !1517, flags: DIFlagArtificial | DIFlagObjectPointer)
!2221 = distinct !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_", scope: !568, file: !48, line: 913, type: !673, isLocal: false, isDefinition: true, scopeLine: 914, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !672, retainedNodes: !2222)
!2222 = !{!2220, !2223}
!2223 = !DILocalVariable(name: "__x", arg: 2, scope: !2221, file: !48, line: 913, type: !584)
!2224 = !DILocation(line: 0, scope: !2221, inlinedAt: !2225)
!2225 = distinct !DILocation(line: 228, column: 21, scope: !2111)
!2226 = !DILocation(line: 913, column: 35, scope: !2221, inlinedAt: !2225)
!2227 = !DILocation(line: 915, column: 20, scope: !2228, inlinedAt: !2225)
!2228 = distinct !DILexicalBlock(scope: !2221, file: !48, line: 915, column: 6)
!2229 = !{!1705, !1355, i64 8}
!2230 = !DILocation(line: 915, column: 47, scope: !2228, inlinedAt: !2225)
!2231 = !{!1705, !1355, i64 16}
!2232 = !DILocation(line: 915, column: 30, scope: !2228, inlinedAt: !2225)
!2233 = !DILocation(line: 915, column: 6, scope: !2221, inlinedAt: !2225)
!2234 = !DILocalVariable(name: "__a", arg: 1, scope: !2235, file: !58, line: 188, type: !65)
!2235 = distinct !DISubprogram(name: "construct<record>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_", scope: !59, file: !58, line: 188, type: !2236, isLocal: false, isDefinition: true, scopeLine: 189, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !120, declaration: !2238, retainedNodes: !2239)
!2236 = !DISubroutineType(types: !2237)
!2237 = !{null, !65, !57, !98}
!2238 = !DISubprogram(name: "construct<record>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_", scope: !59, file: !58, line: 188, type: !2236, isLocal: false, isDefinition: false, scopeLine: 188, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true, templateParams: !120)
!2239 = !{!2234, !2240, !2241}
!2240 = !DILocalVariable(name: "__p", arg: 2, scope: !2235, file: !58, line: 188, type: !57)
!2241 = !DILocalVariable(name: "__arg", arg: 3, scope: !2235, file: !58, line: 188, type: !98)
!2242 = !DILocation(line: 188, column: 37, scope: !2235, inlinedAt: !2243)
!2243 = distinct !DILocation(line: 917, column: 6, scope: !2244, inlinedAt: !2225)
!2244 = distinct !DILexicalBlock(scope: !2228, file: !48, line: 916, column: 4)
!2245 = !DILocation(line: 188, column: 50, scope: !2235, inlinedAt: !2243)
!2246 = !DILocation(line: 188, column: 66, scope: !2235, inlinedAt: !2243)
!2247 = !DILocalVariable(name: "this", arg: 1, scope: !2248, type: !1872, flags: DIFlagArtificial | DIFlagObjectPointer)
!2248 = distinct !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_", scope: !70, file: !71, line: 129, type: !115, isLocal: false, isDefinition: true, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !114, retainedNodes: !2249)
!2249 = !{!2247, !2250, !2251}
!2250 = !DILocalVariable(name: "__p", arg: 2, scope: !2248, file: !71, line: 129, type: !86)
!2251 = !DILocalVariable(name: "__val", arg: 3, scope: !2248, file: !71, line: 129, type: !98)
!2252 = !DILocation(line: 0, scope: !2248, inlinedAt: !2253)
!2253 = distinct !DILocation(line: 189, column: 13, scope: !2235, inlinedAt: !2243)
!2254 = !DILocation(line: 129, column: 25, scope: !2248, inlinedAt: !2253)
!2255 = !DILocation(line: 129, column: 41, scope: !2248, inlinedAt: !2253)
!2256 = !DILocation(line: 130, column: 23, scope: !2248, inlinedAt: !2253)
!2257 = !DILocation(line: 130, column: 28, scope: !2248, inlinedAt: !2253)
!2258 = !DILocation(line: 919, column: 6, scope: !2244, inlinedAt: !2225)
!2259 = !DILocation(line: 920, column: 4, scope: !2244, inlinedAt: !2225)
!2260 = !DILocation(line: 925, column: 4, scope: !2228, inlinedAt: !2225)
!2261 = !DILocation(line: 229, column: 19, scope: !2111)
!2262 = !DILocation(line: 231, column: 9, scope: !2112)
!2263 = distinct !{!2263, !2128, !2264}
!2264 = !DILocation(line: 232, column: 5, scope: !2045)
!2265 = !DILocation(line: 233, column: 5, scope: !2045)
!2266 = !DILocation(line: 236, column: 1, scope: !2045)
!2267 = !DILocation(line: 235, column: 5, scope: !2045)
!2268 = !DILocation(line: 238, column: 38, scope: !1679)
!2269 = !DILocation(line: 238, column: 53, scope: !1679)
!2270 = !DILocation(line: 238, column: 67, scope: !1679)
!2271 = !DILocation(line: 238, column: 82, scope: !1679)
!2272 = !DILocation(line: 239, column: 7, scope: !1679)
!2273 = !DILocation(line: 245, column: 12, scope: !1701)
!2274 = !DILocation(line: 239, column: 9, scope: !1679)
!2275 = !DILocation(line: 241, column: 7, scope: !1679)
!2276 = !DILocation(line: 247, column: 14, scope: !1710)
!2277 = !DILocation(line: 248, column: 13, scope: !1715)
!2278 = !DILocation(line: 240, column: 9, scope: !1679)
!2279 = !DILocation(line: 249, column: 17, scope: !1718)
!2280 = !DILocation(line: 249, column: 15, scope: !1718)
!2281 = !DILocation(line: 249, column: 11, scope: !1715)
!2282 = !DILocation(line: 247, column: 27, scope: !1710)
!2283 = distinct !{!2283, !1723}
!2284 = !DILocation(line: 0, scope: !1728, inlinedAt: !2285)
!2285 = distinct !DILocation(line: 252, column: 16, scope: !1712)
!2286 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !2285)
!2287 = !DILocation(line: 780, column: 32, scope: !1728, inlinedAt: !2285)
!2288 = !DILocation(line: 253, column: 26, scope: !1712)
!2289 = !DILocation(line: 0, scope: !1728, inlinedAt: !2290)
!2290 = distinct !DILocation(line: 253, column: 18, scope: !1712)
!2291 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !2290)
!2292 = !DILocation(line: 0, scope: !1728, inlinedAt: !2293)
!2293 = distinct !DILocation(line: 253, column: 5, scope: !1712)
!2294 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !2293)
!2295 = !DILocation(line: 253, column: 16, scope: !1712)
!2296 = !DILocation(line: 0, scope: !1728, inlinedAt: !2297)
!2297 = distinct !DILocation(line: 254, column: 5, scope: !1712)
!2298 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !2297)
!2299 = !DILocation(line: 780, column: 32, scope: !1728, inlinedAt: !2297)
!2300 = !DILocation(line: 254, column: 21, scope: !1712)
!2301 = !DILocation(line: 256, column: 16, scope: !1712)
!2302 = !DILocation(line: 243, column: 9, scope: !1679)
!2303 = !DILocation(line: 257, column: 20, scope: !1712)
!2304 = !DILocation(line: 257, column: 18, scope: !1712)
!2305 = !DILocation(line: 258, column: 23, scope: !1712)
!2306 = !DILocation(line: 261, column: 27, scope: !1712)
!2307 = !DILocation(line: 0, scope: !1728, inlinedAt: !2308)
!2308 = distinct !DILocation(line: 261, column: 5, scope: !1712)
!2309 = !DILocation(line: 779, column: 28, scope: !1728, inlinedAt: !2308)
!2310 = !DILocation(line: 780, column: 32, scope: !1728, inlinedAt: !2308)
!2311 = !DILocation(line: 261, column: 16, scope: !1712)
!2312 = !DILocation(line: 261, column: 25, scope: !1712)
!2313 = !DILocation(line: 245, column: 19, scope: !1701)
!2314 = !DILocation(line: 263, column: 1, scope: !1679)
!2315 = distinct !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !366, file: !2316, line: 327, type: !496, isLocal: false, isDefinition: true, scopeLine: 329, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !495, retainedNodes: !2317)
!2316 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/vector.tcc", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!2317 = !{!2318, !2319, !2320, !2321, !2324, !2327, !2328, !2329}
!2318 = !DILocalVariable(name: "this", arg: 1, scope: !2315, type: !1537, flags: DIFlagArtificial | DIFlagObjectPointer)
!2319 = !DILocalVariable(name: "__position", arg: 2, scope: !2315, file: !48, line: 1409, type: !365)
!2320 = !DILocalVariable(name: "__x", arg: 3, scope: !2315, file: !48, line: 1409, type: !382)
!2321 = !DILocalVariable(name: "__x_copy", scope: !2322, file: !2316, line: 337, type: !19)
!2322 = distinct !DILexicalBlock(scope: !2323, file: !2316, line: 331, column: 2)
!2323 = distinct !DILexicalBlock(scope: !2315, file: !2316, line: 330, column: 11)
!2324 = !DILocalVariable(name: "__len", scope: !2325, file: !2316, line: 350, type: !2326)
!2325 = distinct !DILexicalBlock(scope: !2323, file: !2316, line: 349, column: 2)
!2326 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !363)
!2327 = !DILocalVariable(name: "__elems_before", scope: !2325, file: !2316, line: 352, type: !2326)
!2328 = !DILocalVariable(name: "__new_start", scope: !2325, file: !2316, line: 353, type: !465)
!2329 = !DILocalVariable(name: "__new_finish", scope: !2325, file: !2316, line: 354, type: !465)
!2330 = !DILocation(line: 0, scope: !2315)
!2331 = !DILocation(line: 1409, column: 60, scope: !2315)
!2332 = !DILocation(line: 330, column: 25, scope: !2323)
!2333 = !DILocation(line: 330, column: 52, scope: !2323)
!2334 = !DILocation(line: 330, column: 35, scope: !2323)
!2335 = !DILocation(line: 330, column: 11, scope: !2315)
!2336 = !DILocation(line: 333, column: 15, scope: !2322)
!2337 = !DILocation(line: 188, column: 37, scope: !2156, inlinedAt: !2338)
!2338 = distinct !DILocation(line: 332, column: 4, scope: !2322)
!2339 = !DILocation(line: 188, column: 50, scope: !2156, inlinedAt: !2338)
!2340 = !DILocation(line: 188, column: 66, scope: !2156, inlinedAt: !2338)
!2341 = !DILocation(line: 0, scope: !2168, inlinedAt: !2342)
!2342 = distinct !DILocation(line: 189, column: 13, scope: !2156, inlinedAt: !2338)
!2343 = !DILocation(line: 129, column: 25, scope: !2168, inlinedAt: !2342)
!2344 = !DILocation(line: 129, column: 41, scope: !2168, inlinedAt: !2342)
!2345 = !DILocation(line: 130, column: 28, scope: !2168, inlinedAt: !2342)
!2346 = !DILocation(line: 335, column: 4, scope: !2322)
!2347 = !DILocation(line: 337, column: 19, scope: !2322)
!2348 = !DILocation(line: 1409, column: 30, scope: !2315)
!2349 = !DILocation(line: 339, column: 4, scope: !2322)
!2350 = !DILocalVariable(name: "__first", arg: 1, scope: !2351, file: !2352, line: 638, type: !246)
!2351 = distinct !DISubprogram(name: "copy_backward<latLong *, latLong *>", linkageName: "_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_", scope: !15, file: !2352, line: 638, type: !2353, isLocal: false, isDefinition: true, scopeLine: 639, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2358, retainedNodes: !2355)
!2352 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_algobase.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!2353 = !DISubroutineType(types: !2354)
!2354 = !{!246, !246, !246, !246}
!2355 = !{!2350, !2356, !2357}
!2356 = !DILocalVariable(name: "__last", arg: 2, scope: !2351, file: !2352, line: 638, type: !246)
!2357 = !DILocalVariable(name: "__result", arg: 3, scope: !2351, file: !2352, line: 638, type: !246)
!2358 = !{!2359, !2360}
!2359 = !DITemplateTypeParameter(name: "_BI1", type: !246)
!2360 = !DITemplateTypeParameter(name: "_BI2", type: !246)
!2361 = !DILocation(line: 638, column: 24, scope: !2351, inlinedAt: !2362)
!2362 = distinct !DILocation(line: 339, column: 4, scope: !2322)
!2363 = !DILocation(line: 638, column: 38, scope: !2351, inlinedAt: !2362)
!2364 = !DILocation(line: 638, column: 51, scope: !2351, inlinedAt: !2362)
!2365 = !DILocalVariable(name: "__first", arg: 1, scope: !2366, file: !2352, line: 611, type: !246)
!2366 = distinct !DISubprogram(name: "__copy_move_backward_a2<false, latLong *, latLong *>", linkageName: "_ZSt23__copy_move_backward_a2ILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !15, file: !2352, line: 611, type: !2353, isLocal: false, isDefinition: true, scopeLine: 612, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2370, retainedNodes: !2367)
!2367 = !{!2365, !2368, !2369}
!2368 = !DILocalVariable(name: "__last", arg: 2, scope: !2366, file: !2352, line: 611, type: !246)
!2369 = !DILocalVariable(name: "__result", arg: 3, scope: !2366, file: !2352, line: 611, type: !246)
!2370 = !{!2371, !2359, !2360}
!2371 = !DITemplateValueParameter(name: "_IsMove", type: !433, value: i8 0)
!2372 = !DILocation(line: 611, column: 34, scope: !2366, inlinedAt: !2373)
!2373 = distinct !DILocation(line: 648, column: 15, scope: !2351, inlinedAt: !2362)
!2374 = !DILocation(line: 611, column: 48, scope: !2366, inlinedAt: !2373)
!2375 = !DILocation(line: 611, column: 61, scope: !2366, inlinedAt: !2373)
!2376 = !DILocalVariable(name: "__first", arg: 1, scope: !2377, file: !2352, line: 593, type: !246)
!2377 = distinct !DISubprogram(name: "__copy_move_backward_a<false, latLong *, latLong *>", linkageName: "_ZSt22__copy_move_backward_aILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !15, file: !2352, line: 593, type: !2353, isLocal: false, isDefinition: true, scopeLine: 594, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2370, retainedNodes: !2378)
!2378 = !{!2376, !2379, !2380, !2381}
!2379 = !DILocalVariable(name: "__last", arg: 2, scope: !2377, file: !2352, line: 593, type: !246)
!2380 = !DILocalVariable(name: "__result", arg: 3, scope: !2377, file: !2352, line: 593, type: !246)
!2381 = !DILocalVariable(name: "__simple", scope: !2377, file: !2352, line: 598, type: !2382)
!2382 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !433)
!2383 = !DILocation(line: 593, column: 33, scope: !2377, inlinedAt: !2384)
!2384 = distinct !DILocation(line: 613, column: 19, scope: !2366, inlinedAt: !2373)
!2385 = !DILocation(line: 593, column: 47, scope: !2377, inlinedAt: !2384)
!2386 = !DILocation(line: 593, column: 60, scope: !2377, inlinedAt: !2384)
!2387 = !DILocation(line: 598, column: 18, scope: !2377, inlinedAt: !2384)
!2388 = !DILocalVariable(name: "__first", arg: 1, scope: !2389, file: !2352, line: 575, type: !254)
!2389 = distinct !DISubprogram(name: "__copy_move_b<latLong>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI7latLongEEPT_PKS4_S7_S5_", scope: !2390, file: !2352, line: 575, type: !2405, isLocal: false, isDefinition: true, scopeLine: 576, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !273, declaration: !2407, retainedNodes: !2408)
!2390 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__copy_move_backward<false, true, std::random_access_iterator_tag>", scope: !15, file: !2352, line: 571, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !2391, identifier: "_ZTSSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE")
!2391 = !{!2392, !2393, !2394}
!2392 = !DITemplateValueParameter(type: !433, value: i8 0)
!2393 = !DITemplateValueParameter(type: !433, value: i8 1)
!2394 = !DITemplateTypeParameter(type: !2395)
!2395 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "random_access_iterator_tag", scope: !15, file: !526, line: 103, size: 8, flags: DIFlagTypePassByValue, elements: !2396, identifier: "_ZTSSt26random_access_iterator_tag")
!2396 = !{!2397}
!2397 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2395, baseType: !2398, extraData: i32 0)
!2398 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bidirectional_iterator_tag", scope: !15, file: !526, line: 99, size: 8, flags: DIFlagTypePassByValue, elements: !2399, identifier: "_ZTSSt26bidirectional_iterator_tag")
!2399 = !{!2400}
!2400 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2398, baseType: !2401, extraData: i32 0)
!2401 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "forward_iterator_tag", scope: !15, file: !526, line: 95, size: 8, flags: DIFlagTypePassByValue, elements: !2402, identifier: "_ZTSSt20forward_iterator_tag")
!2402 = !{!2403}
!2403 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2401, baseType: !2404, extraData: i32 0)
!2404 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "input_iterator_tag", scope: !15, file: !526, line: 89, size: 8, flags: DIFlagTypePassByValue, elements: !16, identifier: "_ZTSSt18input_iterator_tag")
!2405 = !DISubroutineType(types: !2406)
!2406 = !{!246, !254, !254, !246}
!2407 = !DISubprogram(name: "__copy_move_b<latLong>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI7latLongEEPT_PKS4_S7_S5_", scope: !2390, file: !2352, line: 575, type: !2405, isLocal: false, isDefinition: false, scopeLine: 575, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true, templateParams: !273)
!2408 = !{!2388, !2409, !2410, !2411}
!2409 = !DILocalVariable(name: "__last", arg: 2, scope: !2389, file: !2352, line: 575, type: !254)
!2410 = !DILocalVariable(name: "__result", arg: 3, scope: !2389, file: !2352, line: 575, type: !246)
!2411 = !DILocalVariable(name: "_Num", scope: !2389, file: !2352, line: 584, type: !2412)
!2412 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !551)
!2413 = !DILocation(line: 575, column: 34, scope: !2389, inlinedAt: !2414)
!2414 = distinct !DILocation(line: 603, column: 14, scope: !2377, inlinedAt: !2384)
!2415 = !DILocation(line: 575, column: 54, scope: !2389, inlinedAt: !2414)
!2416 = !DILocation(line: 575, column: 67, scope: !2389, inlinedAt: !2414)
!2417 = !DILocation(line: 584, column: 34, scope: !2389, inlinedAt: !2414)
!2418 = !DILocation(line: 585, column: 8, scope: !2419, inlinedAt: !2414)
!2419 = distinct !DILexicalBlock(scope: !2389, file: !2352, line: 585, column: 8)
!2420 = !DILocation(line: 585, column: 8, scope: !2389, inlinedAt: !2414)
!2421 = !DILocation(line: 584, column: 20, scope: !2389, inlinedAt: !2414)
!2422 = !DILocation(line: 0, scope: !2419, inlinedAt: !2414)
!2423 = !DILocation(line: 586, column: 6, scope: !2419, inlinedAt: !2414)
!2424 = !DILocation(line: 343, column: 16, scope: !2322)
!2425 = !DILocation(line: 347, column: 2, scope: !2322)
!2426 = !DILocalVariable(name: "this", arg: 1, scope: !2427, type: !2432, flags: DIFlagArtificial | DIFlagObjectPointer)
!2427 = distinct !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc", scope: !366, file: !48, line: 1422, type: !499, isLocal: false, isDefinition: true, scopeLine: 1423, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !498, retainedNodes: !2428)
!2428 = !{!2426, !2429, !2430, !2431}
!2429 = !DILocalVariable(name: "__n", arg: 2, scope: !2427, file: !48, line: 1422, type: !363)
!2430 = !DILocalVariable(name: "__s", arg: 3, scope: !2427, file: !48, line: 1422, type: !502)
!2431 = !DILocalVariable(name: "__len", scope: !2427, file: !48, line: 1427, type: !2326)
!2432 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !389, size: 64)
!2433 = !DILocation(line: 0, scope: !2427, inlinedAt: !2434)
!2434 = distinct !DILocation(line: 351, column: 6, scope: !2325)
!2435 = !DILocation(line: 1422, column: 30, scope: !2427, inlinedAt: !2434)
!2436 = !DILocalVariable(name: "this", arg: 1, scope: !2437, type: !2432, flags: DIFlagArtificial | DIFlagObjectPointer)
!2437 = distinct !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv", scope: !366, file: !48, line: 654, type: !423, isLocal: false, isDefinition: true, scopeLine: 655, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !422, retainedNodes: !2438)
!2438 = !{!2436}
!2439 = !DILocation(line: 0, scope: !2437, inlinedAt: !2440)
!2440 = distinct !DILocation(line: 1424, column: 19, scope: !2441, inlinedAt: !2434)
!2441 = distinct !DILexicalBlock(scope: !2427, file: !48, line: 1424, column: 6)
!2442 = !DILocation(line: 655, column: 40, scope: !2437, inlinedAt: !2440)
!2443 = !DILocation(line: 655, column: 66, scope: !2437, inlinedAt: !2440)
!2444 = !DILocation(line: 655, column: 50, scope: !2437, inlinedAt: !2440)
!2445 = !DILocation(line: 0, scope: !2437, inlinedAt: !2446)
!2446 = distinct !DILocation(line: 1427, column: 26, scope: !2427, inlinedAt: !2434)
!2447 = !DILocation(line: 0, scope: !2437, inlinedAt: !2448)
!2448 = distinct !DILocation(line: 1427, column: 44, scope: !2427, inlinedAt: !2434)
!2449 = !DILocation(line: 224, column: 15, scope: !2450, inlinedAt: !2461)
!2450 = distinct !DILexicalBlock(scope: !2451, file: !2352, line: 224, column: 11)
!2451 = distinct !DISubprogram(name: "max<unsigned long>", linkageName: "_ZSt3maxImERKT_S2_S2_", scope: !15, file: !2352, line: 219, type: !2452, isLocal: false, isDefinition: true, scopeLine: 220, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2459, retainedNodes: !2456)
!2452 = !DISubroutineType(types: !2453)
!2453 = !{!2454, !2454, !2454}
!2454 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2455, size: 64)
!2455 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !105)
!2456 = !{!2457, !2458}
!2457 = !DILocalVariable(name: "__a", arg: 1, scope: !2451, file: !2352, line: 219, type: !2454)
!2458 = !DILocalVariable(name: "__b", arg: 2, scope: !2451, file: !2352, line: 219, type: !2454)
!2459 = !{!2460}
!2460 = !DITemplateTypeParameter(name: "_Tp", type: !105)
!2461 = distinct !DILocation(line: 1427, column: 35, scope: !2427, inlinedAt: !2434)
!2462 = !DILocation(line: 1427, column: 35, scope: !2427, inlinedAt: !2434)
!2463 = !DILocation(line: 1427, column: 33, scope: !2427, inlinedAt: !2434)
!2464 = !DILocation(line: 1427, column: 18, scope: !2427, inlinedAt: !2434)
!2465 = !DILocation(line: 0, scope: !2437, inlinedAt: !2466)
!2466 = distinct !DILocation(line: 1428, column: 18, scope: !2427, inlinedAt: !2434)
!2467 = !DILocation(line: 1428, column: 16, scope: !2427, inlinedAt: !2434)
!2468 = !DILocation(line: 1428, column: 34, scope: !2427, inlinedAt: !2434)
!2469 = !DILocation(line: 1428, column: 25, scope: !2427, inlinedAt: !2434)
!2470 = !DILocation(line: 350, column: 20, scope: !2325)
!2471 = !DILocalVariable(name: "this", arg: 1, scope: !2472, type: !1537, flags: DIFlagArtificial | DIFlagObjectPointer)
!2472 = distinct !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5beginEv", scope: !366, file: !48, line: 547, type: !399, isLocal: false, isDefinition: true, scopeLine: 548, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !398, retainedNodes: !2473)
!2473 = !{!2471}
!2474 = !DILocation(line: 0, scope: !2472, inlinedAt: !2475)
!2475 = distinct !DILocation(line: 352, column: 50, scope: !2325)
!2476 = !DILocalVariable(name: "this", arg: 1, scope: !2477, type: !2480, flags: DIFlagArtificial | DIFlagObjectPointer)
!2477 = distinct !DISubprogram(name: "__normal_iterator", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_", scope: !509, file: !406, line: 740, type: !517, isLocal: false, isDefinition: true, scopeLine: 741, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !516, retainedNodes: !2478)
!2478 = !{!2476, !2479}
!2479 = !DILocalVariable(name: "__i", arg: 2, scope: !2477, file: !406, line: 740, type: !519)
!2480 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !509, size: 64)
!2481 = !DILocation(line: 0, scope: !2477, inlinedAt: !2482)
!2482 = distinct !DILocation(line: 548, column: 16, scope: !2472, inlinedAt: !2475)
!2483 = !DILocation(line: 740, column: 42, scope: !2477, inlinedAt: !2482)
!2484 = !DILocation(line: 741, column: 20, scope: !2477, inlinedAt: !2482)
!2485 = !DILocalVariable(name: "__lhs", arg: 1, scope: !2486, file: !406, line: 923, type: !2489)
!2486 = distinct !DISubprogram(name: "operator-<latLong *, std::vector<latLong, std::allocator<latLong> > >", linkageName: "_ZN9__gnu_cxxmiIP7latLongSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_", scope: !60, file: !406, line: 923, type: !2487, isLocal: false, isDefinition: true, scopeLine: 926, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !564, retainedNodes: !2490)
!2487 = !DISubroutineType(types: !2488)
!2488 = !{!549, !2489, !2489}
!2489 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !531, size: 64)
!2490 = !{!2485, !2491}
!2491 = !DILocalVariable(name: "__rhs", arg: 2, scope: !2486, file: !406, line: 924, type: !2489)
!2492 = !DILocation(line: 923, column: 63, scope: !2486, inlinedAt: !2493)
!2493 = distinct !DILocation(line: 352, column: 48, scope: !2325)
!2494 = !DILocation(line: 924, column: 56, scope: !2486, inlinedAt: !2493)
!2495 = !DILocation(line: 926, column: 27, scope: !2486, inlinedAt: !2493)
!2496 = !DILocation(line: 352, column: 20, scope: !2325)
!2497 = !DILocalVariable(name: "this", arg: 1, scope: !2498, type: !1543, flags: DIFlagArtificial | DIFlagObjectPointer)
!2498 = distinct !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm", scope: !212, file: !48, line: 167, type: !350, isLocal: false, isDefinition: true, scopeLine: 168, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !349, retainedNodes: !2499)
!2499 = !{!2497, !2500}
!2500 = !DILocalVariable(name: "__n", arg: 2, scope: !2498, file: !48, line: 167, type: !103)
!2501 = !DILocation(line: 0, scope: !2498, inlinedAt: !2502)
!2502 = distinct !DILocation(line: 353, column: 30, scope: !2325)
!2503 = !DILocation(line: 167, column: 26, scope: !2498, inlinedAt: !2502)
!2504 = !DILocation(line: 170, column: 13, scope: !2498, inlinedAt: !2502)
!2505 = !DILocation(line: 170, column: 9, scope: !2498, inlinedAt: !2502)
!2506 = !DILocalVariable(name: "__a", arg: 1, scope: !2507, file: !58, line: 181, type: !226)
!2507 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m", scope: !221, file: !58, line: 181, type: !224, isLocal: false, isDefinition: true, scopeLine: 182, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !223, retainedNodes: !2508)
!2508 = !{!2506, !2509}
!2509 = !DILocalVariable(name: "__n", arg: 2, scope: !2507, file: !58, line: 181, type: !285)
!2510 = !DILocation(line: 181, column: 22, scope: !2507, inlinedAt: !2511)
!2511 = distinct !DILocation(line: 170, column: 20, scope: !2498, inlinedAt: !2502)
!2512 = !DILocation(line: 181, column: 37, scope: !2507, inlinedAt: !2511)
!2513 = !DILocalVariable(name: "this", arg: 1, scope: !2514, type: !1828, flags: DIFlagArtificial | DIFlagObjectPointer)
!2514 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv", scope: !230, file: !71, line: 99, type: !259, isLocal: false, isDefinition: true, scopeLine: 100, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !258, retainedNodes: !2515)
!2515 = !{!2513, !2516, !2517}
!2516 = !DILocalVariable(name: "__n", arg: 2, scope: !2514, file: !71, line: 99, type: !102)
!2517 = !DILocalVariable(arg: 3, scope: !2514, file: !71, line: 99, type: !106)
!2518 = !DILocation(line: 0, scope: !2514, inlinedAt: !2519)
!2519 = distinct !DILocation(line: 182, column: 18, scope: !2507, inlinedAt: !2511)
!2520 = !DILocation(line: 99, column: 26, scope: !2514, inlinedAt: !2519)
!2521 = !DILocation(line: 99, column: 43, scope: !2514, inlinedAt: !2519)
!2522 = !DILocation(line: 101, column: 10, scope: !2523, inlinedAt: !2519)
!2523 = distinct !DILexicalBlock(scope: !2514, file: !71, line: 101, column: 6)
!2524 = !DILocation(line: 101, column: 6, scope: !2514, inlinedAt: !2519)
!2525 = !DILocation(line: 102, column: 4, scope: !2523, inlinedAt: !2519)
!2526 = !DILocation(line: 104, column: 46, scope: !2514, inlinedAt: !2519)
!2527 = !DILocation(line: 104, column: 27, scope: !2514, inlinedAt: !2519)
!2528 = !DILocation(line: 104, column: 9, scope: !2514, inlinedAt: !2519)
!2529 = !DILocation(line: 372, column: 18, scope: !2530)
!2530 = distinct !DILexicalBlock(scope: !2325, file: !2316, line: 356, column: 6)
!2531 = !DILocation(line: 353, column: 12, scope: !2325)
!2532 = !DILocation(line: 354, column: 12, scope: !2325)
!2533 = !DILocation(line: 362, column: 38, scope: !2530)
!2534 = !DILocation(line: 188, column: 37, scope: !2156, inlinedAt: !2535)
!2535 = distinct !DILocation(line: 361, column: 8, scope: !2530)
!2536 = !DILocation(line: 188, column: 50, scope: !2156, inlinedAt: !2535)
!2537 = !DILocation(line: 188, column: 66, scope: !2156, inlinedAt: !2535)
!2538 = !DILocation(line: 0, scope: !2168, inlinedAt: !2539)
!2539 = distinct !DILocation(line: 189, column: 13, scope: !2156, inlinedAt: !2535)
!2540 = !DILocation(line: 129, column: 25, scope: !2168, inlinedAt: !2539)
!2541 = !DILocation(line: 129, column: 41, scope: !2168, inlinedAt: !2539)
!2542 = !DILocation(line: 130, column: 28, scope: !2168, inlinedAt: !2539)
!2543 = !DILocalVariable(name: "__first", arg: 1, scope: !2544, file: !2545, line: 297, type: !246)
!2544 = distinct !DISubprogram(name: "__uninitialized_move_if_noexcept_a<latLong *, latLong *, std::allocator<latLong> >", linkageName: "_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_", scope: !15, file: !2545, line: 297, type: !2546, isLocal: false, isDefinition: true, scopeLine: 301, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2552, retainedNodes: !2548)
!2545 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/stl_uninitialized.h", directory: "/home/jhpark/llvm/CUDAAdvisor/expr/BD_mode/nnllvm")
!2546 = !DISubroutineType(types: !2547)
!2547 = !{!246, !246, !246, !246, !226}
!2548 = !{!2543, !2549, !2550, !2551}
!2549 = !DILocalVariable(name: "__last", arg: 2, scope: !2544, file: !2545, line: 298, type: !246)
!2550 = !DILocalVariable(name: "__result", arg: 3, scope: !2544, file: !2545, line: 299, type: !246)
!2551 = !DILocalVariable(name: "__alloc", arg: 4, scope: !2544, file: !2545, line: 300, type: !226)
!2552 = !{!2553, !2554, !2555}
!2553 = !DITemplateTypeParameter(name: "_InputIterator", type: !246)
!2554 = !DITemplateTypeParameter(name: "_ForwardIterator", type: !246)
!2555 = !DITemplateTypeParameter(name: "_Allocator", type: !227)
!2556 = !DILocation(line: 297, column: 55, scope: !2544, inlinedAt: !2557)
!2557 = distinct !DILocation(line: 371, column: 5, scope: !2530)
!2558 = !DILocation(line: 298, column: 27, scope: !2544, inlinedAt: !2557)
!2559 = !DILocation(line: 299, column: 29, scope: !2544, inlinedAt: !2557)
!2560 = !DILocalVariable(name: "__first", arg: 1, scope: !2561, file: !2545, line: 279, type: !246)
!2561 = distinct !DISubprogram(name: "__uninitialized_copy_a<latLong *, latLong *, latLong>", linkageName: "_ZSt22__uninitialized_copy_aIP7latLongS1_S0_ET0_T_S3_S2_RSaIT1_E", scope: !15, file: !2545, line: 279, type: !2546, isLocal: false, isDefinition: true, scopeLine: 281, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2566, retainedNodes: !2562)
!2562 = !{!2560, !2563, !2564, !2565}
!2563 = !DILocalVariable(name: "__last", arg: 2, scope: !2561, file: !2545, line: 279, type: !246)
!2564 = !DILocalVariable(name: "__result", arg: 3, scope: !2561, file: !2545, line: 280, type: !246)
!2565 = !DILocalVariable(arg: 4, scope: !2561, file: !2545, line: 280, type: !226)
!2566 = !{!2553, !2554, !274}
!2567 = !DILocation(line: 279, column: 43, scope: !2561, inlinedAt: !2568)
!2568 = distinct !DILocation(line: 302, column: 14, scope: !2544, inlinedAt: !2557)
!2569 = !DILocation(line: 279, column: 67, scope: !2561, inlinedAt: !2568)
!2570 = !DILocation(line: 280, column: 24, scope: !2561, inlinedAt: !2568)
!2571 = !DILocalVariable(name: "__first", arg: 1, scope: !2572, file: !2545, line: 107, type: !246)
!2572 = distinct !DISubprogram(name: "uninitialized_copy<latLong *, latLong *>", linkageName: "_ZSt18uninitialized_copyIP7latLongS1_ET0_T_S3_S2_", scope: !15, file: !2545, line: 107, type: !2353, isLocal: false, isDefinition: true, scopeLine: 109, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2577, retainedNodes: !2573)
!2573 = !{!2571, !2574, !2575, !2576}
!2574 = !DILocalVariable(name: "__last", arg: 2, scope: !2572, file: !2545, line: 107, type: !246)
!2575 = !DILocalVariable(name: "__result", arg: 3, scope: !2572, file: !2545, line: 108, type: !246)
!2576 = !DILocalVariable(name: "__assignable", scope: !2572, file: !2545, line: 115, type: !2382)
!2577 = !{!2553, !2554}
!2578 = !DILocation(line: 107, column: 39, scope: !2572, inlinedAt: !2579)
!2579 = distinct !DILocation(line: 281, column: 14, scope: !2561, inlinedAt: !2568)
!2580 = !DILocation(line: 107, column: 63, scope: !2572, inlinedAt: !2579)
!2581 = !DILocation(line: 108, column: 27, scope: !2572, inlinedAt: !2579)
!2582 = !DILocation(line: 115, column: 18, scope: !2572, inlinedAt: !2579)
!2583 = !DILocalVariable(name: "__first", arg: 1, scope: !2584, file: !2545, line: 91, type: !246)
!2584 = distinct !DISubprogram(name: "__uninit_copy<latLong *, latLong *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_", scope: !2585, file: !2545, line: 91, type: !2353, isLocal: false, isDefinition: true, scopeLine: 93, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2577, declaration: !2588, retainedNodes: !2589)
!2585 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uninitialized_copy<true>", scope: !15, file: !2545, line: 87, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !2586, identifier: "_ZTSSt20__uninitialized_copyILb1EE")
!2586 = !{!2587}
!2587 = !DITemplateValueParameter(name: "_TrivialValueTypes", type: !433, value: i8 1)
!2588 = !DISubprogram(name: "__uninit_copy<latLong *, latLong *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_", scope: !2585, file: !2545, line: 91, type: !2353, isLocal: false, isDefinition: false, scopeLine: 91, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true, templateParams: !2577)
!2589 = !{!2583, !2590, !2591}
!2590 = !DILocalVariable(name: "__last", arg: 2, scope: !2584, file: !2545, line: 91, type: !246)
!2591 = !DILocalVariable(name: "__result", arg: 3, scope: !2584, file: !2545, line: 92, type: !246)
!2592 = !DILocation(line: 91, column: 38, scope: !2584, inlinedAt: !2593)
!2593 = distinct !DILocation(line: 123, column: 14, scope: !2572, inlinedAt: !2579)
!2594 = !DILocation(line: 91, column: 62, scope: !2584, inlinedAt: !2593)
!2595 = !DILocation(line: 92, column: 26, scope: !2584, inlinedAt: !2593)
!2596 = !DILocalVariable(name: "__first", arg: 1, scope: !2597, file: !2352, line: 462, type: !246)
!2597 = distinct !DISubprogram(name: "copy<latLong *, latLong *>", linkageName: "_ZSt4copyIP7latLongS1_ET0_T_S3_S2_", scope: !15, file: !2352, line: 462, type: !2353, isLocal: false, isDefinition: true, scopeLine: 463, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2601, retainedNodes: !2598)
!2598 = !{!2596, !2599, !2600}
!2599 = !DILocalVariable(name: "__last", arg: 2, scope: !2597, file: !2352, line: 462, type: !246)
!2600 = !DILocalVariable(name: "__result", arg: 3, scope: !2597, file: !2352, line: 462, type: !246)
!2601 = !{!2602, !2603}
!2602 = !DITemplateTypeParameter(name: "_II", type: !246)
!2603 = !DITemplateTypeParameter(name: "_OI", type: !246)
!2604 = !DILocation(line: 462, column: 14, scope: !2597, inlinedAt: !2605)
!2605 = distinct !DILocation(line: 93, column: 18, scope: !2584, inlinedAt: !2593)
!2606 = !DILocation(line: 462, column: 27, scope: !2597, inlinedAt: !2605)
!2607 = !DILocation(line: 462, column: 39, scope: !2597, inlinedAt: !2605)
!2608 = !DILocalVariable(name: "__first", arg: 1, scope: !2609, file: !2352, line: 436, type: !246)
!2609 = distinct !DISubprogram(name: "__copy_move_a2<false, latLong *, latLong *>", linkageName: "_ZSt14__copy_move_a2ILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !15, file: !2352, line: 436, type: !2353, isLocal: false, isDefinition: true, scopeLine: 437, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2613, retainedNodes: !2610)
!2610 = !{!2608, !2611, !2612}
!2611 = !DILocalVariable(name: "__last", arg: 2, scope: !2609, file: !2352, line: 436, type: !246)
!2612 = !DILocalVariable(name: "__result", arg: 3, scope: !2609, file: !2352, line: 436, type: !246)
!2613 = !{!2371, !2602, !2603}
!2614 = !DILocation(line: 436, column: 24, scope: !2609, inlinedAt: !2615)
!2615 = distinct !DILocation(line: 470, column: 15, scope: !2597, inlinedAt: !2605)
!2616 = !DILocation(line: 436, column: 37, scope: !2609, inlinedAt: !2615)
!2617 = !DILocation(line: 436, column: 49, scope: !2609, inlinedAt: !2615)
!2618 = !DILocalVariable(name: "__first", arg: 1, scope: !2619, file: !2352, line: 391, type: !246)
!2619 = distinct !DISubprogram(name: "__copy_move_a<false, latLong *, latLong *>", linkageName: "_ZSt13__copy_move_aILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !15, file: !2352, line: 391, type: !2353, isLocal: false, isDefinition: true, scopeLine: 392, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2613, retainedNodes: !2620)
!2620 = !{!2618, !2621, !2622, !2623}
!2621 = !DILocalVariable(name: "__last", arg: 2, scope: !2619, file: !2352, line: 391, type: !246)
!2622 = !DILocalVariable(name: "__result", arg: 3, scope: !2619, file: !2352, line: 391, type: !246)
!2623 = !DILocalVariable(name: "__simple", scope: !2619, file: !2352, line: 396, type: !2382)
!2624 = !DILocation(line: 391, column: 23, scope: !2619, inlinedAt: !2625)
!2625 = distinct !DILocation(line: 438, column: 18, scope: !2609, inlinedAt: !2615)
!2626 = !DILocation(line: 391, column: 36, scope: !2619, inlinedAt: !2625)
!2627 = !DILocation(line: 391, column: 48, scope: !2619, inlinedAt: !2625)
!2628 = !DILocation(line: 396, column: 18, scope: !2619, inlinedAt: !2625)
!2629 = !DILocalVariable(name: "__first", arg: 1, scope: !2630, file: !2352, line: 373, type: !254)
!2630 = distinct !DISubprogram(name: "__copy_m<latLong>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_", scope: !2631, file: !2352, line: 373, type: !2405, isLocal: false, isDefinition: true, scopeLine: 374, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !273, declaration: !2632, retainedNodes: !2633)
!2631 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__copy_move<false, true, std::random_access_iterator_tag>", scope: !15, file: !2352, line: 369, size: 8, flags: DIFlagTypePassByValue, elements: !16, templateParams: !2391, identifier: "_ZTSSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE")
!2632 = !DISubprogram(name: "__copy_m<latLong>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_", scope: !2631, file: !2352, line: 373, type: !2405, isLocal: false, isDefinition: false, scopeLine: 373, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true, templateParams: !273)
!2633 = !{!2629, !2634, !2635, !2636}
!2634 = !DILocalVariable(name: "__last", arg: 2, scope: !2630, file: !2352, line: 373, type: !254)
!2635 = !DILocalVariable(name: "__result", arg: 3, scope: !2630, file: !2352, line: 373, type: !246)
!2636 = !DILocalVariable(name: "_Num", scope: !2630, file: !2352, line: 382, type: !2412)
!2637 = !DILocation(line: 373, column: 29, scope: !2630, inlinedAt: !2638)
!2638 = distinct !DILocation(line: 401, column: 14, scope: !2619, inlinedAt: !2625)
!2639 = !DILocation(line: 373, column: 49, scope: !2630, inlinedAt: !2638)
!2640 = !DILocation(line: 373, column: 62, scope: !2630, inlinedAt: !2638)
!2641 = !DILocation(line: 382, column: 34, scope: !2630, inlinedAt: !2638)
!2642 = !DILocation(line: 382, column: 20, scope: !2630, inlinedAt: !2638)
!2643 = !DILocation(line: 383, column: 8, scope: !2644, inlinedAt: !2638)
!2644 = distinct !DILexicalBlock(scope: !2630, file: !2352, line: 383, column: 8)
!2645 = !DILocation(line: 383, column: 8, scope: !2630, inlinedAt: !2638)
!2646 = !DILocation(line: 384, column: 6, scope: !2644, inlinedAt: !2638)
!2647 = !DILocation(line: 385, column: 20, scope: !2630, inlinedAt: !2638)
!2648 = !DILocation(line: 375, column: 8, scope: !2530)
!2649 = !DILocation(line: 379, column: 37, scope: !2530)
!2650 = !DILocation(line: 297, column: 55, scope: !2544, inlinedAt: !2651)
!2651 = distinct !DILocation(line: 378, column: 5, scope: !2530)
!2652 = !DILocation(line: 298, column: 27, scope: !2544, inlinedAt: !2651)
!2653 = !DILocation(line: 299, column: 29, scope: !2544, inlinedAt: !2651)
!2654 = !DILocation(line: 279, column: 43, scope: !2561, inlinedAt: !2655)
!2655 = distinct !DILocation(line: 302, column: 14, scope: !2544, inlinedAt: !2651)
!2656 = !DILocation(line: 279, column: 67, scope: !2561, inlinedAt: !2655)
!2657 = !DILocation(line: 280, column: 24, scope: !2561, inlinedAt: !2655)
!2658 = !DILocation(line: 107, column: 39, scope: !2572, inlinedAt: !2659)
!2659 = distinct !DILocation(line: 281, column: 14, scope: !2561, inlinedAt: !2655)
!2660 = !DILocation(line: 107, column: 63, scope: !2572, inlinedAt: !2659)
!2661 = !DILocation(line: 108, column: 27, scope: !2572, inlinedAt: !2659)
!2662 = !DILocation(line: 115, column: 18, scope: !2572, inlinedAt: !2659)
!2663 = !DILocation(line: 91, column: 38, scope: !2584, inlinedAt: !2664)
!2664 = distinct !DILocation(line: 123, column: 14, scope: !2572, inlinedAt: !2659)
!2665 = !DILocation(line: 91, column: 62, scope: !2584, inlinedAt: !2664)
!2666 = !DILocation(line: 92, column: 26, scope: !2584, inlinedAt: !2664)
!2667 = !DILocation(line: 462, column: 14, scope: !2597, inlinedAt: !2668)
!2668 = distinct !DILocation(line: 93, column: 18, scope: !2584, inlinedAt: !2664)
!2669 = !DILocation(line: 462, column: 27, scope: !2597, inlinedAt: !2668)
!2670 = !DILocation(line: 462, column: 39, scope: !2597, inlinedAt: !2668)
!2671 = !DILocation(line: 436, column: 24, scope: !2609, inlinedAt: !2672)
!2672 = distinct !DILocation(line: 470, column: 15, scope: !2597, inlinedAt: !2668)
!2673 = !DILocation(line: 436, column: 37, scope: !2609, inlinedAt: !2672)
!2674 = !DILocation(line: 436, column: 49, scope: !2609, inlinedAt: !2672)
!2675 = !DILocation(line: 391, column: 23, scope: !2619, inlinedAt: !2676)
!2676 = distinct !DILocation(line: 438, column: 18, scope: !2609, inlinedAt: !2672)
!2677 = !DILocation(line: 391, column: 36, scope: !2619, inlinedAt: !2676)
!2678 = !DILocation(line: 391, column: 48, scope: !2619, inlinedAt: !2676)
!2679 = !DILocation(line: 396, column: 18, scope: !2619, inlinedAt: !2676)
!2680 = !DILocation(line: 373, column: 29, scope: !2630, inlinedAt: !2681)
!2681 = distinct !DILocation(line: 401, column: 14, scope: !2619, inlinedAt: !2676)
!2682 = !DILocation(line: 373, column: 49, scope: !2630, inlinedAt: !2681)
!2683 = !DILocation(line: 373, column: 62, scope: !2630, inlinedAt: !2681)
!2684 = !DILocation(line: 382, column: 34, scope: !2630, inlinedAt: !2681)
!2685 = !DILocation(line: 382, column: 20, scope: !2630, inlinedAt: !2681)
!2686 = !DILocation(line: 383, column: 8, scope: !2644, inlinedAt: !2681)
!2687 = !DILocation(line: 383, column: 8, scope: !2630, inlinedAt: !2681)
!2688 = !DILocation(line: 384, column: 6, scope: !2644, inlinedAt: !2681)
!2689 = !DILocation(line: 385, column: 20, scope: !2630, inlinedAt: !2681)
!2690 = !DILocation(line: 0, scope: !1805, inlinedAt: !2691)
!2691 = distinct !DILocation(line: 394, column: 4, scope: !2325)
!2692 = !DILocation(line: 174, column: 29, scope: !1805, inlinedAt: !2691)
!2693 = !DILocation(line: 177, column: 6, scope: !1813, inlinedAt: !2691)
!2694 = !DILocation(line: 177, column: 6, scope: !1805, inlinedAt: !2691)
!2695 = !DILocation(line: 184, column: 36, scope: !1816, inlinedAt: !2696)
!2696 = distinct !DILocation(line: 178, column: 4, scope: !1813, inlinedAt: !2691)
!2697 = !DILocation(line: 184, column: 49, scope: !1816, inlinedAt: !2696)
!2698 = !DILocation(line: 0, scope: !1824, inlinedAt: !2699)
!2699 = distinct !DILocation(line: 185, column: 11, scope: !1816, inlinedAt: !2696)
!2700 = !DILocation(line: 109, column: 26, scope: !1824, inlinedAt: !2699)
!2701 = !DILocation(line: 110, column: 27, scope: !1824, inlinedAt: !2699)
!2702 = !DILocation(line: 110, column: 9, scope: !1824, inlinedAt: !2699)
!2703 = !DILocation(line: 178, column: 4, scope: !1813, inlinedAt: !2691)
!2704 = !DILocation(line: 397, column: 27, scope: !2325)
!2705 = !DILocation(line: 398, column: 28, scope: !2325)
!2706 = !DILocation(line: 399, column: 50, scope: !2325)
!2707 = !DILocation(line: 399, column: 36, scope: !2325)
!2708 = !DILocation(line: 401, column: 5, scope: !2315)
!2709 = distinct !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !568, file: !2316, line: 327, type: !696, isLocal: false, isDefinition: true, scopeLine: 329, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !695, retainedNodes: !2710)
!2710 = !{!2711, !2712, !2713, !2714, !2717, !2719, !2720, !2721}
!2711 = !DILocalVariable(name: "this", arg: 1, scope: !2709, type: !1517, flags: DIFlagArtificial | DIFlagObjectPointer)
!2712 = !DILocalVariable(name: "__position", arg: 2, scope: !2709, file: !48, line: 1409, type: !567)
!2713 = !DILocalVariable(name: "__x", arg: 3, scope: !2709, file: !48, line: 1409, type: !584)
!2714 = !DILocalVariable(name: "__x_copy", scope: !2715, file: !2316, line: 337, type: !30)
!2715 = distinct !DILexicalBlock(scope: !2716, file: !2316, line: 331, column: 2)
!2716 = distinct !DILexicalBlock(scope: !2709, file: !2316, line: 330, column: 11)
!2717 = !DILocalVariable(name: "__len", scope: !2718, file: !2316, line: 350, type: !2326)
!2718 = distinct !DILexicalBlock(scope: !2716, file: !2316, line: 349, column: 2)
!2719 = !DILocalVariable(name: "__elems_before", scope: !2718, file: !2316, line: 352, type: !2326)
!2720 = !DILocalVariable(name: "__new_start", scope: !2718, file: !2316, line: 353, type: !665)
!2721 = !DILocalVariable(name: "__new_finish", scope: !2718, file: !2316, line: 354, type: !665)
!2722 = !DILocation(line: 0, scope: !2709)
!2723 = !DILocation(line: 1409, column: 60, scope: !2709)
!2724 = !DILocation(line: 330, column: 25, scope: !2716)
!2725 = !DILocation(line: 330, column: 52, scope: !2716)
!2726 = !DILocation(line: 330, column: 35, scope: !2716)
!2727 = !DILocation(line: 330, column: 11, scope: !2709)
!2728 = !DILocation(line: 188, column: 37, scope: !2235, inlinedAt: !2729)
!2729 = distinct !DILocation(line: 332, column: 4, scope: !2715)
!2730 = !DILocation(line: 188, column: 50, scope: !2235, inlinedAt: !2729)
!2731 = !DILocation(line: 188, column: 66, scope: !2235, inlinedAt: !2729)
!2732 = !DILocation(line: 0, scope: !2248, inlinedAt: !2733)
!2733 = distinct !DILocation(line: 189, column: 13, scope: !2235, inlinedAt: !2729)
!2734 = !DILocation(line: 129, column: 25, scope: !2248, inlinedAt: !2733)
!2735 = !DILocation(line: 129, column: 41, scope: !2248, inlinedAt: !2733)
!2736 = !DILocation(line: 130, column: 23, scope: !2248, inlinedAt: !2733)
!2737 = !DILocation(line: 130, column: 28, scope: !2248, inlinedAt: !2733)
!2738 = !DILocation(line: 335, column: 4, scope: !2715)
!2739 = !DILocation(line: 337, column: 4, scope: !2715)
!2740 = !DILocation(line: 337, column: 19, scope: !2715)
!2741 = !DILocation(line: 1409, column: 30, scope: !2709)
!2742 = !DILocation(line: 339, column: 4, scope: !2715)
!2743 = !DILocalVariable(name: "__first", arg: 1, scope: !2744, file: !2352, line: 638, type: !87)
!2744 = distinct !DISubprogram(name: "copy_backward<record *, record *>", linkageName: "_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_", scope: !15, file: !2352, line: 638, type: !2745, isLocal: false, isDefinition: true, scopeLine: 639, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2750, retainedNodes: !2747)
!2745 = !DISubroutineType(types: !2746)
!2746 = !{!87, !87, !87, !87}
!2747 = !{!2743, !2748, !2749}
!2748 = !DILocalVariable(name: "__last", arg: 2, scope: !2744, file: !2352, line: 638, type: !87)
!2749 = !DILocalVariable(name: "__result", arg: 3, scope: !2744, file: !2352, line: 638, type: !87)
!2750 = !{!2751, !2752}
!2751 = !DITemplateTypeParameter(name: "_BI1", type: !87)
!2752 = !DITemplateTypeParameter(name: "_BI2", type: !87)
!2753 = !DILocation(line: 638, column: 24, scope: !2744, inlinedAt: !2754)
!2754 = distinct !DILocation(line: 339, column: 4, scope: !2715)
!2755 = !DILocation(line: 638, column: 38, scope: !2744, inlinedAt: !2754)
!2756 = !DILocalVariable(name: "__first", arg: 1, scope: !2757, file: !2352, line: 611, type: !87)
!2757 = distinct !DISubprogram(name: "__copy_move_backward_a2<false, record *, record *>", linkageName: "_ZSt23__copy_move_backward_a2ILb0EP6recordS1_ET1_T0_S3_S2_", scope: !15, file: !2352, line: 611, type: !2745, isLocal: false, isDefinition: true, scopeLine: 612, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2761, retainedNodes: !2758)
!2758 = !{!2756, !2759, !2760}
!2759 = !DILocalVariable(name: "__last", arg: 2, scope: !2757, file: !2352, line: 611, type: !87)
!2760 = !DILocalVariable(name: "__result", arg: 3, scope: !2757, file: !2352, line: 611, type: !87)
!2761 = !{!2371, !2751, !2752}
!2762 = !DILocation(line: 611, column: 34, scope: !2757, inlinedAt: !2763)
!2763 = distinct !DILocation(line: 648, column: 15, scope: !2744, inlinedAt: !2754)
!2764 = !DILocation(line: 611, column: 48, scope: !2757, inlinedAt: !2763)
!2765 = !DILocalVariable(name: "__first", arg: 1, scope: !2766, file: !2352, line: 593, type: !87)
!2766 = distinct !DISubprogram(name: "__copy_move_backward_a<false, record *, record *>", linkageName: "_ZSt22__copy_move_backward_aILb0EP6recordS1_ET1_T0_S3_S2_", scope: !15, file: !2352, line: 593, type: !2745, isLocal: false, isDefinition: true, scopeLine: 594, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2761, retainedNodes: !2767)
!2767 = !{!2765, !2768, !2769, !2770}
!2768 = !DILocalVariable(name: "__last", arg: 2, scope: !2766, file: !2352, line: 593, type: !87)
!2769 = !DILocalVariable(name: "__result", arg: 3, scope: !2766, file: !2352, line: 593, type: !87)
!2770 = !DILocalVariable(name: "__simple", scope: !2766, file: !2352, line: 598, type: !2382)
!2771 = !DILocation(line: 593, column: 33, scope: !2766, inlinedAt: !2772)
!2772 = distinct !DILocation(line: 613, column: 19, scope: !2757, inlinedAt: !2763)
!2773 = !DILocation(line: 593, column: 47, scope: !2766, inlinedAt: !2772)
!2774 = !DILocation(line: 598, column: 18, scope: !2766, inlinedAt: !2772)
!2775 = !DILocalVariable(name: "__first", arg: 1, scope: !2776, file: !2352, line: 575, type: !95)
!2776 = distinct !DISubprogram(name: "__copy_move_b<record>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI6recordEEPT_PKS4_S7_S5_", scope: !2390, file: !2352, line: 575, type: !2777, isLocal: false, isDefinition: true, scopeLine: 576, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !120, declaration: !2779, retainedNodes: !2780)
!2777 = !DISubroutineType(types: !2778)
!2778 = !{!87, !95, !95, !87}
!2779 = !DISubprogram(name: "__copy_move_b<record>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI6recordEEPT_PKS4_S7_S5_", scope: !2390, file: !2352, line: 575, type: !2777, isLocal: false, isDefinition: false, scopeLine: 575, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true, templateParams: !120)
!2780 = !{!2775, !2781, !2782, !2783}
!2781 = !DILocalVariable(name: "__last", arg: 2, scope: !2776, file: !2352, line: 575, type: !95)
!2782 = !DILocalVariable(name: "__result", arg: 3, scope: !2776, file: !2352, line: 575, type: !87)
!2783 = !DILocalVariable(name: "_Num", scope: !2776, file: !2352, line: 584, type: !2412)
!2784 = !DILocation(line: 575, column: 34, scope: !2776, inlinedAt: !2785)
!2785 = distinct !DILocation(line: 603, column: 14, scope: !2766, inlinedAt: !2772)
!2786 = !DILocation(line: 575, column: 54, scope: !2776, inlinedAt: !2785)
!2787 = !DILocation(line: 584, column: 34, scope: !2776, inlinedAt: !2785)
!2788 = !DILocation(line: 584, column: 20, scope: !2776, inlinedAt: !2785)
!2789 = !DILocation(line: 585, column: 8, scope: !2790, inlinedAt: !2785)
!2790 = distinct !DILexicalBlock(scope: !2776, file: !2352, line: 585, column: 8)
!2791 = !DILocation(line: 585, column: 8, scope: !2776, inlinedAt: !2785)
!2792 = !DILocation(line: 343, column: 16, scope: !2715)
!2793 = !DILocation(line: 0, scope: !2790, inlinedAt: !2785)
!2794 = !DILocation(line: 575, column: 67, scope: !2776, inlinedAt: !2785)
!2795 = !DILocation(line: 593, column: 60, scope: !2766, inlinedAt: !2772)
!2796 = !DILocation(line: 611, column: 61, scope: !2757, inlinedAt: !2763)
!2797 = !DILocation(line: 638, column: 51, scope: !2744, inlinedAt: !2754)
!2798 = !DILocation(line: 586, column: 6, scope: !2790, inlinedAt: !2785)
!2799 = !DILocation(line: 347, column: 2, scope: !2716)
!2800 = !DILocation(line: 347, column: 2, scope: !2715)
!2801 = !DILocalVariable(name: "this", arg: 1, scope: !2802, type: !2807, flags: DIFlagArtificial | DIFlagObjectPointer)
!2802 = distinct !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc", scope: !568, file: !48, line: 1422, type: !699, isLocal: false, isDefinition: true, scopeLine: 1423, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !698, retainedNodes: !2803)
!2803 = !{!2801, !2804, !2805, !2806}
!2804 = !DILocalVariable(name: "__n", arg: 2, scope: !2802, file: !48, line: 1422, type: !363)
!2805 = !DILocalVariable(name: "__s", arg: 3, scope: !2802, file: !48, line: 1422, type: !502)
!2806 = !DILocalVariable(name: "__len", scope: !2802, file: !48, line: 1427, type: !2326)
!2807 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !591, size: 64)
!2808 = !DILocation(line: 0, scope: !2802, inlinedAt: !2809)
!2809 = distinct !DILocation(line: 351, column: 6, scope: !2718)
!2810 = !DILocation(line: 1422, column: 30, scope: !2802, inlinedAt: !2809)
!2811 = !DILocalVariable(name: "this", arg: 1, scope: !2812, type: !2807, flags: DIFlagArtificial | DIFlagObjectPointer)
!2812 = distinct !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4sizeEv", scope: !568, file: !48, line: 654, type: !624, isLocal: false, isDefinition: true, scopeLine: 655, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !623, retainedNodes: !2813)
!2813 = !{!2811}
!2814 = !DILocation(line: 0, scope: !2812, inlinedAt: !2815)
!2815 = distinct !DILocation(line: 1424, column: 19, scope: !2816, inlinedAt: !2809)
!2816 = distinct !DILexicalBlock(scope: !2802, file: !48, line: 1424, column: 6)
!2817 = !DILocation(line: 655, column: 40, scope: !2812, inlinedAt: !2815)
!2818 = !DILocation(line: 655, column: 66, scope: !2812, inlinedAt: !2815)
!2819 = !DILocation(line: 655, column: 50, scope: !2812, inlinedAt: !2815)
!2820 = !DILocation(line: 0, scope: !2812, inlinedAt: !2821)
!2821 = distinct !DILocation(line: 1427, column: 26, scope: !2802, inlinedAt: !2809)
!2822 = !DILocation(line: 0, scope: !2812, inlinedAt: !2823)
!2823 = distinct !DILocation(line: 1427, column: 44, scope: !2802, inlinedAt: !2809)
!2824 = !DILocation(line: 224, column: 15, scope: !2450, inlinedAt: !2825)
!2825 = distinct !DILocation(line: 1427, column: 35, scope: !2802, inlinedAt: !2809)
!2826 = !DILocation(line: 1427, column: 35, scope: !2802, inlinedAt: !2809)
!2827 = !DILocation(line: 1427, column: 33, scope: !2802, inlinedAt: !2809)
!2828 = !DILocation(line: 1427, column: 18, scope: !2802, inlinedAt: !2809)
!2829 = !DILocation(line: 0, scope: !2812, inlinedAt: !2830)
!2830 = distinct !DILocation(line: 1428, column: 18, scope: !2802, inlinedAt: !2809)
!2831 = !DILocation(line: 1428, column: 16, scope: !2802, inlinedAt: !2809)
!2832 = !DILocation(line: 1428, column: 34, scope: !2802, inlinedAt: !2809)
!2833 = !DILocation(line: 1428, column: 25, scope: !2802, inlinedAt: !2809)
!2834 = !DILocation(line: 350, column: 20, scope: !2718)
!2835 = !DILocalVariable(name: "this", arg: 1, scope: !2836, type: !1517, flags: DIFlagArtificial | DIFlagObjectPointer)
!2836 = distinct !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5beginEv", scope: !568, file: !48, line: 547, type: !601, isLocal: false, isDefinition: true, scopeLine: 548, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !600, retainedNodes: !2837)
!2837 = !{!2835}
!2838 = !DILocation(line: 0, scope: !2836, inlinedAt: !2839)
!2839 = distinct !DILocation(line: 352, column: 50, scope: !2718)
!2840 = !DILocalVariable(name: "this", arg: 1, scope: !2841, type: !2844, flags: DIFlagArtificial | DIFlagObjectPointer)
!2841 = distinct !DISubprogram(name: "__normal_iterator", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_", scope: !707, file: !406, line: 740, type: !715, isLocal: false, isDefinition: true, scopeLine: 741, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !714, retainedNodes: !2842)
!2842 = !{!2840, !2843}
!2843 = !DILocalVariable(name: "__i", arg: 2, scope: !2841, file: !406, line: 740, type: !717)
!2844 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !707, size: 64)
!2845 = !DILocation(line: 0, scope: !2841, inlinedAt: !2846)
!2846 = distinct !DILocation(line: 548, column: 16, scope: !2836, inlinedAt: !2839)
!2847 = !DILocation(line: 740, column: 42, scope: !2841, inlinedAt: !2846)
!2848 = !DILocation(line: 741, column: 20, scope: !2841, inlinedAt: !2846)
!2849 = !DILocalVariable(name: "__lhs", arg: 1, scope: !2850, file: !406, line: 923, type: !2853)
!2850 = distinct !DISubprogram(name: "operator-<record *, std::vector<record, std::allocator<record> > >", linkageName: "_ZN9__gnu_cxxmiIP6recordSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_", scope: !60, file: !406, line: 923, type: !2851, isLocal: false, isDefinition: true, scopeLine: 926, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !759, retainedNodes: !2854)
!2851 = !DISubroutineType(types: !2852)
!2852 = !{!746, !2853, !2853}
!2853 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !728, size: 64)
!2854 = !{!2849, !2855}
!2855 = !DILocalVariable(name: "__rhs", arg: 2, scope: !2850, file: !406, line: 924, type: !2853)
!2856 = !DILocation(line: 923, column: 63, scope: !2850, inlinedAt: !2857)
!2857 = distinct !DILocation(line: 352, column: 48, scope: !2718)
!2858 = !DILocation(line: 924, column: 56, scope: !2850, inlinedAt: !2857)
!2859 = !DILocation(line: 926, column: 27, scope: !2850, inlinedAt: !2857)
!2860 = !DILocation(line: 352, column: 20, scope: !2718)
!2861 = !DILocalVariable(name: "this", arg: 1, scope: !2862, type: !1523, flags: DIFlagArtificial | DIFlagObjectPointer)
!2862 = distinct !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm", scope: !49, file: !48, line: 167, type: !197, isLocal: false, isDefinition: true, scopeLine: 168, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !196, retainedNodes: !2863)
!2863 = !{!2861, !2864}
!2864 = !DILocalVariable(name: "__n", arg: 2, scope: !2862, file: !48, line: 167, type: !103)
!2865 = !DILocation(line: 0, scope: !2862, inlinedAt: !2866)
!2866 = distinct !DILocation(line: 353, column: 30, scope: !2718)
!2867 = !DILocation(line: 167, column: 26, scope: !2862, inlinedAt: !2866)
!2868 = !DILocation(line: 170, column: 13, scope: !2862, inlinedAt: !2866)
!2869 = !DILocation(line: 170, column: 9, scope: !2862, inlinedAt: !2866)
!2870 = !DILocalVariable(name: "__a", arg: 1, scope: !2871, file: !58, line: 181, type: !65)
!2871 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m", scope: !59, file: !58, line: 181, type: !63, isLocal: false, isDefinition: true, scopeLine: 182, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !62, retainedNodes: !2872)
!2872 = !{!2870, !2873}
!2873 = !DILocalVariable(name: "__n", arg: 2, scope: !2871, file: !58, line: 181, type: !132)
!2874 = !DILocation(line: 181, column: 22, scope: !2871, inlinedAt: !2875)
!2875 = distinct !DILocation(line: 170, column: 20, scope: !2862, inlinedAt: !2866)
!2876 = !DILocation(line: 181, column: 37, scope: !2871, inlinedAt: !2875)
!2877 = !DILocalVariable(name: "this", arg: 1, scope: !2878, type: !1872, flags: DIFlagArtificial | DIFlagObjectPointer)
!2878 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv", scope: !70, file: !71, line: 99, type: !100, isLocal: false, isDefinition: true, scopeLine: 100, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !99, retainedNodes: !2879)
!2879 = !{!2877, !2880, !2881}
!2880 = !DILocalVariable(name: "__n", arg: 2, scope: !2878, file: !71, line: 99, type: !102)
!2881 = !DILocalVariable(arg: 3, scope: !2878, file: !71, line: 99, type: !106)
!2882 = !DILocation(line: 0, scope: !2878, inlinedAt: !2883)
!2883 = distinct !DILocation(line: 182, column: 18, scope: !2871, inlinedAt: !2875)
!2884 = !DILocation(line: 99, column: 26, scope: !2878, inlinedAt: !2883)
!2885 = !DILocation(line: 99, column: 43, scope: !2878, inlinedAt: !2883)
!2886 = !DILocation(line: 101, column: 10, scope: !2887, inlinedAt: !2883)
!2887 = distinct !DILexicalBlock(scope: !2878, file: !71, line: 101, column: 6)
!2888 = !DILocation(line: 101, column: 6, scope: !2878, inlinedAt: !2883)
!2889 = !DILocation(line: 102, column: 4, scope: !2887, inlinedAt: !2883)
!2890 = !DILocation(line: 104, column: 46, scope: !2878, inlinedAt: !2883)
!2891 = !DILocation(line: 104, column: 27, scope: !2878, inlinedAt: !2883)
!2892 = !DILocation(line: 104, column: 9, scope: !2878, inlinedAt: !2883)
!2893 = !DILocation(line: 372, column: 18, scope: !2894)
!2894 = distinct !DILexicalBlock(scope: !2718, file: !2316, line: 356, column: 6)
!2895 = !DILocation(line: 353, column: 12, scope: !2718)
!2896 = !DILocation(line: 354, column: 12, scope: !2718)
!2897 = !DILocation(line: 188, column: 37, scope: !2235, inlinedAt: !2898)
!2898 = distinct !DILocation(line: 361, column: 8, scope: !2894)
!2899 = !DILocation(line: 188, column: 66, scope: !2235, inlinedAt: !2898)
!2900 = !DILocation(line: 0, scope: !2248, inlinedAt: !2901)
!2901 = distinct !DILocation(line: 189, column: 13, scope: !2235, inlinedAt: !2898)
!2902 = !DILocation(line: 129, column: 41, scope: !2248, inlinedAt: !2901)
!2903 = !DILocation(line: 130, column: 23, scope: !2248, inlinedAt: !2901)
!2904 = !DILocation(line: 130, column: 28, scope: !2248, inlinedAt: !2901)
!2905 = !DILocalVariable(name: "__first", arg: 1, scope: !2906, file: !2545, line: 297, type: !87)
!2906 = distinct !DISubprogram(name: "__uninitialized_move_if_noexcept_a<record *, record *, std::allocator<record> >", linkageName: "_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_", scope: !15, file: !2545, line: 297, type: !2907, isLocal: false, isDefinition: true, scopeLine: 301, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2913, retainedNodes: !2909)
!2907 = !DISubroutineType(types: !2908)
!2908 = !{!87, !87, !87, !87, !65}
!2909 = !{!2905, !2910, !2911, !2912}
!2910 = !DILocalVariable(name: "__last", arg: 2, scope: !2906, file: !2545, line: 298, type: !87)
!2911 = !DILocalVariable(name: "__result", arg: 3, scope: !2906, file: !2545, line: 299, type: !87)
!2912 = !DILocalVariable(name: "__alloc", arg: 4, scope: !2906, file: !2545, line: 300, type: !65)
!2913 = !{!2914, !2915, !2916}
!2914 = !DITemplateTypeParameter(name: "_InputIterator", type: !87)
!2915 = !DITemplateTypeParameter(name: "_ForwardIterator", type: !87)
!2916 = !DITemplateTypeParameter(name: "_Allocator", type: !66)
!2917 = !DILocation(line: 297, column: 55, scope: !2906, inlinedAt: !2918)
!2918 = distinct !DILocation(line: 371, column: 5, scope: !2894)
!2919 = !DILocation(line: 298, column: 27, scope: !2906, inlinedAt: !2918)
!2920 = !DILocation(line: 299, column: 29, scope: !2906, inlinedAt: !2918)
!2921 = !DILocalVariable(name: "__first", arg: 1, scope: !2922, file: !2545, line: 279, type: !87)
!2922 = distinct !DISubprogram(name: "__uninitialized_copy_a<record *, record *, record>", linkageName: "_ZSt22__uninitialized_copy_aIP6recordS1_S0_ET0_T_S3_S2_RSaIT1_E", scope: !15, file: !2545, line: 279, type: !2907, isLocal: false, isDefinition: true, scopeLine: 281, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2927, retainedNodes: !2923)
!2923 = !{!2921, !2924, !2925, !2926}
!2924 = !DILocalVariable(name: "__last", arg: 2, scope: !2922, file: !2545, line: 279, type: !87)
!2925 = !DILocalVariable(name: "__result", arg: 3, scope: !2922, file: !2545, line: 280, type: !87)
!2926 = !DILocalVariable(arg: 4, scope: !2922, file: !2545, line: 280, type: !65)
!2927 = !{!2914, !2915, !121}
!2928 = !DILocation(line: 279, column: 43, scope: !2922, inlinedAt: !2929)
!2929 = distinct !DILocation(line: 302, column: 14, scope: !2906, inlinedAt: !2918)
!2930 = !DILocation(line: 279, column: 67, scope: !2922, inlinedAt: !2929)
!2931 = !DILocation(line: 280, column: 24, scope: !2922, inlinedAt: !2929)
!2932 = !DILocalVariable(name: "__first", arg: 1, scope: !2933, file: !2545, line: 107, type: !87)
!2933 = distinct !DISubprogram(name: "uninitialized_copy<record *, record *>", linkageName: "_ZSt18uninitialized_copyIP6recordS1_ET0_T_S3_S2_", scope: !15, file: !2545, line: 107, type: !2745, isLocal: false, isDefinition: true, scopeLine: 109, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2938, retainedNodes: !2934)
!2934 = !{!2932, !2935, !2936, !2937}
!2935 = !DILocalVariable(name: "__last", arg: 2, scope: !2933, file: !2545, line: 107, type: !87)
!2936 = !DILocalVariable(name: "__result", arg: 3, scope: !2933, file: !2545, line: 108, type: !87)
!2937 = !DILocalVariable(name: "__assignable", scope: !2933, file: !2545, line: 115, type: !2382)
!2938 = !{!2914, !2915}
!2939 = !DILocation(line: 107, column: 39, scope: !2933, inlinedAt: !2940)
!2940 = distinct !DILocation(line: 281, column: 14, scope: !2922, inlinedAt: !2929)
!2941 = !DILocation(line: 107, column: 63, scope: !2933, inlinedAt: !2940)
!2942 = !DILocation(line: 108, column: 27, scope: !2933, inlinedAt: !2940)
!2943 = !DILocation(line: 115, column: 18, scope: !2933, inlinedAt: !2940)
!2944 = !DILocalVariable(name: "__first", arg: 1, scope: !2945, file: !2545, line: 91, type: !87)
!2945 = distinct !DISubprogram(name: "__uninit_copy<record *, record *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_", scope: !2585, file: !2545, line: 91, type: !2745, isLocal: false, isDefinition: true, scopeLine: 93, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2938, declaration: !2946, retainedNodes: !2947)
!2946 = !DISubprogram(name: "__uninit_copy<record *, record *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_", scope: !2585, file: !2545, line: 91, type: !2745, isLocal: false, isDefinition: false, scopeLine: 91, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true, templateParams: !2938)
!2947 = !{!2944, !2948, !2949}
!2948 = !DILocalVariable(name: "__last", arg: 2, scope: !2945, file: !2545, line: 91, type: !87)
!2949 = !DILocalVariable(name: "__result", arg: 3, scope: !2945, file: !2545, line: 92, type: !87)
!2950 = !DILocation(line: 91, column: 38, scope: !2945, inlinedAt: !2951)
!2951 = distinct !DILocation(line: 123, column: 14, scope: !2933, inlinedAt: !2940)
!2952 = !DILocation(line: 91, column: 62, scope: !2945, inlinedAt: !2951)
!2953 = !DILocation(line: 92, column: 26, scope: !2945, inlinedAt: !2951)
!2954 = !DILocalVariable(name: "__first", arg: 1, scope: !2955, file: !2352, line: 462, type: !87)
!2955 = distinct !DISubprogram(name: "copy<record *, record *>", linkageName: "_ZSt4copyIP6recordS1_ET0_T_S3_S2_", scope: !15, file: !2352, line: 462, type: !2745, isLocal: false, isDefinition: true, scopeLine: 463, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2959, retainedNodes: !2956)
!2956 = !{!2954, !2957, !2958}
!2957 = !DILocalVariable(name: "__last", arg: 2, scope: !2955, file: !2352, line: 462, type: !87)
!2958 = !DILocalVariable(name: "__result", arg: 3, scope: !2955, file: !2352, line: 462, type: !87)
!2959 = !{!2960, !2961}
!2960 = !DITemplateTypeParameter(name: "_II", type: !87)
!2961 = !DITemplateTypeParameter(name: "_OI", type: !87)
!2962 = !DILocation(line: 462, column: 14, scope: !2955, inlinedAt: !2963)
!2963 = distinct !DILocation(line: 93, column: 18, scope: !2945, inlinedAt: !2951)
!2964 = !DILocation(line: 462, column: 27, scope: !2955, inlinedAt: !2963)
!2965 = !DILocation(line: 462, column: 39, scope: !2955, inlinedAt: !2963)
!2966 = !DILocalVariable(name: "__first", arg: 1, scope: !2967, file: !2352, line: 436, type: !87)
!2967 = distinct !DISubprogram(name: "__copy_move_a2<false, record *, record *>", linkageName: "_ZSt14__copy_move_a2ILb0EP6recordS1_ET1_T0_S3_S2_", scope: !15, file: !2352, line: 436, type: !2745, isLocal: false, isDefinition: true, scopeLine: 437, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2971, retainedNodes: !2968)
!2968 = !{!2966, !2969, !2970}
!2969 = !DILocalVariable(name: "__last", arg: 2, scope: !2967, file: !2352, line: 436, type: !87)
!2970 = !DILocalVariable(name: "__result", arg: 3, scope: !2967, file: !2352, line: 436, type: !87)
!2971 = !{!2371, !2960, !2961}
!2972 = !DILocation(line: 436, column: 24, scope: !2967, inlinedAt: !2973)
!2973 = distinct !DILocation(line: 470, column: 15, scope: !2955, inlinedAt: !2963)
!2974 = !DILocation(line: 436, column: 37, scope: !2967, inlinedAt: !2973)
!2975 = !DILocation(line: 436, column: 49, scope: !2967, inlinedAt: !2973)
!2976 = !DILocalVariable(name: "__first", arg: 1, scope: !2977, file: !2352, line: 391, type: !87)
!2977 = distinct !DISubprogram(name: "__copy_move_a<false, record *, record *>", linkageName: "_ZSt13__copy_move_aILb0EP6recordS1_ET1_T0_S3_S2_", scope: !15, file: !2352, line: 391, type: !2745, isLocal: false, isDefinition: true, scopeLine: 392, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2971, retainedNodes: !2978)
!2978 = !{!2976, !2979, !2980, !2981}
!2979 = !DILocalVariable(name: "__last", arg: 2, scope: !2977, file: !2352, line: 391, type: !87)
!2980 = !DILocalVariable(name: "__result", arg: 3, scope: !2977, file: !2352, line: 391, type: !87)
!2981 = !DILocalVariable(name: "__simple", scope: !2977, file: !2352, line: 396, type: !2382)
!2982 = !DILocation(line: 391, column: 23, scope: !2977, inlinedAt: !2983)
!2983 = distinct !DILocation(line: 438, column: 18, scope: !2967, inlinedAt: !2973)
!2984 = !DILocation(line: 391, column: 36, scope: !2977, inlinedAt: !2983)
!2985 = !DILocation(line: 391, column: 48, scope: !2977, inlinedAt: !2983)
!2986 = !DILocation(line: 396, column: 18, scope: !2977, inlinedAt: !2983)
!2987 = !DILocalVariable(name: "__first", arg: 1, scope: !2988, file: !2352, line: 373, type: !95)
!2988 = distinct !DISubprogram(name: "__copy_m<record>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_", scope: !2631, file: !2352, line: 373, type: !2777, isLocal: false, isDefinition: true, scopeLine: 374, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !120, declaration: !2989, retainedNodes: !2990)
!2989 = !DISubprogram(name: "__copy_m<record>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_", scope: !2631, file: !2352, line: 373, type: !2777, isLocal: false, isDefinition: false, scopeLine: 373, flags: DIFlagPrototyped | DIFlagStaticMember, isOptimized: true, templateParams: !120)
!2990 = !{!2987, !2991, !2992, !2993}
!2991 = !DILocalVariable(name: "__last", arg: 2, scope: !2988, file: !2352, line: 373, type: !95)
!2992 = !DILocalVariable(name: "__result", arg: 3, scope: !2988, file: !2352, line: 373, type: !87)
!2993 = !DILocalVariable(name: "_Num", scope: !2988, file: !2352, line: 382, type: !2412)
!2994 = !DILocation(line: 373, column: 29, scope: !2988, inlinedAt: !2995)
!2995 = distinct !DILocation(line: 401, column: 14, scope: !2977, inlinedAt: !2983)
!2996 = !DILocation(line: 373, column: 49, scope: !2988, inlinedAt: !2995)
!2997 = !DILocation(line: 373, column: 62, scope: !2988, inlinedAt: !2995)
!2998 = !DILocation(line: 382, column: 34, scope: !2988, inlinedAt: !2995)
!2999 = !DILocation(line: 382, column: 20, scope: !2988, inlinedAt: !2995)
!3000 = !DILocation(line: 383, column: 8, scope: !3001, inlinedAt: !2995)
!3001 = distinct !DILexicalBlock(scope: !2988, file: !2352, line: 383, column: 8)
!3002 = !DILocation(line: 383, column: 8, scope: !2988, inlinedAt: !2995)
!3003 = !DILocation(line: 384, column: 6, scope: !3001, inlinedAt: !2995)
!3004 = !DILocation(line: 385, column: 20, scope: !2988, inlinedAt: !2995)
!3005 = !DILocation(line: 375, column: 8, scope: !2894)
!3006 = !DILocation(line: 379, column: 37, scope: !2894)
!3007 = !DILocation(line: 297, column: 55, scope: !2906, inlinedAt: !3008)
!3008 = distinct !DILocation(line: 378, column: 5, scope: !2894)
!3009 = !DILocation(line: 298, column: 27, scope: !2906, inlinedAt: !3008)
!3010 = !DILocation(line: 299, column: 29, scope: !2906, inlinedAt: !3008)
!3011 = !DILocation(line: 279, column: 43, scope: !2922, inlinedAt: !3012)
!3012 = distinct !DILocation(line: 302, column: 14, scope: !2906, inlinedAt: !3008)
!3013 = !DILocation(line: 279, column: 67, scope: !2922, inlinedAt: !3012)
!3014 = !DILocation(line: 280, column: 24, scope: !2922, inlinedAt: !3012)
!3015 = !DILocation(line: 107, column: 39, scope: !2933, inlinedAt: !3016)
!3016 = distinct !DILocation(line: 281, column: 14, scope: !2922, inlinedAt: !3012)
!3017 = !DILocation(line: 107, column: 63, scope: !2933, inlinedAt: !3016)
!3018 = !DILocation(line: 108, column: 27, scope: !2933, inlinedAt: !3016)
!3019 = !DILocation(line: 115, column: 18, scope: !2933, inlinedAt: !3016)
!3020 = !DILocation(line: 91, column: 38, scope: !2945, inlinedAt: !3021)
!3021 = distinct !DILocation(line: 123, column: 14, scope: !2933, inlinedAt: !3016)
!3022 = !DILocation(line: 91, column: 62, scope: !2945, inlinedAt: !3021)
!3023 = !DILocation(line: 92, column: 26, scope: !2945, inlinedAt: !3021)
!3024 = !DILocation(line: 462, column: 14, scope: !2955, inlinedAt: !3025)
!3025 = distinct !DILocation(line: 93, column: 18, scope: !2945, inlinedAt: !3021)
!3026 = !DILocation(line: 462, column: 27, scope: !2955, inlinedAt: !3025)
!3027 = !DILocation(line: 462, column: 39, scope: !2955, inlinedAt: !3025)
!3028 = !DILocation(line: 436, column: 24, scope: !2967, inlinedAt: !3029)
!3029 = distinct !DILocation(line: 470, column: 15, scope: !2955, inlinedAt: !3025)
!3030 = !DILocation(line: 436, column: 37, scope: !2967, inlinedAt: !3029)
!3031 = !DILocation(line: 436, column: 49, scope: !2967, inlinedAt: !3029)
!3032 = !DILocation(line: 391, column: 23, scope: !2977, inlinedAt: !3033)
!3033 = distinct !DILocation(line: 438, column: 18, scope: !2967, inlinedAt: !3029)
!3034 = !DILocation(line: 391, column: 36, scope: !2977, inlinedAt: !3033)
!3035 = !DILocation(line: 391, column: 48, scope: !2977, inlinedAt: !3033)
!3036 = !DILocation(line: 396, column: 18, scope: !2977, inlinedAt: !3033)
!3037 = !DILocation(line: 373, column: 29, scope: !2988, inlinedAt: !3038)
!3038 = distinct !DILocation(line: 401, column: 14, scope: !2977, inlinedAt: !3033)
!3039 = !DILocation(line: 373, column: 49, scope: !2988, inlinedAt: !3038)
!3040 = !DILocation(line: 373, column: 62, scope: !2988, inlinedAt: !3038)
!3041 = !DILocation(line: 382, column: 34, scope: !2988, inlinedAt: !3038)
!3042 = !DILocation(line: 382, column: 20, scope: !2988, inlinedAt: !3038)
!3043 = !DILocation(line: 383, column: 8, scope: !3001, inlinedAt: !3038)
!3044 = !DILocation(line: 383, column: 8, scope: !2988, inlinedAt: !3038)
!3045 = !DILocation(line: 384, column: 6, scope: !3001, inlinedAt: !3038)
!3046 = !DILocation(line: 385, column: 20, scope: !2988, inlinedAt: !3038)
!3047 = !DILocation(line: 0, scope: !1849, inlinedAt: !3048)
!3048 = distinct !DILocation(line: 394, column: 4, scope: !2718)
!3049 = !DILocation(line: 174, column: 29, scope: !1849, inlinedAt: !3048)
!3050 = !DILocation(line: 177, column: 6, scope: !1857, inlinedAt: !3048)
!3051 = !DILocation(line: 177, column: 6, scope: !1849, inlinedAt: !3048)
!3052 = !DILocation(line: 184, column: 36, scope: !1860, inlinedAt: !3053)
!3053 = distinct !DILocation(line: 178, column: 4, scope: !1857, inlinedAt: !3048)
!3054 = !DILocation(line: 184, column: 49, scope: !1860, inlinedAt: !3053)
!3055 = !DILocation(line: 0, scope: !1868, inlinedAt: !3056)
!3056 = distinct !DILocation(line: 185, column: 11, scope: !1860, inlinedAt: !3053)
!3057 = !DILocation(line: 109, column: 26, scope: !1868, inlinedAt: !3056)
!3058 = !DILocation(line: 110, column: 27, scope: !1868, inlinedAt: !3056)
!3059 = !DILocation(line: 110, column: 9, scope: !1868, inlinedAt: !3056)
!3060 = !DILocation(line: 178, column: 4, scope: !1857, inlinedAt: !3048)
!3061 = !DILocation(line: 397, column: 27, scope: !2718)
!3062 = !DILocation(line: 398, column: 28, scope: !2718)
!3063 = !DILocation(line: 399, column: 50, scope: !2718)
!3064 = !DILocation(line: 399, column: 36, scope: !2718)
!3065 = !DILocation(line: 401, column: 5, scope: !2709)
