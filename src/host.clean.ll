; ModuleID = 'axpy.cu'
source_filename = "axpy.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C1Ejjj = comdat any

$_ZN4dim3C2Ejjj = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@.str = private unnamed_addr constant [61 x i8] c"usage: ./axpy [blocks_x] [blocks_y] [threads_x] [threads_y]\0A\00", align 1
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str.1 = private unnamed_addr constant [21 x i8] c"launching kernel...\0A\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"CUDA error: %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"y[\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"] = \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [38 x i8] c"\0A\0A[TOOL verify] There are a total of\09\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c" incorrect numbers.\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"[TOOL verify] passed!\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_axpy.cu, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !1037 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !1039
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #2, !dbg !1039
  ret void, !dbg !1039
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #2

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z12axpy_kernel2fPfS_(float %a, float* %x, float* %y) #3 !dbg !1040 {
entry:
  %a.addr = alloca float, align 4
  %x.addr = alloca float*, align 8
  %y.addr = alloca float*, align 8
  store float %a, float* %a.addr, align 4
  call void @llvm.dbg.declare(metadata float* %a.addr, metadata !1043, metadata !DIExpression()), !dbg !1044
  store float* %x, float** %x.addr, align 8
  call void @llvm.dbg.declare(metadata float** %x.addr, metadata !1045, metadata !DIExpression()), !dbg !1046
  store float* %y, float** %y.addr, align 8
  call void @llvm.dbg.declare(metadata float** %y.addr, metadata !1047, metadata !DIExpression()), !dbg !1048
  %0 = bitcast float* %a.addr to i8*, !dbg !1049
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !1049
  %2 = icmp eq i32 %1, 0, !dbg !1049
  br i1 %2, label %setup.next, label %setup.end, !dbg !1049

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %x.addr to i8*, !dbg !1049
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !1049
  %5 = icmp eq i32 %4, 0, !dbg !1049
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1049

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %y.addr to i8*, !dbg !1049
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !1049
  %8 = icmp eq i32 %7, 0, !dbg !1049
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1049

setup.next2:                                      ; preds = %setup.next1
  %9 = call i32 @cudaLaunch(i8* bitcast (void (float, float*, float*)* @_Z12axpy_kernel2fPfS_ to i8*)), !dbg !1049
  br label %setup.end, !dbg !1049

setup.end:                                        ; preds = %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1050
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #4

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z12axpy_kernel1fPfS_(float %a, float* %x, float* %y) #3 !dbg !1051 {
entry:
  %a.addr = alloca float, align 4
  %x.addr = alloca float*, align 8
  %y.addr = alloca float*, align 8
  store float %a, float* %a.addr, align 4
  call void @llvm.dbg.declare(metadata float* %a.addr, metadata !1052, metadata !DIExpression()), !dbg !1053
  store float* %x, float** %x.addr, align 8
  call void @llvm.dbg.declare(metadata float** %x.addr, metadata !1054, metadata !DIExpression()), !dbg !1055
  store float* %y, float** %y.addr, align 8
  call void @llvm.dbg.declare(metadata float** %y.addr, metadata !1056, metadata !DIExpression()), !dbg !1057
  %0 = bitcast float* %a.addr to i8*, !dbg !1058
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 4, i64 0), !dbg !1058
  %2 = icmp eq i32 %1, 0, !dbg !1058
  br i1 %2, label %setup.next, label %setup.end, !dbg !1058

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %x.addr to i8*, !dbg !1058
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8), !dbg !1058
  %5 = icmp eq i32 %4, 0, !dbg !1058
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1058

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %y.addr to i8*, !dbg !1058
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16), !dbg !1058
  %8 = icmp eq i32 %7, 0, !dbg !1058
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1058

setup.next2:                                      ; preds = %setup.next1
  %9 = call i32 @cudaLaunch(i8* bitcast (void (float, float*, float*)* @_Z12axpy_kernel1fPfS_ to i8*)), !dbg !1058
  br label %setup.end, !dbg !1058

setup.end:                                        ; preds = %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1059
}

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #5 !dbg !1060 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %a = alloca float, align 4
  %blocksx = alloca i32, align 4
  %blocksy = alloca i32, align 4
  %kDataLenx = alloca i32, align 4
  %kDataLeny = alloca i32, align 4
  %sizen = alloca i32, align 4
  %host_x = alloca float*, align 8
  %host_y = alloca float*, align 8
  %host_newbu = alloca i8*, align 8
  %ii = alloca i32, align 4
  %device_x = alloca float*, align 8
  %device_y = alloca float*, align 8
  %CTAs = alloca %struct.dim3, align 4
  %Threads = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp44 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp44.coerce = alloca { i64, i32 }, align 4
  %error = alloca i32, align 4
  %agg.tmp53 = alloca %struct.dim3, align 4
  %agg.tmp54 = alloca %struct.dim3, align 4
  %agg.tmp53.coerce = alloca { i64, i32 }, align 4
  %agg.tmp54.coerce = alloca { i64, i32 }, align 4
  %verify = alloca i32, align 4
  %ii69 = alloca i32, align 4
  %ii83 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !1063, metadata !DIExpression()), !dbg !1064
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !1065, metadata !DIExpression()), !dbg !1066
  call void @llvm.dbg.declare(metadata float* %a, metadata !1067, metadata !DIExpression()), !dbg !1068
  store float 2.000000e+00, float* %a, align 4, !dbg !1068
  %call = call i32 @cudaSetDevice(i32 0), !dbg !1069
  %0 = load i32, i32* %argc.addr, align 4, !dbg !1070
  %cmp = icmp ne i32 %0, 5, !dbg !1072
  br i1 %cmp, label %if.then, label %if.end, !dbg !1073

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str, i32 0, i32 0)), !dbg !1074
  call void @exit(i32 1) #11, !dbg !1076
  unreachable, !dbg !1076

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %blocksx, metadata !1077, metadata !DIExpression()), !dbg !1078
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1079
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !1079
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !1079
  %call2 = call i32 @atoi(i8* %2) #12, !dbg !1080
  store i32 %call2, i32* %blocksx, align 4, !dbg !1078
  call void @llvm.dbg.declare(metadata i32* %blocksy, metadata !1081, metadata !DIExpression()), !dbg !1082
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !1083
  %arrayidx3 = getelementptr inbounds i8*, i8** %3, i64 2, !dbg !1083
  %4 = load i8*, i8** %arrayidx3, align 8, !dbg !1083
  %call4 = call i32 @atoi(i8* %4) #12, !dbg !1084
  store i32 %call4, i32* %blocksy, align 4, !dbg !1082
  call void @llvm.dbg.declare(metadata i32* %kDataLenx, metadata !1085, metadata !DIExpression()), !dbg !1086
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !1087
  %arrayidx5 = getelementptr inbounds i8*, i8** %5, i64 3, !dbg !1087
  %6 = load i8*, i8** %arrayidx5, align 8, !dbg !1087
  %call6 = call i32 @atoi(i8* %6) #12, !dbg !1088
  store i32 %call6, i32* %kDataLenx, align 4, !dbg !1086
  call void @llvm.dbg.declare(metadata i32* %kDataLeny, metadata !1089, metadata !DIExpression()), !dbg !1090
  %7 = load i8**, i8*** %argv.addr, align 8, !dbg !1091
  %arrayidx7 = getelementptr inbounds i8*, i8** %7, i64 4, !dbg !1091
  %8 = load i8*, i8** %arrayidx7, align 8, !dbg !1091
  %call8 = call i32 @atoi(i8* %8) #12, !dbg !1092
  store i32 %call8, i32* %kDataLeny, align 4, !dbg !1090
  call void @llvm.dbg.declare(metadata i32* %sizen, metadata !1093, metadata !DIExpression()), !dbg !1094
  %9 = load i32, i32* %blocksx, align 4, !dbg !1095
  %10 = load i32, i32* %blocksy, align 4, !dbg !1096
  %mul = mul nsw i32 %9, %10, !dbg !1097
  %11 = load i32, i32* %kDataLenx, align 4, !dbg !1098
  %mul9 = mul nsw i32 %mul, %11, !dbg !1099
  %12 = load i32, i32* %kDataLeny, align 4, !dbg !1100
  %mul10 = mul nsw i32 %mul9, %12, !dbg !1101
  store i32 %mul10, i32* %sizen, align 4, !dbg !1094
  %call11 = call i32 @cudaDeviceSetLimit(i32 2, i64 524288000), !dbg !1102
  call void @llvm.dbg.declare(metadata float** %host_x, metadata !1103, metadata !DIExpression()), !dbg !1104
  %13 = load i32, i32* %sizen, align 4, !dbg !1105
  %conv = sext i32 %13 to i64, !dbg !1105
  %mul12 = mul i64 %conv, 4, !dbg !1106
  %call13 = call noalias i8* @malloc(i64 %mul12) #2, !dbg !1107
  %14 = bitcast i8* %call13 to float*, !dbg !1108
  store float* %14, float** %host_x, align 8, !dbg !1104
  call void @llvm.dbg.declare(metadata float** %host_y, metadata !1109, metadata !DIExpression()), !dbg !1110
  %15 = load i32, i32* %sizen, align 4, !dbg !1111
  %conv14 = sext i32 %15 to i64, !dbg !1111
  %mul15 = mul i64 %conv14, 4, !dbg !1112
  %call16 = call noalias i8* @malloc(i64 %mul15) #2, !dbg !1113
  %16 = bitcast i8* %call16 to float*, !dbg !1114
  store float* %16, float** %host_y, align 8, !dbg !1110
  call void @llvm.dbg.declare(metadata i8** %host_newbu, metadata !1115, metadata !DIExpression()), !dbg !1116
  %call17 = call noalias i8* @malloc(i64 1000) #2, !dbg !1117
  store i8* %call17, i8** %host_newbu, align 8, !dbg !1116
  call void @llvm.dbg.declare(metadata i32* %ii, metadata !1118, metadata !DIExpression()), !dbg !1119
  store i32 0, i32* %ii, align 4, !dbg !1120
  br label %for.cond, !dbg !1122

for.cond:                                         ; preds = %for.inc, %if.end
  %17 = load i32, i32* %ii, align 4, !dbg !1123
  %18 = load i32, i32* %sizen, align 4, !dbg !1125
  %cmp18 = icmp slt i32 %17, %18, !dbg !1126
  br i1 %cmp18, label %for.body, label %for.end, !dbg !1127

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %ii, align 4, !dbg !1128
  %rem = srem i32 %19, 8, !dbg !1129
  %conv19 = sitofp i32 %rem to float, !dbg !1128
  %20 = load float*, float** %host_x, align 8, !dbg !1130
  %21 = load i32, i32* %ii, align 4, !dbg !1131
  %idxprom = sext i32 %21 to i64, !dbg !1130
  %arrayidx20 = getelementptr inbounds float, float* %20, i64 %idxprom, !dbg !1130
  store float %conv19, float* %arrayidx20, align 4, !dbg !1132
  br label %for.inc, !dbg !1130

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %ii, align 4, !dbg !1133
  %inc = add nsw i32 %22, 1, !dbg !1133
  store i32 %inc, i32* %ii, align 4, !dbg !1133
  br label %for.cond, !dbg !1134, !llvm.loop !1135

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %ii, align 4, !dbg !1137
  br label %for.cond21, !dbg !1139

for.cond21:                                       ; preds = %for.inc28, %for.end
  %23 = load i32, i32* %ii, align 4, !dbg !1140
  %24 = load i32, i32* %sizen, align 4, !dbg !1142
  %cmp22 = icmp slt i32 %23, %24, !dbg !1143
  br i1 %cmp22, label %for.body23, label %for.end30, !dbg !1144

for.body23:                                       ; preds = %for.cond21
  %25 = load i32, i32* %ii, align 4, !dbg !1145
  %rem24 = srem i32 %25, 5, !dbg !1146
  %conv25 = sitofp i32 %rem24 to float, !dbg !1145
  %26 = load float*, float** %host_y, align 8, !dbg !1147
  %27 = load i32, i32* %ii, align 4, !dbg !1148
  %idxprom26 = sext i32 %27 to i64, !dbg !1147
  %arrayidx27 = getelementptr inbounds float, float* %26, i64 %idxprom26, !dbg !1147
  store float %conv25, float* %arrayidx27, align 4, !dbg !1149
  br label %for.inc28, !dbg !1147

for.inc28:                                        ; preds = %for.body23
  %28 = load i32, i32* %ii, align 4, !dbg !1150
  %inc29 = add nsw i32 %28, 1, !dbg !1150
  store i32 %inc29, i32* %ii, align 4, !dbg !1150
  br label %for.cond21, !dbg !1151, !llvm.loop !1152

for.end30:                                        ; preds = %for.cond21
  call void @llvm.dbg.declare(metadata float** %device_x, metadata !1154, metadata !DIExpression()), !dbg !1155
  call void @llvm.dbg.declare(metadata float** %device_y, metadata !1156, metadata !DIExpression()), !dbg !1157
  %29 = bitcast float** %device_x to i8**, !dbg !1158
  %30 = load i32, i32* %sizen, align 4, !dbg !1159
  %conv31 = sext i32 %30 to i64, !dbg !1159
  %mul32 = mul i64 %conv31, 4, !dbg !1160
  %call33 = call i32 @cudaMalloc(i8** %29, i64 %mul32), !dbg !1161
  %31 = bitcast float** %device_y to i8**, !dbg !1162
  %32 = load i32, i32* %sizen, align 4, !dbg !1163
  %conv34 = sext i32 %32 to i64, !dbg !1163
  %mul35 = mul i64 %conv34, 4, !dbg !1164
  %add = add i64 %mul35, 18, !dbg !1165
  %call36 = call i32 @cudaMalloc(i8** %31, i64 %add), !dbg !1166
  %33 = load float*, float** %device_x, align 8, !dbg !1167
  %34 = bitcast float* %33 to i8*, !dbg !1167
  %35 = load float*, float** %host_x, align 8, !dbg !1168
  %36 = bitcast float* %35 to i8*, !dbg !1168
  %37 = load i32, i32* %sizen, align 4, !dbg !1169
  %conv37 = sext i32 %37 to i64, !dbg !1169
  %mul38 = mul i64 %conv37, 4, !dbg !1170
  %call39 = call i32 @cudaMemcpy(i8* %34, i8* %36, i64 %mul38, i32 1), !dbg !1171
  %38 = load float*, float** %device_y, align 8, !dbg !1172
  %39 = bitcast float* %38 to i8*, !dbg !1172
  %40 = load float*, float** %host_y, align 8, !dbg !1173
  %41 = bitcast float* %40 to i8*, !dbg !1173
  %42 = load i32, i32* %sizen, align 4, !dbg !1174
  %conv40 = sext i32 %42 to i64, !dbg !1174
  %mul41 = mul i64 %conv40, 4, !dbg !1175
  %call42 = call i32 @cudaMemcpy(i8* %39, i8* %41, i64 %mul41, i32 1), !dbg !1176
  call void @llvm.dbg.declare(metadata %struct.dim3* %CTAs, metadata !1177, metadata !DIExpression()), !dbg !1201
  %43 = load i32, i32* %blocksx, align 4, !dbg !1202
  %44 = load i32, i32* %blocksy, align 4, !dbg !1203
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %CTAs, i32 %43, i32 %44, i32 1), !dbg !1201
  call void @llvm.dbg.declare(metadata %struct.dim3* %Threads, metadata !1204, metadata !DIExpression()), !dbg !1205
  %45 = load i32, i32* %kDataLenx, align 4, !dbg !1206
  %46 = load i32, i32* %kDataLeny, align 4, !dbg !1207
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %Threads, i32 %45, i32 %46, i32 1), !dbg !1205
  %call43 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0)), !dbg !1208
  %47 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1209
  %48 = bitcast %struct.dim3* %CTAs to i8*, !dbg !1209
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %47, i8* align 4 %48, i64 12, i1 false), !dbg !1209
  %49 = bitcast %struct.dim3* %agg.tmp44 to i8*, !dbg !1210
  %50 = bitcast %struct.dim3* %Threads to i8*, !dbg !1210
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %49, i8* align 4 %50, i64 12, i1 false), !dbg !1210
  %51 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !1211
  %52 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !1211
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %51, i8* align 4 %52, i64 12, i1 false), !dbg !1211
  %53 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !1211
  %54 = load i64, i64* %53, align 4, !dbg !1211
  %55 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !1211
  %56 = load i32, i32* %55, align 4, !dbg !1211
  %57 = bitcast { i64, i32 }* %agg.tmp44.coerce to i8*, !dbg !1211
  %58 = bitcast %struct.dim3* %agg.tmp44 to i8*, !dbg !1211
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %57, i8* align 4 %58, i64 12, i1 false), !dbg !1211
  %59 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp44.coerce, i32 0, i32 0, !dbg !1211
  %60 = load i64, i64* %59, align 4, !dbg !1211
  %61 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp44.coerce, i32 0, i32 1, !dbg !1211
  %62 = load i32, i32* %61, align 4, !dbg !1211
  %call45 = call i32 @cudaConfigureCall(i64 %54, i32 %56, i64 %60, i32 %62, i64 0, %struct.CUstream_st* null), !dbg !1211
  %tobool = icmp ne i32 %call45, 0, !dbg !1211
  br i1 %tobool, label %kcall.end, label %kcall.configok, !dbg !1212

kcall.configok:                                   ; preds = %for.end30
  %63 = load float, float* %a, align 4, !dbg !1213
  %64 = load float*, float** %device_x, align 8, !dbg !1214
  %65 = load float*, float** %device_y, align 8, !dbg !1215
  call void @_Z12axpy_kernel1fPfS_(float %63, float* %64, float* %65), !dbg !1212
  br label %kcall.end, !dbg !1212

kcall.end:                                        ; preds = %kcall.configok, %for.end30
  %call46 = call i32 @cudaDeviceSynchronize(), !dbg !1216
  call void @llvm.dbg.declare(metadata i32* %error, metadata !1217, metadata !DIExpression()), !dbg !1219
  %call47 = call i32 @cudaGetLastError(), !dbg !1220
  store i32 %call47, i32* %error, align 4, !dbg !1219
  %66 = load i32, i32* %error, align 4, !dbg !1221
  %cmp48 = icmp ne i32 %66, 0, !dbg !1223
  br i1 %cmp48, label %if.then49, label %if.end52, !dbg !1224

if.then49:                                        ; preds = %kcall.end
  %67 = load i32, i32* %error, align 4, !dbg !1225
  %call50 = call i8* @cudaGetErrorString(i32 %67), !dbg !1227
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i8* %call50), !dbg !1228
  call void @exit(i32 -1) #11, !dbg !1229
  unreachable, !dbg !1229

if.end52:                                         ; preds = %kcall.end
  %68 = bitcast %struct.dim3* %agg.tmp53 to i8*, !dbg !1230
  %69 = bitcast %struct.dim3* %CTAs to i8*, !dbg !1230
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %68, i8* align 4 %69, i64 12, i1 false), !dbg !1230
  %70 = bitcast %struct.dim3* %agg.tmp54 to i8*, !dbg !1231
  %71 = bitcast %struct.dim3* %Threads to i8*, !dbg !1231
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %70, i8* align 4 %71, i64 12, i1 false), !dbg !1231
  %72 = bitcast { i64, i32 }* %agg.tmp53.coerce to i8*, !dbg !1232
  %73 = bitcast %struct.dim3* %agg.tmp53 to i8*, !dbg !1232
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %72, i8* align 4 %73, i64 12, i1 false), !dbg !1232
  %74 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp53.coerce, i32 0, i32 0, !dbg !1232
  %75 = load i64, i64* %74, align 4, !dbg !1232
  %76 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp53.coerce, i32 0, i32 1, !dbg !1232
  %77 = load i32, i32* %76, align 4, !dbg !1232
  %78 = bitcast { i64, i32 }* %agg.tmp54.coerce to i8*, !dbg !1232
  %79 = bitcast %struct.dim3* %agg.tmp54 to i8*, !dbg !1232
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %78, i8* align 4 %79, i64 12, i1 false), !dbg !1232
  %80 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp54.coerce, i32 0, i32 0, !dbg !1232
  %81 = load i64, i64* %80, align 4, !dbg !1232
  %82 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp54.coerce, i32 0, i32 1, !dbg !1232
  %83 = load i32, i32* %82, align 4, !dbg !1232
  %call55 = call i32 @cudaConfigureCall(i64 %75, i32 %77, i64 %81, i32 %83, i64 0, %struct.CUstream_st* null), !dbg !1232
  %tobool56 = icmp ne i32 %call55, 0, !dbg !1232
  br i1 %tobool56, label %kcall.end58, label %kcall.configok57, !dbg !1233

kcall.configok57:                                 ; preds = %if.end52
  %84 = load float, float* %a, align 4, !dbg !1234
  %85 = load float*, float** %device_x, align 8, !dbg !1235
  %86 = load float*, float** %device_y, align 8, !dbg !1236
  call void @_Z12axpy_kernel2fPfS_(float %84, float* %85, float* %86), !dbg !1233
  br label %kcall.end58, !dbg !1233

kcall.end58:                                      ; preds = %kcall.configok57, %if.end52
  %call59 = call i32 @cudaDeviceSynchronize(), !dbg !1237
  %call60 = call i32 @cudaGetLastError(), !dbg !1238
  store i32 %call60, i32* %error, align 4, !dbg !1239
  %87 = load i32, i32* %error, align 4, !dbg !1240
  %cmp61 = icmp ne i32 %87, 0, !dbg !1242
  br i1 %cmp61, label %if.then62, label %if.end65, !dbg !1243

if.then62:                                        ; preds = %kcall.end58
  %88 = load i32, i32* %error, align 4, !dbg !1244
  %call63 = call i8* @cudaGetErrorString(i32 %88), !dbg !1246
  %call64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0), i8* %call63), !dbg !1247
  call void @exit(i32 -1) #11, !dbg !1248
  unreachable, !dbg !1248

if.end65:                                         ; preds = %kcall.end58
  %89 = load float*, float** %host_y, align 8, !dbg !1249
  %90 = bitcast float* %89 to i8*, !dbg !1249
  %91 = load float*, float** %device_y, align 8, !dbg !1250
  %92 = bitcast float* %91 to i8*, !dbg !1250
  %93 = load i32, i32* %sizen, align 4, !dbg !1251
  %conv66 = sext i32 %93 to i64, !dbg !1251
  %mul67 = mul i64 %conv66, 4, !dbg !1252
  %call68 = call i32 @cudaMemcpy(i8* %90, i8* %92, i64 %mul67, i32 2), !dbg !1253
  %94 = load i8*, i8** %host_newbu, align 8, !dbg !1254
  call void @free(i8* %94) #2, !dbg !1255
  call void @llvm.dbg.declare(metadata i32* %verify, metadata !1256, metadata !DIExpression()), !dbg !1257
  store i32 0, i32* %verify, align 4, !dbg !1257
  call void @llvm.dbg.declare(metadata i32* %ii69, metadata !1258, metadata !DIExpression()), !dbg !1260
  store i32 0, i32* %ii69, align 4, !dbg !1260
  br label %for.cond70, !dbg !1261

for.cond70:                                       ; preds = %for.inc80, %if.end65
  %95 = load i32, i32* %ii69, align 4, !dbg !1262
  %cmp71 = icmp slt i32 %95, 8, !dbg !1264
  br i1 %cmp71, label %for.body72, label %for.end82, !dbg !1265

for.body72:                                       ; preds = %for.cond70
  %call73 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0)), !dbg !1266
  %96 = load i32, i32* %ii69, align 4, !dbg !1267
  %call74 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call73, i32 %96), !dbg !1268
  %call75 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call74, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0)), !dbg !1269
  %97 = load float*, float** %host_y, align 8, !dbg !1270
  %98 = load i32, i32* %ii69, align 4, !dbg !1271
  %idxprom76 = sext i32 %98 to i64, !dbg !1270
  %arrayidx77 = getelementptr inbounds float, float* %97, i64 %idxprom76, !dbg !1270
  %99 = load float, float* %arrayidx77, align 4, !dbg !1270
  %call78 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEf(%"class.std::basic_ostream"* %call75, float %99), !dbg !1272
  %call79 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call78, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0)), !dbg !1273
  br label %for.inc80, !dbg !1274

for.inc80:                                        ; preds = %for.body72
  %100 = load i32, i32* %ii69, align 4, !dbg !1275
  %inc81 = add nsw i32 %100, 1, !dbg !1275
  store i32 %inc81, i32* %ii69, align 4, !dbg !1275
  br label %for.cond70, !dbg !1276, !llvm.loop !1277

for.end82:                                        ; preds = %for.cond70
  call void @llvm.dbg.declare(metadata i32* %ii83, metadata !1279, metadata !DIExpression()), !dbg !1281
  store i32 0, i32* %ii83, align 4, !dbg !1281
  br label %for.cond84, !dbg !1282

for.cond84:                                       ; preds = %for.inc95, %for.end82
  %101 = load i32, i32* %ii83, align 4, !dbg !1283
  %102 = load i32, i32* %sizen, align 4, !dbg !1285
  %cmp85 = icmp slt i32 %101, %102, !dbg !1286
  br i1 %cmp85, label %for.body86, label %for.end97, !dbg !1287

for.body86:                                       ; preds = %for.cond84
  %103 = load float*, float** %host_y, align 8, !dbg !1288
  %104 = load i32, i32* %ii83, align 4, !dbg !1291
  %idxprom87 = sext i32 %104 to i64, !dbg !1288
  %arrayidx88 = getelementptr inbounds float, float* %103, i64 %idxprom87, !dbg !1288
  %105 = load float, float* %arrayidx88, align 4, !dbg !1288
  %106 = load i32, i32* %ii83, align 4, !dbg !1292
  %rem89 = srem i32 %106, 5, !dbg !1293
  %conv90 = sitofp i32 %rem89 to float, !dbg !1292
  %cmp91 = fcmp oeq float %105, %conv90, !dbg !1294
  br i1 %cmp91, label %if.then92, label %if.end94, !dbg !1295

if.then92:                                        ; preds = %for.body86
  %107 = load i32, i32* %verify, align 4, !dbg !1296
  %inc93 = add nsw i32 %107, 1, !dbg !1296
  store i32 %inc93, i32* %verify, align 4, !dbg !1296
  br label %if.end94, !dbg !1297

if.end94:                                         ; preds = %if.then92, %for.body86
  br label %for.inc95, !dbg !1298

for.inc95:                                        ; preds = %if.end94
  %108 = load i32, i32* %ii83, align 4, !dbg !1299
  %inc96 = add nsw i32 %108, 1, !dbg !1299
  store i32 %inc96, i32* %ii83, align 4, !dbg !1299
  br label %for.cond84, !dbg !1300, !llvm.loop !1301

for.end97:                                        ; preds = %for.cond84
  %call98 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.6, i32 0, i32 0)), !dbg !1303
  %109 = load i32, i32* %verify, align 4, !dbg !1304
  %call99 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call98, i32 %109), !dbg !1305
  %call100 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call99, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i32 0, i32 0)), !dbg !1306
  %call101 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call100, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1307
  %110 = load i32, i32* %verify, align 4, !dbg !1308
  %cmp102 = icmp eq i32 %110, 0, !dbg !1310
  br i1 %cmp102, label %if.then103, label %if.end107, !dbg !1311

if.then103:                                       ; preds = %for.end97
  %call104 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i32 0, i32 0)), !dbg !1312
  %call105 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call104, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1313
  %call106 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call105, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1314
  br label %if.end107, !dbg !1315

if.end107:                                        ; preds = %if.then103, %for.end97
  %111 = load float*, float** %device_x, align 8, !dbg !1316
  %112 = bitcast float* %111 to i8*, !dbg !1316
  %call108 = call i32 @cudaFree(i8* %112), !dbg !1317
  %113 = load float*, float** %device_y, align 8, !dbg !1318
  %114 = bitcast float* %113 to i8*, !dbg !1318
  %call109 = call i32 @cudaFree(i8* %114), !dbg !1319
  %call110 = call i32 @cudaDeviceReset(), !dbg !1320
  ret i32 0, !dbg !1321
}

declare dso_local i32 @cudaSetDevice(i32) #1

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #7

declare dso_local i32 @cudaDeviceSetLimit(i32, i64) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #8

declare dso_local i32 @cudaMalloc(i8**, i64) #1

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #1

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C1Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #3 comdat align 2 !dbg !1322 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1323, metadata !DIExpression()), !dbg !1325
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1326, metadata !DIExpression()), !dbg !1327
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1328, metadata !DIExpression()), !dbg !1329
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1330, metadata !DIExpression()), !dbg !1331
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1332
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1332
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1332
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %this1, i32 %0, i32 %1, i32 %2), !dbg !1332
  ret void, !dbg !1333
}

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #9

declare dso_local i32 @cudaDeviceSynchronize() #1

declare dso_local i32 @cudaGetLastError() #1

declare dso_local i8* @cudaGetErrorString(i32) #1

; Function Attrs: nounwind
declare dso_local void @free(i8*) #8

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEf(%"class.std::basic_ostream"*, float) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #1

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #1

declare dso_local i32 @cudaFree(i8*) #1

declare dso_local i32 @cudaDeviceReset() #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #10 comdat align 2 !dbg !1334 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.dim3** %this.addr, metadata !1335, metadata !DIExpression()), !dbg !1336
  store i32 %vx, i32* %vx.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vx.addr, metadata !1337, metadata !DIExpression()), !dbg !1338
  store i32 %vy, i32* %vy.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vy.addr, metadata !1339, metadata !DIExpression()), !dbg !1340
  store i32 %vz, i32* %vz.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %vz.addr, metadata !1341, metadata !DIExpression()), !dbg !1342
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0, !dbg !1343
  %0 = load i32, i32* %vx.addr, align 4, !dbg !1344
  store i32 %0, i32* %x, align 4, !dbg !1343
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1, !dbg !1345
  %1 = load i32, i32* %vy.addr, align 4, !dbg !1346
  store i32 %1, i32* %y, align 4, !dbg !1345
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2, !dbg !1347
  %2 = load i32, i32* %vz.addr, align 4, !dbg !1348
  store i32 %2, i32* %z, align 4, !dbg !1347
  ret void, !dbg !1349
}

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_axpy.cu() #0 section ".text.startup" !dbg !1350 {
entry:
  call void @__cxx_global_var_init(), !dbg !1352
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable }
attributes #5 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { argmemonly nounwind }
attributes #10 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noreturn nounwind }
attributes #12 = { nounwind readonly }

!llvm.dbg.cu = !{!19}
!llvm.module.flags = !{!1033, !1034, !1035}
!llvm.ident = !{!1036}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/iostream", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!4 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 601, size: 8, flags: DIFlagTypePassByReference, elements: !7, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/bits/ios_base.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, flags: DIFlagFwdDecl, identifier: "_ZTSSt8ios_base")
!7 = !{!8, !12, !14, !18}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !4, file: !5, line: 609, baseType: !9, flags: DIFlagStaticMember)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !10, line: 32, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/atomic_word.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "_S_synced_with_stdio", scope: !4, file: !5, line: 610, baseType: !13, flags: DIFlagStaticMember)
!13 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!14 = !DISubprogram(name: "Init", scope: !4, file: !5, line: 605, type: !15, isLocal: false, isDefinition: false, scopeLine: 605, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!18 = !DISubprogram(name: "~Init", scope: !4, file: !5, line: 606, type: !15, isLocal: false, isDefinition: false, scopeLine: 606, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!19 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !20, producer: "clang version 7.0.0 (trunk 333411)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !121, globals: !126, imports: !127)
!20 = !DIFile(filename: "axpy.cu", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!21 = !{!22, !31, !38}
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaLimit", file: !23, line: 1157, baseType: !24, size: 32, elements: !25, identifier: "_ZTS9cudaLimit")
!23 = !DIFile(filename: "/usr/local/cuda-8.0/include/driver_types.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !{!26, !27, !28, !29, !30}
!26 = !DIEnumerator(name: "cudaLimitStackSize", value: 0, isUnsigned: true)
!27 = !DIEnumerator(name: "cudaLimitPrintfFifoSize", value: 1, isUnsigned: true)
!28 = !DIEnumerator(name: "cudaLimitMallocHeapSize", value: 2, isUnsigned: true)
!29 = !DIEnumerator(name: "cudaLimitDevRuntimeSyncDepth", value: 3, isUnsigned: true)
!30 = !DIEnumerator(name: "cudaLimitDevRuntimePendingLaunchCount", value: 4, isUnsigned: true)
!31 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !23, line: 808, baseType: !24, size: 32, elements: !32, identifier: "_ZTS14cudaMemcpyKind")
!32 = !{!33, !34, !35, !36, !37}
!33 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0, isUnsigned: true)
!34 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1, isUnsigned: true)
!35 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2, isUnsigned: true)
!36 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3, isUnsigned: true)
!37 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4, isUnsigned: true)
!38 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !23, line: 156, baseType: !24, size: 32, elements: !39, identifier: "_ZTS9cudaError")
!39 = !{!40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120}
!40 = !DIEnumerator(name: "cudaSuccess", value: 0, isUnsigned: true)
!41 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1, isUnsigned: true)
!42 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2, isUnsigned: true)
!43 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3, isUnsigned: true)
!44 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4, isUnsigned: true)
!45 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5, isUnsigned: true)
!46 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6, isUnsigned: true)
!47 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7, isUnsigned: true)
!48 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8, isUnsigned: true)
!49 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9, isUnsigned: true)
!50 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10, isUnsigned: true)
!51 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11, isUnsigned: true)
!52 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12, isUnsigned: true)
!53 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13, isUnsigned: true)
!54 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14, isUnsigned: true)
!55 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15, isUnsigned: true)
!56 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16, isUnsigned: true)
!57 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17, isUnsigned: true)
!58 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18, isUnsigned: true)
!59 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19, isUnsigned: true)
!60 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20, isUnsigned: true)
!61 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21, isUnsigned: true)
!62 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22, isUnsigned: true)
!63 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23, isUnsigned: true)
!64 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24, isUnsigned: true)
!65 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25, isUnsigned: true)
!66 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26, isUnsigned: true)
!67 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27, isUnsigned: true)
!68 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28, isUnsigned: true)
!69 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29, isUnsigned: true)
!70 = !DIEnumerator(name: "cudaErrorUnknown", value: 30, isUnsigned: true)
!71 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31, isUnsigned: true)
!72 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32, isUnsigned: true)
!73 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33, isUnsigned: true)
!74 = !DIEnumerator(name: "cudaErrorNotReady", value: 34, isUnsigned: true)
!75 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35, isUnsigned: true)
!76 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36, isUnsigned: true)
!77 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37, isUnsigned: true)
!78 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38, isUnsigned: true)
!79 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39, isUnsigned: true)
!80 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40, isUnsigned: true)
!81 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41, isUnsigned: true)
!82 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42, isUnsigned: true)
!83 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43, isUnsigned: true)
!84 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44, isUnsigned: true)
!85 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45, isUnsigned: true)
!86 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46, isUnsigned: true)
!87 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47, isUnsigned: true)
!88 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48, isUnsigned: true)
!89 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49, isUnsigned: true)
!90 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50, isUnsigned: true)
!91 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51, isUnsigned: true)
!92 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54, isUnsigned: true)
!93 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55, isUnsigned: true)
!94 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56, isUnsigned: true)
!95 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57, isUnsigned: true)
!96 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58, isUnsigned: true)
!97 = !DIEnumerator(name: "cudaErrorAssert", value: 59, isUnsigned: true)
!98 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60, isUnsigned: true)
!99 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61, isUnsigned: true)
!100 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62, isUnsigned: true)
!101 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63, isUnsigned: true)
!102 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64, isUnsigned: true)
!103 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65, isUnsigned: true)
!104 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66, isUnsigned: true)
!105 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67, isUnsigned: true)
!106 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68, isUnsigned: true)
!107 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69, isUnsigned: true)
!108 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70, isUnsigned: true)
!109 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71, isUnsigned: true)
!110 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72, isUnsigned: true)
!111 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73, isUnsigned: true)
!112 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74, isUnsigned: true)
!113 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75, isUnsigned: true)
!114 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76, isUnsigned: true)
!115 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77, isUnsigned: true)
!116 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78, isUnsigned: true)
!117 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79, isUnsigned: true)
!118 = !DIEnumerator(name: "cudaErrorNvlinkUncorrectable", value: 80, isUnsigned: true)
!119 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127, isUnsigned: true)
!120 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000, isUnsigned: true)
!121 = !{!122, !124, !125}
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!126 = !{!0}
!127 = !{!128, !134, !138, !140, !142, !144, !146, !150, !152, !154, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !176, !178, !182, !184, !186, !188, !192, !197, !199, !201, !205, !209, !211, !213, !215, !217, !219, !221, !223, !225, !230, !234, !236, !238, !242, !244, !246, !248, !250, !252, !256, !258, !260, !264, !272, !276, !278, !280, !282, !284, !288, !290, !292, !296, !298, !300, !302, !304, !306, !308, !310, !312, !314, !320, !322, !324, !328, !330, !332, !334, !336, !338, !340, !342, !346, !350, !352, !354, !359, !361, !363, !365, !367, !369, !371, !376, !382, !386, !390, !395, !397, !401, !405, !418, !422, !426, !430, !434, !439, !441, !445, !449, !453, !461, !465, !469, !473, !477, !481, !487, !491, !495, !497, !505, !509, !516, !518, !520, !524, !528, !532, !537, !541, !546, !547, !548, !549, !551, !552, !553, !554, !555, !556, !557, !561, !563, !565, !567, !569, !571, !573, !575, !578, !580, !582, !584, !586, !588, !590, !592, !594, !596, !598, !600, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !636, !638, !640, !642, !644, !646, !648, !650, !652, !654, !656, !658, !660, !662, !664, !666, !668, !670, !686, !688, !692, !700, !705, !709, !713, !717, !721, !723, !725, !729, !735, !739, !745, !751, !753, !757, !761, !765, !769, !780, !782, !786, !790, !794, !796, !800, !804, !808, !810, !812, !816, !824, !828, !832, !836, !838, !844, !846, !852, !856, !860, !864, !868, !872, !876, !878, !880, !884, !888, !892, !894, !898, !902, !904, !906, !910, !914, !918, !922, !923, !924, !925, !929, !933, !937, !942, !946, !948, !950, !952, !954, !956, !958, !960, !962, !964, !966, !968, !970, !974, !976, !984, !986, !987, !989, !991, !993, !995, !999, !1001, !1003, !1005, !1007, !1009, !1011, !1013, !1015, !1019, !1023, !1025, !1029}
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !129, file: !130, line: 202)
!129 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !130, file: !130, line: 44, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DIFile(filename: "/usr/local/lib/clang/7.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!131 = !DISubroutineType(types: !132)
!132 = !{!133, !133}
!133 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !135, file: !130, line: 203)
!135 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !130, file: !130, line: 46, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!136 = !DISubroutineType(types: !137)
!137 = !{!123, !123}
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !139, file: !130, line: 204)
!139 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !130, file: !130, line: 48, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !141, file: !130, line: 205)
!141 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !130, file: !130, line: 50, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !143, file: !130, line: 206)
!143 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !130, file: !130, line: 52, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !145, file: !130, line: 207)
!145 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !130, file: !130, line: 56, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !147, file: !130, line: 208)
!147 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !130, file: !130, line: 54, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !DISubroutineType(types: !149)
!149 = !{!123, !123, !123}
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !151, file: !130, line: 209)
!151 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !130, file: !130, line: 58, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !153, file: !130, line: 210)
!153 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !130, file: !130, line: 60, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !155, file: !130, line: 211)
!155 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !130, file: !130, line: 62, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !157, file: !130, line: 212)
!157 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !130, file: !130, line: 64, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !159, file: !130, line: 213)
!159 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !130, file: !130, line: 66, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !161, file: !130, line: 214)
!161 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !130, file: !130, line: 68, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !163, file: !130, line: 215)
!163 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !130, file: !130, line: 72, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !165, file: !130, line: 216)
!165 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !130, file: !130, line: 70, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !167, file: !130, line: 217)
!167 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !130, file: !130, line: 76, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !169, file: !130, line: 218)
!169 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !130, file: !130, line: 74, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !171, file: !130, line: 219)
!171 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !130, file: !130, line: 78, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !173, file: !130, line: 220)
!173 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !130, file: !130, line: 80, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !175, file: !130, line: 221)
!175 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !130, file: !130, line: 82, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !177, file: !130, line: 222)
!177 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !130, file: !130, line: 84, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !179, file: !130, line: 223)
!179 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !130, file: !130, line: 86, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DISubroutineType(types: !181)
!181 = !{!123, !123, !123, !123}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !183, file: !130, line: 224)
!183 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !130, file: !130, line: 88, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !185, file: !130, line: 225)
!185 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !130, file: !130, line: 90, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !187, file: !130, line: 226)
!187 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !130, file: !130, line: 92, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !189, file: !130, line: 227)
!189 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !130, file: !130, line: 94, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DISubroutineType(types: !191)
!191 = !{!11, !123}
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !193, file: !130, line: 228)
!193 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !130, file: !130, line: 96, type: !194, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DISubroutineType(types: !195)
!195 = !{!123, !123, !196}
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !198, file: !130, line: 229)
!198 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !130, file: !130, line: 98, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !200, file: !130, line: 230)
!200 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !130, file: !130, line: 100, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !202, file: !130, line: 231)
!202 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !130, file: !130, line: 102, type: !203, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DISubroutineType(types: !204)
!204 = !{!13, !123}
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !206, file: !130, line: 232)
!206 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !130, file: !130, line: 106, type: !207, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DISubroutineType(types: !208)
!208 = !{!13, !123, !123}
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !210, file: !130, line: 233)
!210 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !130, file: !130, line: 105, type: !207, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !212, file: !130, line: 234)
!212 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !130, file: !130, line: 108, type: !203, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !214, file: !130, line: 235)
!214 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !130, file: !130, line: 112, type: !207, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !216, file: !130, line: 236)
!216 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !130, file: !130, line: 111, type: !207, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !218, file: !130, line: 237)
!218 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !130, file: !130, line: 114, type: !207, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !220, file: !130, line: 238)
!220 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !130, file: !130, line: 116, type: !203, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !222, file: !130, line: 239)
!222 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !130, file: !130, line: 118, type: !203, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !224, file: !130, line: 240)
!224 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !130, file: !130, line: 120, type: !207, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !226, file: !130, line: 241)
!226 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !130, file: !130, line: 121, type: !227, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DISubroutineType(types: !228)
!228 = !{!229, !229}
!229 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !231, file: !130, line: 242)
!231 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !130, file: !130, line: 123, type: !232, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DISubroutineType(types: !233)
!233 = !{!123, !123, !11}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !235, file: !130, line: 243)
!235 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !130, file: !130, line: 125, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !237, file: !130, line: 244)
!237 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !130, file: !130, line: 126, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !239, file: !130, line: 245)
!239 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !130, file: !130, line: 128, type: !240, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DISubroutineType(types: !241)
!241 = !{!133, !123}
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !243, file: !130, line: 246)
!243 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !130, file: !130, line: 138, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !245, file: !130, line: 247)
!245 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !130, file: !130, line: 130, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !247, file: !130, line: 248)
!247 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !130, file: !130, line: 132, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !249, file: !130, line: 249)
!249 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !130, file: !130, line: 134, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !251, file: !130, line: 250)
!251 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !130, file: !130, line: 136, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !253, file: !130, line: 251)
!253 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !130, file: !130, line: 140, type: !254, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DISubroutineType(types: !255)
!255 = !{!229, !123}
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !257, file: !130, line: 252)
!257 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !130, file: !130, line: 142, type: !254, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !259, file: !130, line: 253)
!259 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !130, file: !130, line: 143, type: !240, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !261, file: !130, line: 254)
!261 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !130, file: !130, line: 145, type: !262, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DISubroutineType(types: !263)
!263 = !{!123, !123, !122}
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !265, file: !130, line: 255)
!265 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !130, file: !130, line: 146, type: !266, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DISubroutineType(types: !267)
!267 = !{!268, !269}
!268 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64)
!270 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !271)
!271 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !273, file: !130, line: 256)
!273 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !130, file: !130, line: 147, type: !274, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!274 = !DISubroutineType(types: !275)
!275 = !{!123, !269}
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !277, file: !130, line: 257)
!277 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !130, file: !130, line: 149, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !279, file: !130, line: 258)
!279 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !130, file: !130, line: 151, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !281, file: !130, line: 259)
!281 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !130, file: !130, line: 155, type: !232, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !283, file: !130, line: 260)
!283 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !130, file: !130, line: 157, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !285, file: !130, line: 261)
!285 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !130, file: !130, line: 159, type: !286, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!123, !123, !123, !196}
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !289, file: !130, line: 262)
!289 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !130, file: !130, line: 161, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !291, file: !130, line: 263)
!291 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !130, file: !130, line: 163, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !293, file: !130, line: 264)
!293 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !130, file: !130, line: 165, type: !294, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DISubroutineType(types: !295)
!295 = !{!123, !123, !229}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !297, file: !130, line: 265)
!297 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !130, file: !130, line: 167, type: !232, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !299, file: !130, line: 266)
!299 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !130, file: !130, line: 169, type: !203, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !301, file: !130, line: 267)
!301 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !130, file: !130, line: 171, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !303, file: !130, line: 268)
!303 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !130, file: !130, line: 173, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !305, file: !130, line: 269)
!305 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !130, file: !130, line: 175, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !307, file: !130, line: 270)
!307 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !130, file: !130, line: 177, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !309, file: !130, line: 271)
!309 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !130, file: !130, line: 179, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !311, file: !130, line: 272)
!311 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !130, file: !130, line: 181, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !313, file: !130, line: 273)
!313 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !130, file: !130, line: 183, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !315, file: !319, line: 102)
!315 = !DISubprogram(name: "acos", scope: !316, file: !316, line: 54, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!317 = !DISubroutineType(types: !318)
!318 = !{!268, !268}
!319 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cmath", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !321, file: !319, line: 121)
!321 = !DISubprogram(name: "asin", scope: !316, file: !316, line: 56, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !323, file: !319, line: 140)
!323 = !DISubprogram(name: "atan", scope: !316, file: !316, line: 58, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !325, file: !319, line: 159)
!325 = !DISubprogram(name: "atan2", scope: !316, file: !316, line: 60, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{!268, !268, !268}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !329, file: !319, line: 180)
!329 = !DISubprogram(name: "ceil", scope: !316, file: !316, line: 178, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !331, file: !319, line: 199)
!331 = !DISubprogram(name: "cos", scope: !316, file: !316, line: 63, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !333, file: !319, line: 218)
!333 = !DISubprogram(name: "cosh", scope: !316, file: !316, line: 72, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !335, file: !319, line: 237)
!335 = !DISubprogram(name: "exp", scope: !316, file: !316, line: 100, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !337, file: !319, line: 256)
!337 = !DISubprogram(name: "fabs", scope: !316, file: !316, line: 181, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !339, file: !319, line: 275)
!339 = !DISubprogram(name: "floor", scope: !316, file: !316, line: 184, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !341, file: !319, line: 294)
!341 = !DISubprogram(name: "fmod", scope: !316, file: !316, line: 187, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !343, file: !319, line: 315)
!343 = !DISubprogram(name: "frexp", scope: !316, file: !316, line: 103, type: !344, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DISubroutineType(types: !345)
!345 = !{!268, !268, !196}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !347, file: !319, line: 334)
!347 = !DISubprogram(name: "ldexp", scope: !316, file: !316, line: 106, type: !348, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DISubroutineType(types: !349)
!349 = !{!268, !268, !11}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !351, file: !319, line: 353)
!351 = !DISubprogram(name: "log", scope: !316, file: !316, line: 109, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !353, file: !319, line: 372)
!353 = !DISubprogram(name: "log10", scope: !316, file: !316, line: 112, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !355, file: !319, line: 391)
!355 = !DISubprogram(name: "modf", scope: !316, file: !316, line: 115, type: !356, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DISubroutineType(types: !357)
!357 = !{!268, !268, !358}
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !268, size: 64)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !360, file: !319, line: 403)
!360 = !DISubprogram(name: "pow", scope: !316, file: !316, line: 153, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !362, file: !319, line: 440)
!362 = !DISubprogram(name: "sin", scope: !316, file: !316, line: 65, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !364, file: !319, line: 459)
!364 = !DISubprogram(name: "sinh", scope: !316, file: !316, line: 74, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !366, file: !319, line: 478)
!366 = !DISubprogram(name: "sqrt", scope: !316, file: !316, line: 156, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !368, file: !319, line: 497)
!368 = !DISubprogram(name: "tan", scope: !316, file: !316, line: 67, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !370, file: !319, line: 516)
!370 = !DISubprogram(name: "tanh", scope: !316, file: !316, line: 76, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !372, file: !375, line: 118)
!372 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !373, line: 101, baseType: !374)
!373 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!374 = !DICompositeType(tag: DW_TAG_structure_type, file: !373, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!375 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cstdlib", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !377, file: !375, line: 119)
!377 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !373, line: 109, baseType: !378)
!378 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !373, line: 105, size: 128, flags: DIFlagTypePassByValue, elements: !379, identifier: "_ZTS6ldiv_t")
!379 = !{!380, !381}
!380 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !378, file: !373, line: 107, baseType: !229, size: 64)
!381 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !378, file: !373, line: 108, baseType: !229, size: 64, offset: 64)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !383, file: !375, line: 121)
!383 = !DISubprogram(name: "abort", scope: !373, file: !373, line: 515, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{null}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !387, file: !375, line: 122)
!387 = !DISubprogram(name: "abs", scope: !373, file: !373, line: 774, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!11, !11}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !391, file: !375, line: 123)
!391 = !DISubprogram(name: "atexit", scope: !373, file: !373, line: 519, type: !392, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!392 = !DISubroutineType(types: !393)
!393 = !{!11, !394}
!394 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !384, size: 64)
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !396, file: !375, line: 129)
!396 = !DISubprogram(name: "atof", scope: !373, file: !373, line: 144, type: !266, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !398, file: !375, line: 130)
!398 = !DISubprogram(name: "atoi", scope: !373, file: !373, line: 147, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!399 = !DISubroutineType(types: !400)
!400 = !{!11, !269}
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !402, file: !375, line: 131)
!402 = !DISubprogram(name: "atol", scope: !373, file: !373, line: 150, type: !403, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!403 = !DISubroutineType(types: !404)
!404 = !{!229, !269}
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !406, file: !375, line: 132)
!406 = !DISubprogram(name: "bsearch", scope: !373, file: !373, line: 754, type: !407, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!407 = !DISubroutineType(types: !408)
!408 = !{!124, !409, !409, !411, !411, !414}
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !410, size: 64)
!410 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!411 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !412, line: 62, baseType: !413)
!412 = !DIFile(filename: "/usr/local/lib/clang/7.0.0/include/stddef.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!413 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !373, line: 741, baseType: !415)
!415 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !416, size: 64)
!416 = !DISubroutineType(types: !417)
!417 = !{!11, !409, !409}
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !419, file: !375, line: 133)
!419 = !DISubprogram(name: "calloc", scope: !373, file: !373, line: 468, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!420 = !DISubroutineType(types: !421)
!421 = !{!124, !411, !411}
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !423, file: !375, line: 134)
!423 = !DISubprogram(name: "div", scope: !373, file: !373, line: 788, type: !424, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DISubroutineType(types: !425)
!425 = !{!372, !11, !11}
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !427, file: !375, line: 135)
!427 = !DISubprogram(name: "exit", scope: !373, file: !373, line: 543, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!428 = !DISubroutineType(types: !429)
!429 = !{null, !11}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !431, file: !375, line: 136)
!431 = !DISubprogram(name: "free", scope: !373, file: !373, line: 483, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!432 = !DISubroutineType(types: !433)
!433 = !{null, !124}
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !435, file: !375, line: 137)
!435 = !DISubprogram(name: "getenv", scope: !373, file: !373, line: 564, type: !436, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!436 = !DISubroutineType(types: !437)
!437 = !{!438, !269}
!438 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !440, file: !375, line: 138)
!440 = !DISubprogram(name: "labs", scope: !373, file: !373, line: 775, type: !227, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !442, file: !375, line: 139)
!442 = !DISubprogram(name: "ldiv", scope: !373, file: !373, line: 790, type: !443, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!443 = !DISubroutineType(types: !444)
!444 = !{!377, !229, !229}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !446, file: !375, line: 140)
!446 = !DISubprogram(name: "malloc", scope: !373, file: !373, line: 466, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DISubroutineType(types: !448)
!448 = !{!124, !411}
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !450, file: !375, line: 142)
!450 = !DISubprogram(name: "mblen", scope: !373, file: !373, line: 862, type: !451, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!451 = !DISubroutineType(types: !452)
!452 = !{!11, !269, !411}
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !454, file: !375, line: 143)
!454 = !DISubprogram(name: "mbstowcs", scope: !373, file: !373, line: 873, type: !455, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!455 = !DISubroutineType(types: !456)
!456 = !{!411, !457, !460, !411}
!457 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !458)
!458 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !459, size: 64)
!459 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!460 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !269)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !462, file: !375, line: 144)
!462 = !DISubprogram(name: "mbtowc", scope: !373, file: !373, line: 865, type: !463, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!463 = !DISubroutineType(types: !464)
!464 = !{!11, !457, !460, !411}
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !466, file: !375, line: 146)
!466 = !DISubprogram(name: "qsort", scope: !373, file: !373, line: 764, type: !467, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DISubroutineType(types: !468)
!468 = !{null, !124, !411, !411, !414}
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !470, file: !375, line: 152)
!470 = !DISubprogram(name: "rand", scope: !373, file: !373, line: 374, type: !471, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DISubroutineType(types: !472)
!472 = !{!11}
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !474, file: !375, line: 153)
!474 = !DISubprogram(name: "realloc", scope: !373, file: !373, line: 480, type: !475, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DISubroutineType(types: !476)
!476 = !{!124, !124, !411}
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !375, line: 154)
!478 = !DISubprogram(name: "srand", scope: !373, file: !373, line: 376, type: !479, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DISubroutineType(types: !480)
!480 = !{null, !24}
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !482, file: !375, line: 155)
!482 = !DISubprogram(name: "strtod", scope: !373, file: !373, line: 164, type: !483, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!483 = !DISubroutineType(types: !484)
!484 = !{!268, !460, !485}
!485 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !486)
!486 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !438, size: 64)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !488, file: !375, line: 156)
!488 = !DISubprogram(name: "strtol", scope: !373, file: !373, line: 183, type: !489, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DISubroutineType(types: !490)
!490 = !{!229, !460, !485, !11}
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !492, file: !375, line: 157)
!492 = !DISubprogram(name: "strtoul", scope: !373, file: !373, line: 187, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!493 = !DISubroutineType(types: !494)
!494 = !{!413, !460, !485, !11}
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !496, file: !375, line: 158)
!496 = !DISubprogram(name: "system", scope: !373, file: !373, line: 716, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !498, file: !375, line: 160)
!498 = !DISubprogram(name: "wcstombs", scope: !373, file: !373, line: 876, type: !499, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!499 = !DISubroutineType(types: !500)
!500 = !{!411, !501, !502, !411}
!501 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !438)
!502 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !503)
!503 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !504, size: 64)
!504 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !459)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !506, file: !375, line: 161)
!506 = !DISubprogram(name: "wctomb", scope: !373, file: !373, line: 869, type: !507, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!507 = !DISubroutineType(types: !508)
!508 = !{!11, !438, !459}
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !511, file: !375, line: 214)
!510 = !DINamespace(name: "__gnu_cxx", scope: null)
!511 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !373, line: 121, baseType: !512)
!512 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !373, line: 117, size: 128, flags: DIFlagTypePassByValue, elements: !513, identifier: "_ZTS7lldiv_t")
!513 = !{!514, !515}
!514 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !512, file: !373, line: 119, baseType: !133, size: 64)
!515 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !512, file: !373, line: 120, baseType: !133, size: 64, offset: 64)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !517, file: !375, line: 220)
!517 = !DISubprogram(name: "_Exit", scope: !373, file: !373, line: 557, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !519, file: !375, line: 224)
!519 = !DISubprogram(name: "llabs", scope: !373, file: !373, line: 779, type: !131, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !521, file: !375, line: 230)
!521 = !DISubprogram(name: "lldiv", scope: !373, file: !373, line: 796, type: !522, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DISubroutineType(types: !523)
!523 = !{!511, !133, !133}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !525, file: !375, line: 241)
!525 = !DISubprogram(name: "atoll", scope: !373, file: !373, line: 157, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DISubroutineType(types: !527)
!527 = !{!133, !269}
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !529, file: !375, line: 242)
!529 = !DISubprogram(name: "strtoll", scope: !373, file: !373, line: 209, type: !530, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DISubroutineType(types: !531)
!531 = !{!133, !460, !485, !11}
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !533, file: !375, line: 243)
!533 = !DISubprogram(name: "strtoull", scope: !373, file: !373, line: 214, type: !534, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DISubroutineType(types: !535)
!535 = !{!536, !460, !485, !11}
!536 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !538, file: !375, line: 245)
!538 = !DISubprogram(name: "strtof", scope: !373, file: !373, line: 172, type: !539, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!539 = !DISubroutineType(types: !540)
!540 = !{!123, !460, !485}
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !542, file: !375, line: 246)
!542 = !DISubprogram(name: "strtold", scope: !373, file: !373, line: 175, type: !543, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!543 = !DISubroutineType(types: !544)
!544 = !{!545, !460, !485}
!545 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !511, file: !375, line: 254)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !517, file: !375, line: 256)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !519, file: !375, line: 258)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !550, file: !375, line: 259)
!550 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !510, file: !375, line: 227, type: !522, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !521, file: !375, line: 260)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !525, file: !375, line: 262)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !538, file: !375, line: 263)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !529, file: !375, line: 264)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !533, file: !375, line: 265)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !542, file: !375, line: 266)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !558, file: !560, line: 405)
!558 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !559, file: !559, line: 1342, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DIFile(filename: "/usr/local/cuda-8.0/include/math_functions.hpp", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!560 = !DIFile(filename: "/usr/local/lib/clang/7.0.0/include/__clang_cuda_cmath.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !562, file: !560, line: 406)
!562 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !559, file: !559, line: 1370, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !564, file: !560, line: 407)
!564 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !559, file: !559, line: 1337, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !566, file: !560, line: 408)
!566 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !559, file: !559, line: 1375, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !568, file: !560, line: 409)
!568 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !559, file: !559, line: 1327, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !570, file: !560, line: 410)
!570 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !559, file: !559, line: 1332, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !572, file: !560, line: 411)
!572 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !559, file: !559, line: 1380, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !574, file: !560, line: 412)
!574 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !559, file: !559, line: 1430, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !576, file: !560, line: 413)
!576 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !577, file: !577, line: 667, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!577 = !DIFile(filename: "/usr/local/cuda-8.0/include/device_functions.hpp", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !579, file: !560, line: 414)
!579 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !559, file: !559, line: 1189, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !581, file: !560, line: 415)
!581 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !559, file: !559, line: 1243, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !583, file: !560, line: 416)
!583 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !559, file: !559, line: 1312, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !585, file: !560, line: 417)
!585 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !559, file: !559, line: 1490, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !587, file: !560, line: 418)
!587 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !559, file: !559, line: 1480, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !589, file: !560, line: 419)
!589 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !577, file: !577, line: 657, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !591, file: !560, line: 420)
!591 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !559, file: !559, line: 1294, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !593, file: !560, line: 421)
!593 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !559, file: !559, line: 1385, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !595, file: !560, line: 422)
!595 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !577, file: !577, line: 607, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !597, file: !560, line: 423)
!597 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !559, file: !559, line: 1616, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !599, file: !560, line: 424)
!599 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !577, file: !577, line: 597, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !601, file: !560, line: 425)
!601 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !559, file: !559, line: 1568, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !603, file: !560, line: 426)
!603 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !577, file: !577, line: 622, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !605, file: !560, line: 427)
!605 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !577, file: !577, line: 617, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !607, file: !560, line: 428)
!607 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !559, file: !559, line: 1553, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !609, file: !560, line: 429)
!609 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !559, file: !559, line: 1543, type: !194, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !611, file: !560, line: 430)
!611 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !559, file: !559, line: 1390, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !613, file: !560, line: 431)
!613 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !559, file: !559, line: 1621, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !615, file: !560, line: 432)
!615 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !559, file: !559, line: 1520, type: !232, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !617, file: !560, line: 433)
!617 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !559, file: !559, line: 1515, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !619, file: !560, line: 434)
!619 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !559, file: !559, line: 1149, type: !240, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !621, file: !560, line: 435)
!621 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !559, file: !559, line: 1602, type: !240, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !623, file: !560, line: 436)
!623 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !559, file: !559, line: 1356, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !625, file: !560, line: 437)
!625 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !559, file: !559, line: 1365, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !627, file: !560, line: 438)
!627 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !559, file: !559, line: 1285, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !629, file: !560, line: 439)
!629 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !559, file: !559, line: 1626, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !631, file: !560, line: 440)
!631 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !559, file: !559, line: 1347, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !633, file: !560, line: 441)
!633 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !559, file: !559, line: 1140, type: !254, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !635, file: !560, line: 442)
!635 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !559, file: !559, line: 1607, type: !254, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !637, file: !560, line: 443)
!637 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !559, file: !559, line: 1548, type: !262, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !639, file: !560, line: 444)
!639 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !559, file: !559, line: 1154, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !641, file: !560, line: 445)
!641 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !559, file: !559, line: 1218, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !643, file: !560, line: 446)
!643 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !559, file: !559, line: 1583, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !645, file: !560, line: 447)
!645 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !559, file: !559, line: 1558, type: !148, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !647, file: !560, line: 448)
!647 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !559, file: !559, line: 1563, type: !286, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !649, file: !560, line: 449)
!649 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !559, file: !559, line: 1135, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !651, file: !560, line: 450)
!651 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !559, file: !559, line: 1597, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !653, file: !560, line: 451)
!653 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !559, file: !559, line: 1530, type: !294, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !655, file: !560, line: 452)
!655 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !559, file: !559, line: 1525, type: !232, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !657, file: !560, line: 453)
!657 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !559, file: !559, line: 1234, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !659, file: !560, line: 454)
!659 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !559, file: !559, line: 1317, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !661, file: !560, line: 455)
!661 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !577, file: !577, line: 907, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !663, file: !560, line: 456)
!663 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !559, file: !559, line: 1276, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !665, file: !560, line: 457)
!665 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !559, file: !559, line: 1322, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !667, file: !560, line: 458)
!667 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !559, file: !559, line: 1592, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !669, file: !560, line: 459)
!669 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !577, file: !577, line: 662, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !671, file: !685, line: 64)
!671 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !672, line: 106, baseType: !673)
!672 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!673 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !672, line: 94, baseType: !674)
!674 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !672, line: 82, size: 64, flags: DIFlagTypePassByValue, elements: !675, identifier: "_ZTS11__mbstate_t")
!675 = !{!676, !677}
!676 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !674, file: !672, line: 84, baseType: !11, size: 32)
!677 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !674, file: !672, line: 93, baseType: !678, size: 32, offset: 32)
!678 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !674, file: !672, line: 85, size: 32, flags: DIFlagTypePassByValue, elements: !679, identifier: "_ZTSN11__mbstate_tUt_E")
!679 = !{!680, !681}
!680 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !678, file: !672, line: 88, baseType: !24, size: 32)
!681 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !678, file: !672, line: 92, baseType: !682, size: 32)
!682 = !DICompositeType(tag: DW_TAG_array_type, baseType: !271, size: 32, elements: !683)
!683 = !{!684}
!684 = !DISubrange(count: 4)
!685 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cwchar", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !687, file: !685, line: 139)
!687 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !412, line: 132, baseType: !24)
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !689, file: !685, line: 141)
!689 = !DISubprogram(name: "btowc", scope: !672, file: !672, line: 356, type: !690, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!690 = !DISubroutineType(types: !691)
!691 = !{!687, !11}
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !693, file: !685, line: 142)
!693 = !DISubprogram(name: "fgetwc", scope: !672, file: !672, line: 748, type: !694, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!694 = !DISubroutineType(types: !695)
!695 = !{!687, !696}
!696 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !697, size: 64)
!697 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !698, line: 64, baseType: !699)
!698 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!699 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !698, line: 44, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !701, file: !685, line: 143)
!701 = !DISubprogram(name: "fgetws", scope: !672, file: !672, line: 777, type: !702, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!702 = !DISubroutineType(types: !703)
!703 = !{!458, !457, !11, !704}
!704 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !696)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !706, file: !685, line: 144)
!706 = !DISubprogram(name: "fputwc", scope: !672, file: !672, line: 762, type: !707, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!707 = !DISubroutineType(types: !708)
!708 = !{!687, !459, !696}
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !710, file: !685, line: 145)
!710 = !DISubprogram(name: "fputws", scope: !672, file: !672, line: 784, type: !711, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!711 = !DISubroutineType(types: !712)
!712 = !{!11, !502, !704}
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !714, file: !685, line: 146)
!714 = !DISubprogram(name: "fwide", scope: !672, file: !672, line: 590, type: !715, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!715 = !DISubroutineType(types: !716)
!716 = !{!11, !696, !11}
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !718, file: !685, line: 147)
!718 = !DISubprogram(name: "fwprintf", scope: !672, file: !672, line: 597, type: !719, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!719 = !DISubroutineType(types: !720)
!720 = !{!11, !704, !502, null}
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !722, file: !685, line: 148)
!722 = !DISubprogram(name: "fwscanf", scope: !672, file: !672, line: 638, type: !719, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !724, file: !685, line: 149)
!724 = !DISubprogram(name: "getwc", scope: !672, file: !672, line: 749, type: !694, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !726, file: !685, line: 150)
!726 = !DISubprogram(name: "getwchar", scope: !672, file: !672, line: 755, type: !727, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!727 = !DISubroutineType(types: !728)
!728 = !{!687}
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !730, file: !685, line: 151)
!730 = !DISubprogram(name: "mbrlen", scope: !672, file: !672, line: 379, type: !731, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!731 = !DISubroutineType(types: !732)
!732 = !{!411, !460, !411, !733}
!733 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !734)
!734 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !671, size: 64)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !736, file: !685, line: 152)
!736 = !DISubprogram(name: "mbrtowc", scope: !672, file: !672, line: 368, type: !737, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!737 = !DISubroutineType(types: !738)
!738 = !{!411, !457, !460, !411, !733}
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !740, file: !685, line: 153)
!740 = !DISubprogram(name: "mbsinit", scope: !672, file: !672, line: 364, type: !741, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!741 = !DISubroutineType(types: !742)
!742 = !{!11, !743}
!743 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !744, size: 64)
!744 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !671)
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !746, file: !685, line: 154)
!746 = !DISubprogram(name: "mbsrtowcs", scope: !672, file: !672, line: 411, type: !747, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!747 = !DISubroutineType(types: !748)
!748 = !{!411, !457, !749, !411, !733}
!749 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !750)
!750 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !269, size: 64)
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !752, file: !685, line: 155)
!752 = !DISubprogram(name: "putwc", scope: !672, file: !672, line: 763, type: !707, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !754, file: !685, line: 156)
!754 = !DISubprogram(name: "putwchar", scope: !672, file: !672, line: 769, type: !755, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!755 = !DISubroutineType(types: !756)
!756 = !{!687, !459}
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !758, file: !685, line: 158)
!758 = !DISubprogram(name: "swprintf", scope: !672, file: !672, line: 607, type: !759, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!759 = !DISubroutineType(types: !760)
!760 = !{!11, !457, !411, !502, null}
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !762, file: !685, line: 160)
!762 = !DISubprogram(name: "swscanf", scope: !672, file: !672, line: 648, type: !763, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!763 = !DISubroutineType(types: !764)
!764 = !{!11, !502, !502, null}
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !766, file: !685, line: 161)
!766 = !DISubprogram(name: "ungetwc", scope: !672, file: !672, line: 792, type: !767, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!767 = !DISubroutineType(types: !768)
!768 = !{!687, !687, !696}
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !770, file: !685, line: 162)
!770 = !DISubprogram(name: "vfwprintf", scope: !672, file: !672, line: 615, type: !771, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!771 = !DISubroutineType(types: !772)
!772 = !{!11, !704, !502, !773}
!773 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !774, size: 64)
!774 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !20, size: 192, flags: DIFlagTypePassByValue, elements: !775, identifier: "_ZTS13__va_list_tag")
!775 = !{!776, !777, !778, !779}
!776 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !774, file: !20, baseType: !24, size: 32)
!777 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !774, file: !20, baseType: !24, size: 32, offset: 32)
!778 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !774, file: !20, baseType: !124, size: 64, offset: 64)
!779 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !774, file: !20, baseType: !124, size: 64, offset: 128)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !781, file: !685, line: 164)
!781 = !DISubprogram(name: "vfwscanf", scope: !672, file: !672, line: 692, type: !771, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !783, file: !685, line: 167)
!783 = !DISubprogram(name: "vswprintf", scope: !672, file: !672, line: 628, type: !784, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!784 = !DISubroutineType(types: !785)
!785 = !{!11, !457, !411, !502, !773}
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !787, file: !685, line: 170)
!787 = !DISubprogram(name: "vswscanf", scope: !672, file: !672, line: 704, type: !788, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!788 = !DISubroutineType(types: !789)
!789 = !{!11, !502, !502, !773}
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !791, file: !685, line: 172)
!791 = !DISubprogram(name: "vwprintf", scope: !672, file: !672, line: 623, type: !792, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!792 = !DISubroutineType(types: !793)
!793 = !{!11, !502, !773}
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !795, file: !685, line: 174)
!795 = !DISubprogram(name: "vwscanf", scope: !672, file: !672, line: 700, type: !792, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !797, file: !685, line: 176)
!797 = !DISubprogram(name: "wcrtomb", scope: !672, file: !672, line: 373, type: !798, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!798 = !DISubroutineType(types: !799)
!799 = !{!411, !501, !459, !733}
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !801, file: !685, line: 177)
!801 = !DISubprogram(name: "wcscat", scope: !672, file: !672, line: 157, type: !802, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!802 = !DISubroutineType(types: !803)
!803 = !{!458, !457, !502}
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !805, file: !685, line: 178)
!805 = !DISubprogram(name: "wcscmp", scope: !672, file: !672, line: 166, type: !806, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!806 = !DISubroutineType(types: !807)
!807 = !{!11, !503, !503}
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !809, file: !685, line: 179)
!809 = !DISubprogram(name: "wcscoll", scope: !672, file: !672, line: 195, type: !806, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !811, file: !685, line: 180)
!811 = !DISubprogram(name: "wcscpy", scope: !672, file: !672, line: 147, type: !802, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !813, file: !685, line: 181)
!813 = !DISubprogram(name: "wcscspn", scope: !672, file: !672, line: 255, type: !814, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!814 = !DISubroutineType(types: !815)
!815 = !{!411, !503, !503}
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !817, file: !685, line: 182)
!817 = !DISubprogram(name: "wcsftime", scope: !672, file: !672, line: 858, type: !818, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!818 = !DISubroutineType(types: !819)
!819 = !{!411, !457, !411, !502, !820}
!820 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !821)
!821 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !822, size: 64)
!822 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !823)
!823 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !672, line: 137, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !825, file: !685, line: 183)
!825 = !DISubprogram(name: "wcslen", scope: !672, file: !672, line: 290, type: !826, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!826 = !DISubroutineType(types: !827)
!827 = !{!411, !503}
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !829, file: !685, line: 184)
!829 = !DISubprogram(name: "wcsncat", scope: !672, file: !672, line: 161, type: !830, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!830 = !DISubroutineType(types: !831)
!831 = !{!458, !457, !502, !411}
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !833, file: !685, line: 185)
!833 = !DISubprogram(name: "wcsncmp", scope: !672, file: !672, line: 169, type: !834, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!834 = !DISubroutineType(types: !835)
!835 = !{!11, !503, !503, !411}
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !837, file: !685, line: 186)
!837 = !DISubprogram(name: "wcsncpy", scope: !672, file: !672, line: 152, type: !830, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !839, file: !685, line: 187)
!839 = !DISubprogram(name: "wcsrtombs", scope: !672, file: !672, line: 417, type: !840, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!840 = !DISubroutineType(types: !841)
!841 = !{!411, !501, !842, !411, !733}
!842 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !843)
!843 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !503, size: 64)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !845, file: !685, line: 188)
!845 = !DISubprogram(name: "wcsspn", scope: !672, file: !672, line: 259, type: !814, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !847, file: !685, line: 189)
!847 = !DISubprogram(name: "wcstod", scope: !672, file: !672, line: 453, type: !848, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!848 = !DISubroutineType(types: !849)
!849 = !{!268, !502, !850}
!850 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !851)
!851 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !458, size: 64)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !853, file: !685, line: 191)
!853 = !DISubprogram(name: "wcstof", scope: !672, file: !672, line: 460, type: !854, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!854 = !DISubroutineType(types: !855)
!855 = !{!123, !502, !850}
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !857, file: !685, line: 193)
!857 = !DISubprogram(name: "wcstok", scope: !672, file: !672, line: 285, type: !858, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!858 = !DISubroutineType(types: !859)
!859 = !{!458, !457, !502, !850}
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !861, file: !685, line: 194)
!861 = !DISubprogram(name: "wcstol", scope: !672, file: !672, line: 471, type: !862, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!862 = !DISubroutineType(types: !863)
!863 = !{!229, !502, !850, !11}
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !865, file: !685, line: 195)
!865 = !DISubprogram(name: "wcstoul", scope: !672, file: !672, line: 476, type: !866, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!866 = !DISubroutineType(types: !867)
!867 = !{!413, !502, !850, !11}
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !869, file: !685, line: 196)
!869 = !DISubprogram(name: "wcsxfrm", scope: !672, file: !672, line: 199, type: !870, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!870 = !DISubroutineType(types: !871)
!871 = !{!411, !457, !502, !411}
!872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !873, file: !685, line: 197)
!873 = !DISubprogram(name: "wctob", scope: !672, file: !672, line: 360, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!874 = !DISubroutineType(types: !875)
!875 = !{!11, !687}
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !877, file: !685, line: 198)
!877 = !DISubprogram(name: "wmemcmp", scope: !672, file: !672, line: 328, type: !834, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !879, file: !685, line: 199)
!879 = !DISubprogram(name: "wmemcpy", scope: !672, file: !672, line: 332, type: !830, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !881, file: !685, line: 200)
!881 = !DISubprogram(name: "wmemmove", scope: !672, file: !672, line: 337, type: !882, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!882 = !DISubroutineType(types: !883)
!883 = !{!458, !458, !503, !411}
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !885, file: !685, line: 201)
!885 = !DISubprogram(name: "wmemset", scope: !672, file: !672, line: 341, type: !886, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!886 = !DISubroutineType(types: !887)
!887 = !{!458, !458, !459, !411}
!888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !889, file: !685, line: 202)
!889 = !DISubprogram(name: "wprintf", scope: !672, file: !672, line: 604, type: !890, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!890 = !DISubroutineType(types: !891)
!891 = !{!11, !502, null}
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !893, file: !685, line: 203)
!893 = !DISubprogram(name: "wscanf", scope: !672, file: !672, line: 645, type: !890, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !895, file: !685, line: 204)
!895 = !DISubprogram(name: "wcschr", scope: !672, file: !672, line: 230, type: !896, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!896 = !DISubroutineType(types: !897)
!897 = !{!458, !503, !459}
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !899, file: !685, line: 205)
!899 = !DISubprogram(name: "wcspbrk", scope: !672, file: !672, line: 269, type: !900, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!900 = !DISubroutineType(types: !901)
!901 = !{!458, !503, !503}
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !903, file: !685, line: 206)
!903 = !DISubprogram(name: "wcsrchr", scope: !672, file: !672, line: 240, type: !896, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !905, file: !685, line: 207)
!905 = !DISubprogram(name: "wcsstr", scope: !672, file: !672, line: 280, type: !900, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !907, file: !685, line: 208)
!907 = !DISubprogram(name: "wmemchr", scope: !672, file: !672, line: 323, type: !908, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!908 = !DISubroutineType(types: !909)
!909 = !{!458, !503, !459, !411}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !911, file: !685, line: 248)
!911 = !DISubprogram(name: "wcstold", scope: !672, file: !672, line: 462, type: !912, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!912 = !DISubroutineType(types: !913)
!913 = !{!545, !502, !850}
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !915, file: !685, line: 257)
!915 = !DISubprogram(name: "wcstoll", scope: !672, file: !672, line: 486, type: !916, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!916 = !DISubroutineType(types: !917)
!917 = !{!133, !502, !850, !11}
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !919, file: !685, line: 258)
!919 = !DISubprogram(name: "wcstoull", scope: !672, file: !672, line: 493, type: !920, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!920 = !DISubroutineType(types: !921)
!921 = !{!536, !502, !850, !11}
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !911, file: !685, line: 264)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !915, file: !685, line: 265)
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !919, file: !685, line: 266)
!925 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !926, entity: !927, file: !928, line: 56)
!926 = !DINamespace(name: "__gnu_debug", scope: null)
!927 = !DINamespace(name: "__debug", scope: !2)
!928 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/debug/debug.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !930, file: !932, line: 53)
!930 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !931, line: 53, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!931 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!932 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/clocale", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !934, file: !932, line: 54)
!934 = !DISubprogram(name: "setlocale", scope: !931, file: !931, line: 124, type: !935, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!935 = !DISubroutineType(types: !936)
!936 = !{!438, !11, !269}
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !938, file: !932, line: 55)
!938 = !DISubprogram(name: "localeconv", scope: !931, file: !931, line: 127, type: !939, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!939 = !DISubroutineType(types: !940)
!940 = !{!941}
!941 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !930, size: 64)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !943, file: !945, line: 64)
!943 = !DISubprogram(name: "isalnum", scope: !944, file: !944, line: 110, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!944 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!945 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cctype", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !947, file: !945, line: 65)
!947 = !DISubprogram(name: "isalpha", scope: !944, file: !944, line: 111, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !949, file: !945, line: 66)
!949 = !DISubprogram(name: "iscntrl", scope: !944, file: !944, line: 112, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !951, file: !945, line: 67)
!951 = !DISubprogram(name: "isdigit", scope: !944, file: !944, line: 113, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !953, file: !945, line: 68)
!953 = !DISubprogram(name: "isgraph", scope: !944, file: !944, line: 115, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !955, file: !945, line: 69)
!955 = !DISubprogram(name: "islower", scope: !944, file: !944, line: 114, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !957, file: !945, line: 70)
!957 = !DISubprogram(name: "isprint", scope: !944, file: !944, line: 116, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !959, file: !945, line: 71)
!959 = !DISubprogram(name: "ispunct", scope: !944, file: !944, line: 117, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !961, file: !945, line: 72)
!961 = !DISubprogram(name: "isspace", scope: !944, file: !944, line: 118, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !963, file: !945, line: 73)
!963 = !DISubprogram(name: "isupper", scope: !944, file: !944, line: 119, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!964 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !965, file: !945, line: 74)
!965 = !DISubprogram(name: "isxdigit", scope: !944, file: !944, line: 120, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !967, file: !945, line: 75)
!967 = !DISubprogram(name: "tolower", scope: !944, file: !944, line: 124, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!968 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !969, file: !945, line: 76)
!969 = !DISubprogram(name: "toupper", scope: !944, file: !944, line: 127, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!970 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !971, file: !973, line: 44)
!971 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !2, file: !972, line: 196, baseType: !413)
!972 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/x86_64-linux-gnu/c++/5.4.0/bits/c++config.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!973 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/ext/new_allocator.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!974 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !510, entity: !975, file: !973, line: 45)
!975 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !2, file: !972, line: 197, baseType: !229)
!976 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !977, file: !983, line: 82)
!977 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !978, line: 186, baseType: !979)
!978 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!979 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !980, size: 64)
!980 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !981)
!981 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !982, line: 40, baseType: !11)
!982 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!983 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/5.4.0/../../../../include/c++/5.4.0/cwctype", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!984 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !985, file: !983, line: 83)
!985 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !978, line: 52, baseType: !413)
!986 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !687, file: !983, line: 84)
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !988, file: !983, line: 86)
!988 = !DISubprogram(name: "iswalnum", scope: !978, file: !978, line: 111, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !990, file: !983, line: 87)
!990 = !DISubprogram(name: "iswalpha", scope: !978, file: !978, line: 117, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!991 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !992, file: !983, line: 89)
!992 = !DISubprogram(name: "iswblank", scope: !978, file: !978, line: 162, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !994, file: !983, line: 91)
!994 = !DISubprogram(name: "iswcntrl", scope: !978, file: !978, line: 120, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !996, file: !983, line: 92)
!996 = !DISubprogram(name: "iswctype", scope: !978, file: !978, line: 175, type: !997, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!997 = !DISubroutineType(types: !998)
!998 = !{!11, !687, !985}
!999 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1000, file: !983, line: 93)
!1000 = !DISubprogram(name: "iswdigit", scope: !978, file: !978, line: 124, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1002, file: !983, line: 94)
!1002 = !DISubprogram(name: "iswgraph", scope: !978, file: !978, line: 128, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1004, file: !983, line: 95)
!1004 = !DISubprogram(name: "iswlower", scope: !978, file: !978, line: 133, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1006, file: !983, line: 96)
!1006 = !DISubprogram(name: "iswprint", scope: !978, file: !978, line: 136, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1008, file: !983, line: 97)
!1008 = !DISubprogram(name: "iswpunct", scope: !978, file: !978, line: 141, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1010, file: !983, line: 98)
!1010 = !DISubprogram(name: "iswspace", scope: !978, file: !978, line: 146, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1012, file: !983, line: 99)
!1012 = !DISubprogram(name: "iswupper", scope: !978, file: !978, line: 151, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1014, file: !983, line: 100)
!1014 = !DISubprogram(name: "iswxdigit", scope: !978, file: !978, line: 156, type: !874, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1016, file: !983, line: 101)
!1016 = !DISubprogram(name: "towctrans", scope: !978, file: !978, line: 221, type: !1017, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!687, !687, !977}
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1020, file: !983, line: 102)
!1020 = !DISubprogram(name: "towlower", scope: !978, file: !978, line: 194, type: !1021, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{!687, !687}
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1024, file: !983, line: 103)
!1024 = !DISubprogram(name: "towupper", scope: !978, file: !978, line: 197, type: !1021, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1026, file: !983, line: 104)
!1026 = !DISubprogram(name: "wctrans", scope: !978, file: !978, line: 218, type: !1027, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1027 = !DISubroutineType(types: !1028)
!1028 = !{!977, !269}
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1030, file: !983, line: 105)
!1030 = !DISubprogram(name: "wctype", scope: !978, file: !978, line: 171, type: !1031, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!1031 = !DISubroutineType(types: !1032)
!1032 = !{!985, !269}
!1033 = !{i32 2, !"Dwarf Version", i32 4}
!1034 = !{i32 2, !"Debug Info Version", i32 3}
!1035 = !{i32 1, !"wchar_size", i32 4}
!1036 = !{!"clang version 7.0.0 (trunk 333411)"}
!1037 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !384, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !19, retainedNodes: !1038)
!1038 = !{}
!1039 = !DILocation(line: 74, column: 25, scope: !1037)
!1040 = distinct !DISubprogram(name: "axpy_kernel2", linkageName: "_Z12axpy_kernel2fPfS_", scope: !20, file: !20, line: 43, type: !1041, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, unit: !19, retainedNodes: !1038)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{null, !123, !122, !122}
!1043 = !DILocalVariable(name: "a", arg: 1, scope: !1040, file: !20, line: 43, type: !123)
!1044 = !DILocation(line: 43, column: 36, scope: !1040)
!1045 = !DILocalVariable(name: "x", arg: 2, scope: !1040, file: !20, line: 43, type: !122)
!1046 = !DILocation(line: 43, column: 46, scope: !1040)
!1047 = !DILocalVariable(name: "y", arg: 3, scope: !1040, file: !20, line: 43, type: !122)
!1048 = !DILocation(line: 43, column: 56, scope: !1040)
!1049 = !DILocation(line: 44, column: 1, scope: !1040)
!1050 = !DILocation(line: 54, column: 1, scope: !1040)
!1051 = distinct !DISubprogram(name: "axpy_kernel1", linkageName: "_Z12axpy_kernel1fPfS_", scope: !20, file: !20, line: 56, type: !1041, isLocal: false, isDefinition: true, scopeLine: 57, flags: DIFlagPrototyped, isOptimized: false, unit: !19, retainedNodes: !1038)
!1052 = !DILocalVariable(name: "a", arg: 1, scope: !1051, file: !20, line: 56, type: !123)
!1053 = !DILocation(line: 56, column: 36, scope: !1051)
!1054 = !DILocalVariable(name: "x", arg: 2, scope: !1051, file: !20, line: 56, type: !122)
!1055 = !DILocation(line: 56, column: 46, scope: !1051)
!1056 = !DILocalVariable(name: "y", arg: 3, scope: !1051, file: !20, line: 56, type: !122)
!1057 = !DILocation(line: 56, column: 56, scope: !1051)
!1058 = !DILocation(line: 57, column: 1, scope: !1051)
!1059 = !DILocation(line: 69, column: 1, scope: !1051)
!1060 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 71, type: !1061, isLocal: false, isDefinition: true, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: false, unit: !19, retainedNodes: !1038)
!1061 = !DISubroutineType(types: !1062)
!1062 = !{!11, !11, !486}
!1063 = !DILocalVariable(name: "argc", arg: 1, scope: !1060, file: !20, line: 71, type: !11)
!1064 = !DILocation(line: 71, column: 14, scope: !1060)
!1065 = !DILocalVariable(name: "argv", arg: 2, scope: !1060, file: !20, line: 71, type: !486)
!1066 = !DILocation(line: 71, column: 26, scope: !1060)
!1067 = !DILocalVariable(name: "a", scope: !1060, file: !20, line: 74, type: !123)
!1068 = !DILocation(line: 74, column: 8, scope: !1060)
!1069 = !DILocation(line: 76, column: 2, scope: !1060)
!1070 = !DILocation(line: 78, column: 6, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1060, file: !20, line: 78, column: 6)
!1072 = !DILocation(line: 78, column: 11, scope: !1071)
!1073 = !DILocation(line: 78, column: 6, scope: !1060)
!1074 = !DILocation(line: 80, column: 3, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1071, file: !20, line: 79, column: 2)
!1076 = !DILocation(line: 81, column: 3, scope: !1075)
!1077 = !DILocalVariable(name: "blocksx", scope: !1060, file: !20, line: 84, type: !11)
!1078 = !DILocation(line: 84, column: 6, scope: !1060)
!1079 = !DILocation(line: 84, column: 21, scope: !1060)
!1080 = !DILocation(line: 84, column: 16, scope: !1060)
!1081 = !DILocalVariable(name: "blocksy", scope: !1060, file: !20, line: 85, type: !11)
!1082 = !DILocation(line: 85, column: 6, scope: !1060)
!1083 = !DILocation(line: 85, column: 21, scope: !1060)
!1084 = !DILocation(line: 85, column: 16, scope: !1060)
!1085 = !DILocalVariable(name: "kDataLenx", scope: !1060, file: !20, line: 86, type: !11)
!1086 = !DILocation(line: 86, column: 6, scope: !1060)
!1087 = !DILocation(line: 86, column: 23, scope: !1060)
!1088 = !DILocation(line: 86, column: 18, scope: !1060)
!1089 = !DILocalVariable(name: "kDataLeny", scope: !1060, file: !20, line: 87, type: !11)
!1090 = !DILocation(line: 87, column: 6, scope: !1060)
!1091 = !DILocation(line: 87, column: 23, scope: !1060)
!1092 = !DILocation(line: 87, column: 18, scope: !1060)
!1093 = !DILocalVariable(name: "sizen", scope: !1060, file: !20, line: 89, type: !11)
!1094 = !DILocation(line: 89, column: 6, scope: !1060)
!1095 = !DILocation(line: 89, column: 14, scope: !1060)
!1096 = !DILocation(line: 89, column: 23, scope: !1060)
!1097 = !DILocation(line: 89, column: 22, scope: !1060)
!1098 = !DILocation(line: 89, column: 32, scope: !1060)
!1099 = !DILocation(line: 89, column: 31, scope: !1060)
!1100 = !DILocation(line: 89, column: 43, scope: !1060)
!1101 = !DILocation(line: 89, column: 42, scope: !1060)
!1102 = !DILocation(line: 91, column: 2, scope: !1060)
!1103 = !DILocalVariable(name: "host_x", scope: !1060, file: !20, line: 97, type: !122)
!1104 = !DILocation(line: 97, column: 9, scope: !1060)
!1105 = !DILocation(line: 97, column: 35, scope: !1060)
!1106 = !DILocation(line: 97, column: 40, scope: !1060)
!1107 = !DILocation(line: 97, column: 27, scope: !1060)
!1108 = !DILocation(line: 97, column: 18, scope: !1060)
!1109 = !DILocalVariable(name: "host_y", scope: !1060, file: !20, line: 98, type: !122)
!1110 = !DILocation(line: 98, column: 9, scope: !1060)
!1111 = !DILocation(line: 98, column: 35, scope: !1060)
!1112 = !DILocation(line: 98, column: 40, scope: !1060)
!1113 = !DILocation(line: 98, column: 27, scope: !1060)
!1114 = !DILocation(line: 98, column: 18, scope: !1060)
!1115 = !DILocalVariable(name: "host_newbu", scope: !1060, file: !20, line: 99, type: !124)
!1116 = !DILocation(line: 99, column: 8, scope: !1060)
!1117 = !DILocation(line: 99, column: 29, scope: !1060)
!1118 = !DILocalVariable(name: "ii", scope: !1060, file: !20, line: 101, type: !11)
!1119 = !DILocation(line: 101, column: 6, scope: !1060)
!1120 = !DILocation(line: 102, column: 9, scope: !1121)
!1121 = distinct !DILexicalBlock(scope: !1060, file: !20, line: 102, column: 2)
!1122 = !DILocation(line: 102, column: 7, scope: !1121)
!1123 = !DILocation(line: 102, column: 13, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1121, file: !20, line: 102, column: 2)
!1125 = !DILocation(line: 102, column: 16, scope: !1124)
!1126 = !DILocation(line: 102, column: 15, scope: !1124)
!1127 = !DILocation(line: 102, column: 2, scope: !1121)
!1128 = !DILocation(line: 103, column: 16, scope: !1124)
!1129 = !DILocation(line: 103, column: 18, scope: !1124)
!1130 = !DILocation(line: 103, column: 3, scope: !1124)
!1131 = !DILocation(line: 103, column: 10, scope: !1124)
!1132 = !DILocation(line: 103, column: 14, scope: !1124)
!1133 = !DILocation(line: 102, column: 25, scope: !1124)
!1134 = !DILocation(line: 102, column: 2, scope: !1124)
!1135 = distinct !{!1135, !1127, !1136}
!1136 = !DILocation(line: 103, column: 19, scope: !1121)
!1137 = !DILocation(line: 104, column: 9, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1060, file: !20, line: 104, column: 2)
!1139 = !DILocation(line: 104, column: 7, scope: !1138)
!1140 = !DILocation(line: 104, column: 13, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1138, file: !20, line: 104, column: 2)
!1142 = !DILocation(line: 104, column: 16, scope: !1141)
!1143 = !DILocation(line: 104, column: 15, scope: !1141)
!1144 = !DILocation(line: 104, column: 2, scope: !1138)
!1145 = !DILocation(line: 105, column: 16, scope: !1141)
!1146 = !DILocation(line: 105, column: 18, scope: !1141)
!1147 = !DILocation(line: 105, column: 3, scope: !1141)
!1148 = !DILocation(line: 105, column: 10, scope: !1141)
!1149 = !DILocation(line: 105, column: 14, scope: !1141)
!1150 = !DILocation(line: 104, column: 25, scope: !1141)
!1151 = !DILocation(line: 104, column: 2, scope: !1141)
!1152 = distinct !{!1152, !1144, !1153}
!1153 = !DILocation(line: 105, column: 19, scope: !1138)
!1154 = !DILocalVariable(name: "device_x", scope: !1060, file: !20, line: 115, type: !122)
!1155 = !DILocation(line: 115, column: 9, scope: !1060)
!1156 = !DILocalVariable(name: "device_y", scope: !1060, file: !20, line: 116, type: !122)
!1157 = !DILocation(line: 116, column: 9, scope: !1060)
!1158 = !DILocation(line: 120, column: 13, scope: !1060)
!1159 = !DILocation(line: 120, column: 32, scope: !1060)
!1160 = !DILocation(line: 120, column: 38, scope: !1060)
!1161 = !DILocation(line: 120, column: 2, scope: !1060)
!1162 = !DILocation(line: 123, column: 13, scope: !1060)
!1163 = !DILocation(line: 123, column: 32, scope: !1060)
!1164 = !DILocation(line: 123, column: 38, scope: !1060)
!1165 = !DILocation(line: 123, column: 54, scope: !1060)
!1166 = !DILocation(line: 123, column: 2, scope: !1060)
!1167 = !DILocation(line: 137, column: 13, scope: !1060)
!1168 = !DILocation(line: 137, column: 23, scope: !1060)
!1169 = !DILocation(line: 137, column: 31, scope: !1060)
!1170 = !DILocation(line: 137, column: 37, scope: !1060)
!1171 = !DILocation(line: 137, column: 2, scope: !1060)
!1172 = !DILocation(line: 138, column: 13, scope: !1060)
!1173 = !DILocation(line: 138, column: 23, scope: !1060)
!1174 = !DILocation(line: 138, column: 31, scope: !1060)
!1175 = !DILocation(line: 138, column: 37, scope: !1060)
!1176 = !DILocation(line: 138, column: 2, scope: !1060)
!1177 = !DILocalVariable(name: "CTAs", scope: !1060, file: !20, line: 140, type: !1178)
!1178 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1179, line: 427, baseType: !1180)
!1179 = !DIFile(filename: "/usr/local/cuda-8.0/include/vector_types.h", directory: "/home/jhpark/llvm/CUDAAdvisor/src")
!1180 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1179, line: 417, size: 96, flags: DIFlagTypePassByValue, elements: !1181, identifier: "_ZTS4dim3")
!1181 = !{!1182, !1183, !1184, !1185, !1189, !1198}
!1182 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1180, file: !1179, line: 419, baseType: !24, size: 32)
!1183 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1180, file: !1179, line: 419, baseType: !24, size: 32, offset: 32)
!1184 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1180, file: !1179, line: 419, baseType: !24, size: 32, offset: 64)
!1185 = !DISubprogram(name: "dim3", scope: !1180, file: !1179, line: 421, type: !1186, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{null, !1188, !24, !24, !24}
!1188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1180, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1189 = !DISubprogram(name: "dim3", scope: !1180, file: !1179, line: 422, type: !1190, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: false)
!1190 = !DISubroutineType(types: !1191)
!1191 = !{null, !1188, !1192}
!1192 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1179, line: 383, baseType: !1193)
!1193 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1179, line: 190, size: 96, flags: DIFlagTypePassByValue, elements: !1194, identifier: "_ZTS5uint3")
!1194 = !{!1195, !1196, !1197}
!1195 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1193, file: !1179, line: 192, baseType: !24, size: 32)
!1196 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1193, file: !1179, line: 192, baseType: !24, size: 32, offset: 32)
!1197 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1193, file: !1179, line: 192, baseType: !24, size: 32, offset: 64)
!1198 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1180, file: !1179, line: 423, type: !1199, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: false)
!1199 = !DISubroutineType(types: !1200)
!1200 = !{!1192, !1188}
!1201 = !DILocation(line: 140, column: 7, scope: !1060)
!1202 = !DILocation(line: 140, column: 12, scope: !1060)
!1203 = !DILocation(line: 140, column: 21, scope: !1060)
!1204 = !DILocalVariable(name: "Threads", scope: !1060, file: !20, line: 141, type: !1178)
!1205 = !DILocation(line: 141, column: 7, scope: !1060)
!1206 = !DILocation(line: 141, column: 15, scope: !1060)
!1207 = !DILocation(line: 141, column: 26, scope: !1060)
!1208 = !DILocation(line: 142, column: 12, scope: !1060)
!1209 = !DILocation(line: 143, column: 17, scope: !1060)
!1210 = !DILocation(line: 143, column: 23, scope: !1060)
!1211 = !DILocation(line: 143, column: 14, scope: !1060)
!1212 = !DILocation(line: 143, column: 2, scope: !1060)
!1213 = !DILocation(line: 143, column: 34, scope: !1060)
!1214 = !DILocation(line: 143, column: 37, scope: !1060)
!1215 = !DILocation(line: 143, column: 47, scope: !1060)
!1216 = !DILocation(line: 144, column: 2, scope: !1060)
!1217 = !DILocalVariable(name: "error", scope: !1060, file: !20, line: 145, type: !1218)
!1218 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !23, line: 1478, baseType: !38)
!1219 = !DILocation(line: 145, column: 14, scope: !1060)
!1220 = !DILocation(line: 145, column: 22, scope: !1060)
!1221 = !DILocation(line: 146, column: 6, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1060, file: !20, line: 146, column: 6)
!1223 = !DILocation(line: 146, column: 12, scope: !1222)
!1224 = !DILocation(line: 146, column: 6, scope: !1060)
!1225 = !DILocation(line: 147, column: 50, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1222, file: !20, line: 146, column: 28)
!1227 = !DILocation(line: 147, column: 31, scope: !1226)
!1228 = !DILocation(line: 147, column: 3, scope: !1226)
!1229 = !DILocation(line: 148, column: 3, scope: !1226)
!1230 = !DILocation(line: 151, column: 17, scope: !1060)
!1231 = !DILocation(line: 151, column: 23, scope: !1060)
!1232 = !DILocation(line: 151, column: 14, scope: !1060)
!1233 = !DILocation(line: 151, column: 2, scope: !1060)
!1234 = !DILocation(line: 151, column: 34, scope: !1060)
!1235 = !DILocation(line: 151, column: 37, scope: !1060)
!1236 = !DILocation(line: 151, column: 47, scope: !1060)
!1237 = !DILocation(line: 152, column: 2, scope: !1060)
!1238 = !DILocation(line: 153, column: 10, scope: !1060)
!1239 = !DILocation(line: 153, column: 8, scope: !1060)
!1240 = !DILocation(line: 154, column: 6, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1060, file: !20, line: 154, column: 6)
!1242 = !DILocation(line: 154, column: 12, scope: !1241)
!1243 = !DILocation(line: 154, column: 6, scope: !1060)
!1244 = !DILocation(line: 155, column: 50, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1241, file: !20, line: 154, column: 28)
!1246 = !DILocation(line: 155, column: 31, scope: !1245)
!1247 = !DILocation(line: 155, column: 3, scope: !1245)
!1248 = !DILocation(line: 156, column: 3, scope: !1245)
!1249 = !DILocation(line: 158, column: 13, scope: !1060)
!1250 = !DILocation(line: 158, column: 21, scope: !1060)
!1251 = !DILocation(line: 158, column: 31, scope: !1060)
!1252 = !DILocation(line: 158, column: 36, scope: !1060)
!1253 = !DILocation(line: 158, column: 2, scope: !1060)
!1254 = !DILocation(line: 162, column: 7, scope: !1060)
!1255 = !DILocation(line: 162, column: 2, scope: !1060)
!1256 = !DILocalVariable(name: "verify", scope: !1060, file: !20, line: 165, type: !11)
!1257 = !DILocation(line: 165, column: 6, scope: !1060)
!1258 = !DILocalVariable(name: "ii", scope: !1259, file: !20, line: 166, type: !11)
!1259 = distinct !DILexicalBlock(scope: !1060, file: !20, line: 166, column: 2)
!1260 = !DILocation(line: 166, column: 11, scope: !1259)
!1261 = !DILocation(line: 166, column: 7, scope: !1259)
!1262 = !DILocation(line: 166, column: 19, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1259, file: !20, line: 166, column: 2)
!1264 = !DILocation(line: 166, column: 22, scope: !1263)
!1265 = !DILocation(line: 166, column: 2, scope: !1259)
!1266 = !DILocation(line: 167, column: 13, scope: !1263)
!1267 = !DILocation(line: 167, column: 24, scope: !1263)
!1268 = !DILocation(line: 167, column: 21, scope: !1263)
!1269 = !DILocation(line: 167, column: 27, scope: !1263)
!1270 = !DILocation(line: 167, column: 40, scope: !1263)
!1271 = !DILocation(line: 167, column: 47, scope: !1263)
!1272 = !DILocation(line: 167, column: 37, scope: !1263)
!1273 = !DILocation(line: 167, column: 51, scope: !1263)
!1274 = !DILocation(line: 167, column: 3, scope: !1263)
!1275 = !DILocation(line: 166, column: 29, scope: !1263)
!1276 = !DILocation(line: 166, column: 2, scope: !1263)
!1277 = distinct !{!1277, !1265, !1278}
!1278 = !DILocation(line: 167, column: 54, scope: !1259)
!1279 = !DILocalVariable(name: "ii", scope: !1280, file: !20, line: 169, type: !11)
!1280 = distinct !DILexicalBlock(scope: !1060, file: !20, line: 169, column: 2)
!1281 = !DILocation(line: 169, column: 11, scope: !1280)
!1282 = !DILocation(line: 169, column: 7, scope: !1280)
!1283 = !DILocation(line: 169, column: 19, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1280, file: !20, line: 169, column: 2)
!1285 = !DILocation(line: 169, column: 24, scope: !1284)
!1286 = !DILocation(line: 169, column: 22, scope: !1284)
!1287 = !DILocation(line: 169, column: 2, scope: !1280)
!1288 = !DILocation(line: 170, column: 7, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1290, file: !20, line: 170, column: 7)
!1290 = distinct !DILexicalBlock(scope: !1284, file: !20, line: 169, column: 37)
!1291 = !DILocation(line: 170, column: 14, scope: !1289)
!1292 = !DILocation(line: 170, column: 21, scope: !1289)
!1293 = !DILocation(line: 170, column: 23, scope: !1289)
!1294 = !DILocation(line: 170, column: 18, scope: !1289)
!1295 = !DILocation(line: 170, column: 7, scope: !1290)
!1296 = !DILocation(line: 171, column: 11, scope: !1289)
!1297 = !DILocation(line: 171, column: 4, scope: !1289)
!1298 = !DILocation(line: 173, column: 2, scope: !1290)
!1299 = !DILocation(line: 169, column: 33, scope: !1284)
!1300 = !DILocation(line: 169, column: 2, scope: !1284)
!1301 = distinct !{!1301, !1287, !1302}
!1302 = !DILocation(line: 173, column: 2, scope: !1280)
!1303 = !DILocation(line: 174, column: 12, scope: !1060)
!1304 = !DILocation(line: 174, column: 61, scope: !1060)
!1305 = !DILocation(line: 174, column: 58, scope: !1060)
!1306 = !DILocation(line: 174, column: 68, scope: !1060)
!1307 = !DILocation(line: 174, column: 93, scope: !1060)
!1308 = !DILocation(line: 175, column: 6, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1060, file: !20, line: 175, column: 6)
!1310 = !DILocation(line: 175, column: 12, scope: !1309)
!1311 = !DILocation(line: 175, column: 6, scope: !1060)
!1312 = !DILocation(line: 176, column: 13, scope: !1309)
!1313 = !DILocation(line: 176, column: 40, scope: !1309)
!1314 = !DILocation(line: 176, column: 53, scope: !1309)
!1315 = !DILocation(line: 176, column: 3, scope: !1309)
!1316 = !DILocation(line: 212, column: 11, scope: !1060)
!1317 = !DILocation(line: 212, column: 2, scope: !1060)
!1318 = !DILocation(line: 213, column: 11, scope: !1060)
!1319 = !DILocation(line: 213, column: 2, scope: !1060)
!1320 = !DILocation(line: 214, column: 2, scope: !1060)
!1321 = !DILocation(line: 215, column: 2, scope: !1060)
!1322 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C1Ejjj", scope: !1180, file: !1179, line: 421, type: !1186, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !19, declaration: !1185, retainedNodes: !1038)
!1323 = !DILocalVariable(name: "this", arg: 1, scope: !1322, type: !1324, flags: DIFlagArtificial | DIFlagObjectPointer)
!1324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1180, size: 64)
!1325 = !DILocation(line: 0, scope: !1322)
!1326 = !DILocalVariable(name: "vx", arg: 2, scope: !1322, file: !1179, line: 421, type: !24)
!1327 = !DILocation(line: 421, column: 43, scope: !1322)
!1328 = !DILocalVariable(name: "vy", arg: 3, scope: !1322, file: !1179, line: 421, type: !24)
!1329 = !DILocation(line: 421, column: 64, scope: !1322)
!1330 = !DILocalVariable(name: "vz", arg: 4, scope: !1322, file: !1179, line: 421, type: !24)
!1331 = !DILocation(line: 421, column: 85, scope: !1322)
!1332 = !DILocation(line: 421, column: 115, scope: !1322)
!1333 = !DILocation(line: 421, column: 116, scope: !1322)
!1334 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1180, file: !1179, line: 421, type: !1186, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: false, unit: !19, declaration: !1185, retainedNodes: !1038)
!1335 = !DILocalVariable(name: "this", arg: 1, scope: !1334, type: !1324, flags: DIFlagArtificial | DIFlagObjectPointer)
!1336 = !DILocation(line: 0, scope: !1334)
!1337 = !DILocalVariable(name: "vx", arg: 2, scope: !1334, file: !1179, line: 421, type: !24)
!1338 = !DILocation(line: 421, column: 43, scope: !1334)
!1339 = !DILocalVariable(name: "vy", arg: 3, scope: !1334, file: !1179, line: 421, type: !24)
!1340 = !DILocation(line: 421, column: 64, scope: !1334)
!1341 = !DILocalVariable(name: "vz", arg: 4, scope: !1334, file: !1179, line: 421, type: !24)
!1342 = !DILocation(line: 421, column: 85, scope: !1334)
!1343 = !DILocation(line: 421, column: 95, scope: !1334)
!1344 = !DILocation(line: 421, column: 97, scope: !1334)
!1345 = !DILocation(line: 421, column: 102, scope: !1334)
!1346 = !DILocation(line: 421, column: 104, scope: !1334)
!1347 = !DILocation(line: 421, column: 109, scope: !1334)
!1348 = !DILocation(line: 421, column: 111, scope: !1334)
!1349 = !DILocation(line: 421, column: 116, scope: !1334)
!1350 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_axpy.cu", scope: !20, file: !20, type: !1351, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !19, retainedNodes: !1038)
!1351 = !DISubroutineType(types: !1038)
!1352 = !DILocation(line: 0, scope: !1350)
