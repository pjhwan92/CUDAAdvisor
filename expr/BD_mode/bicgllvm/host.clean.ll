; ModuleID = 'bicg.cu'
source_filename = "bicg.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timezone = type { i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

$_ZN4dim3C1Ejjj = comdat any

$_ZN4dim3C2Ejjj = comdat any

@.str = private unnamed_addr constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@NX = dso_local global i32 -1, align 4
@NY = dso_local global i32 -1, align 4
@.str.1 = private unnamed_addr constant [74 x i8] c"Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"setting device %d with name %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"grid1: %d, 1\0A\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"grid2: %d, 1\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [22 x i8] c"GPU Runtime: %0.6lfs\0A\00", align 1
@stderr = external dso_local global %struct._IO_FILE*, align 8
@.str.6 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"requires 2 arguments\0A\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"size = %d * %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"CPU Runtime: %0.6lfs\0A\00", align 1

; Function Attrs: noinline optnone uwtable
define dso_local double @_Z7rtclockv() #0 {
entry:
  %Tzp = alloca %struct.timezone, align 4
  %Tp = alloca %struct.timeval, align 8
  %stat = alloca i32, align 4
  %call = call i32 @gettimeofday(%struct.timeval* %Tp, %struct.timezone* %Tzp) #8
  store i32 %call, i32* %stat, align 4
  %0 = load i32, i32* %stat, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %stat, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i32 0, i32 0), i32 %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i32 0, i32 0
  %2 = load i64, i64* %tv_sec, align 8
  %conv = sitofp i64 %2 to double
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i32 0, i32 1
  %3 = load i64, i64* %tv_usec, align 8
  %conv2 = sitofp i64 %3 to double
  %mul = fmul contract double %conv2, 0x3EB0C6F7A0B5ED8D
  %add = fadd contract double %conv, %mul
  ret double %add
}

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @_Z6absValf(float %a) #3 {
entry:
  %retval = alloca float, align 4
  %a.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  %0 = load float, float* %a.addr, align 4
  %cmp = fcmp olt float %0, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load float, float* %a.addr, align 4
  %mul = fmul contract float %1, -1.000000e+00
  store float %mul, float* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load float, float* %a.addr, align 4
  store float %2, float* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load float, float* %retval, align 4
  ret float %3
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @_Z11percentDiffdd(double %val1, double %val2) #3 {
entry:
  %retval = alloca float, align 4
  %val1.addr = alloca double, align 8
  %val2.addr = alloca double, align 8
  store double %val1, double* %val1.addr, align 8
  store double %val2, double* %val2.addr, align 8
  %0 = load double, double* %val1.addr, align 8
  %conv = fptrunc double %0 to float
  %call = call float @_Z6absValf(float %conv)
  %conv1 = fpext float %call to double
  %cmp = fcmp olt double %conv1, 1.000000e-02
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load double, double* %val2.addr, align 8
  %conv2 = fptrunc double %1 to float
  %call3 = call float @_Z6absValf(float %conv2)
  %conv4 = fpext float %call3 to double
  %cmp5 = fcmp olt double %conv4, 1.000000e-02
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  store float 0.000000e+00, float* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %2 = load double, double* %val1.addr, align 8
  %3 = load double, double* %val2.addr, align 8
  %sub = fsub contract double %2, %3
  %conv6 = fptrunc double %sub to float
  %call7 = call float @_Z6absValf(float %conv6)
  %4 = load double, double* %val1.addr, align 8
  %add = fadd contract double %4, 0x3E45798EE0000000
  %conv8 = fptrunc double %add to float
  %call9 = call float @_Z6absValf(float %conv8)
  %div = fdiv float %call7, %call9
  %call10 = call float @_Z6absValf(float %div)
  %mul = fmul contract float 1.000000e+02, %call10
  store float %mul, float* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %5 = load float, float* %retval, align 4
  ret float %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z10init_arrayPfS_S_(float* %A, float* %p, float* %r) #3 {
entry:
  %A.addr = alloca float*, align 8
  %p.addr = alloca float*, align 8
  %r.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float* %A, float** %A.addr, align 8
  store float* %p, float** %p.addr, align 8
  store float* %r, float** %r.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @NX, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %conv = sitofp i32 %2 to double
  %mul = fmul contract double %conv, 0x400921FB54442D18
  %conv1 = fptrunc double %mul to float
  %3 = load float*, float** %r.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds float, float* %3, i64 %idxprom
  store float %conv1, float* %arrayidx, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4
  %6 = load i32, i32* @NY, align 4
  %cmp3 = icmp slt i32 %5, %6
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %7 = load i32, i32* %i, align 4
  %conv5 = sitofp i32 %7 to float
  %8 = load i32, i32* %j, align 4
  %conv6 = sitofp i32 %8 to float
  %mul7 = fmul contract float %conv5, %conv6
  %9 = load i32, i32* @NX, align 4
  %conv8 = sitofp i32 %9 to float
  %div = fdiv float %mul7, %conv8
  %10 = load float*, float** %A.addr, align 8
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* @NY, align 4
  %mul9 = mul nsw i32 %11, %12
  %13 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul9, %13
  %idxprom10 = sext i32 %add to i64
  %arrayidx11 = getelementptr inbounds float, float* %10, i64 %idxprom10
  store float %div, float* %arrayidx11, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %14 = load i32, i32* %j, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %15 = load i32, i32* %i, align 4
  %inc13 = add nsw i32 %15, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond

for.end14:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc23, %for.end14
  %16 = load i32, i32* %i, align 4
  %17 = load i32, i32* @NY, align 4
  %cmp16 = icmp slt i32 %16, %17
  br i1 %cmp16, label %for.body17, label %for.end25

for.body17:                                       ; preds = %for.cond15
  %18 = load i32, i32* %i, align 4
  %conv18 = sitofp i32 %18 to double
  %mul19 = fmul contract double %conv18, 0x400921FB54442D18
  %conv20 = fptrunc double %mul19 to float
  %19 = load float*, float** %p.addr, align 8
  %20 = load i32, i32* %i, align 4
  %idxprom21 = sext i32 %20 to i64
  %arrayidx22 = getelementptr inbounds float, float* %19, i64 %idxprom21
  store float %conv20, float* %arrayidx22, align 4
  br label %for.inc23

for.inc23:                                        ; preds = %for.body17
  %21 = load i32, i32* %i, align 4
  %inc24 = add nsw i32 %21, 1
  store i32 %inc24, i32* %i, align 4
  br label %for.cond15

for.end25:                                        ; preds = %for.cond15
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z14compareResultsPfS_S_S_(float* %s, float* %s_outputFromGpu, float* %q, float* %q_outputFromGpu) #0 {
entry:
  %s.addr = alloca float*, align 8
  %s_outputFromGpu.addr = alloca float*, align 8
  %q.addr = alloca float*, align 8
  %q_outputFromGpu.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %fail = alloca i32, align 4
  store float* %s, float** %s.addr, align 8
  store float* %s_outputFromGpu, float** %s_outputFromGpu.addr, align 8
  store float* %q, float** %q.addr, align 8
  store float* %q_outputFromGpu, float** %q_outputFromGpu.addr, align 8
  store i32 0, i32* %fail, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @NX, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load float*, float** %q.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom
  %4 = load float, float* %arrayidx, align 4
  %conv = fpext float %4 to double
  %5 = load float*, float** %q_outputFromGpu.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds float, float* %5, i64 %idxprom1
  %7 = load float, float* %arrayidx2, align 4
  %conv3 = fpext float %7 to double
  %call = call float @_Z11percentDiffdd(double %conv, double %conv3)
  %conv4 = fpext float %call to double
  %cmp5 = fcmp ogt double %conv4, 5.000000e-03
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %8 = load i32, i32* %fail, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %fail, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load i32, i32* %i, align 4
  %inc6 = add nsw i32 %9, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc22, %for.end
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* @NY, align 4
  %cmp8 = icmp slt i32 %10, %11
  br i1 %cmp8, label %for.body9, label %for.end24

for.body9:                                        ; preds = %for.cond7
  %12 = load float*, float** %s.addr, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %13 to i64
  %arrayidx11 = getelementptr inbounds float, float* %12, i64 %idxprom10
  %14 = load float, float* %arrayidx11, align 4
  %conv12 = fpext float %14 to double
  %15 = load float*, float** %s_outputFromGpu.addr, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %16 to i64
  %arrayidx14 = getelementptr inbounds float, float* %15, i64 %idxprom13
  %17 = load float, float* %arrayidx14, align 4
  %conv15 = fpext float %17 to double
  %call16 = call float @_Z11percentDiffdd(double %conv12, double %conv15)
  %conv17 = fpext float %call16 to double
  %cmp18 = fcmp ogt double %conv17, 5.000000e-03
  br i1 %cmp18, label %if.then19, label %if.end21

if.then19:                                        ; preds = %for.body9
  %18 = load i32, i32* %fail, align 4
  %inc20 = add nsw i32 %18, 1
  store i32 %inc20, i32* %fail, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then19, %for.body9
  br label %for.inc22

for.inc22:                                        ; preds = %if.end21
  %19 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %19, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond7

for.end24:                                        ; preds = %for.cond7
  %20 = load i32, i32* %fail, align 4
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.1, i32 0, i32 0), double 5.000000e-03, i32 %20)
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z13GPU_argv_initv() #0 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %call = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %deviceProp, i32 0)
  %name = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i32 0, i32 0
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %name, i32 0, i32 0
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i32 0, i32 0), i32 0, i8* %arraydecay)
  %call2 = call i32 @cudaSetDevice(i32 0)
  ret void
}

declare dso_local i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) #2

declare dso_local i32 @cudaSetDevice(i32) #2

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z12bicg_kernel1PfS_S_ii(float* %A, float* %r, float* %s, i32 %NX, i32 %NY) #0 {
entry:
  %A.addr = alloca float*, align 8
  %r.addr = alloca float*, align 8
  %s.addr = alloca float*, align 8
  %NX.addr = alloca i32, align 4
  %NY.addr = alloca i32, align 4
  store float* %A, float** %A.addr, align 8
  store float* %r, float** %r.addr, align 8
  store float* %s, float** %s.addr, align 8
  store i32 %NX, i32* %NX.addr, align 4
  store i32 %NY, i32* %NY.addr, align 4
  %0 = bitcast float** %A.addr to i8*
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0)
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %setup.next, label %setup.end

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %r.addr to i8*
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %setup.next1, label %setup.end

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %s.addr to i8*
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16)
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %setup.next2, label %setup.end

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %NX.addr to i8*
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 24)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %setup.next3, label %setup.end

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %NY.addr to i8*
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 28)
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %setup.next4, label %setup.end

setup.next4:                                      ; preds = %setup.next3
  %15 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, i32, i32)* @_Z12bicg_kernel1PfS_S_ii to i8*))
  br label %setup.end

setup.end:                                        ; preds = %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void
}

declare dso_local i32 @cudaSetupArgument(i8*, i64, i64)

declare dso_local i32 @cudaLaunch(i8*)

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z12bicg_kernel2PfS_S_ii(float* %A, float* %p, float* %q, i32 %NX, i32 %NY) #0 {
entry:
  %A.addr = alloca float*, align 8
  %p.addr = alloca float*, align 8
  %q.addr = alloca float*, align 8
  %NX.addr = alloca i32, align 4
  %NY.addr = alloca i32, align 4
  store float* %A, float** %A.addr, align 8
  store float* %p, float** %p.addr, align 8
  store float* %q, float** %q.addr, align 8
  store i32 %NX, i32* %NX.addr, align 4
  store i32 %NY, i32* %NY.addr, align 4
  %0 = bitcast float** %A.addr to i8*
  %1 = call i32 @cudaSetupArgument(i8* %0, i64 8, i64 0)
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %setup.next, label %setup.end

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %p.addr to i8*
  %4 = call i32 @cudaSetupArgument(i8* %3, i64 8, i64 8)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %setup.next1, label %setup.end

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %q.addr to i8*
  %7 = call i32 @cudaSetupArgument(i8* %6, i64 8, i64 16)
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %setup.next2, label %setup.end

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %NX.addr to i8*
  %10 = call i32 @cudaSetupArgument(i8* %9, i64 4, i64 24)
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %setup.next3, label %setup.end

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %NY.addr to i8*
  %13 = call i32 @cudaSetupArgument(i8* %12, i64 4, i64 28)
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %setup.next4, label %setup.end

setup.next4:                                      ; preds = %setup.next3
  %15 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, i32, i32)* @_Z12bicg_kernel2PfS_S_ii to i8*))
  br label %setup.end

setup.end:                                        ; preds = %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z8bicg_cpuPfS_S_S_S_(float* %A, float* %r, float* %s, float* %p, float* %q) #3 {
entry:
  %A.addr = alloca float*, align 8
  %r.addr = alloca float*, align 8
  %s.addr = alloca float*, align 8
  %p.addr = alloca float*, align 8
  %q.addr = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store float* %A, float** %A.addr, align 8
  store float* %r, float** %r.addr, align 8
  store float* %s, float** %s.addr, align 8
  store float* %p, float** %p.addr, align 8
  store float* %q, float** %q.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @NY, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load float*, float** %s.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom
  store float 0.000000e+00, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc34, %for.end
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* @NX, align 4
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end36

for.body3:                                        ; preds = %for.cond1
  %7 = load float*, float** %q.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds float, float* %7, i64 %idxprom4
  store float 0.000000e+00, float* %arrayidx5, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc31, %for.body3
  %9 = load i32, i32* %j, align 4
  %10 = load i32, i32* @NY, align 4
  %cmp7 = icmp slt i32 %9, %10
  br i1 %cmp7, label %for.body8, label %for.end33

for.body8:                                        ; preds = %for.cond6
  %11 = load float*, float** %s.addr, align 8
  %12 = load i32, i32* %j, align 4
  %idxprom9 = sext i32 %12 to i64
  %arrayidx10 = getelementptr inbounds float, float* %11, i64 %idxprom9
  %13 = load float, float* %arrayidx10, align 4
  %14 = load float*, float** %r.addr, align 8
  %15 = load i32, i32* %i, align 4
  %idxprom11 = sext i32 %15 to i64
  %arrayidx12 = getelementptr inbounds float, float* %14, i64 %idxprom11
  %16 = load float, float* %arrayidx12, align 4
  %17 = load float*, float** %A.addr, align 8
  %18 = load i32, i32* %i, align 4
  %19 = load i32, i32* @NY, align 4
  %mul = mul nsw i32 %18, %19
  %20 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %20
  %idxprom13 = sext i32 %add to i64
  %arrayidx14 = getelementptr inbounds float, float* %17, i64 %idxprom13
  %21 = load float, float* %arrayidx14, align 4
  %mul15 = fmul contract float %16, %21
  %add16 = fadd contract float %13, %mul15
  %22 = load float*, float** %s.addr, align 8
  %23 = load i32, i32* %j, align 4
  %idxprom17 = sext i32 %23 to i64
  %arrayidx18 = getelementptr inbounds float, float* %22, i64 %idxprom17
  store float %add16, float* %arrayidx18, align 4
  %24 = load float*, float** %q.addr, align 8
  %25 = load i32, i32* %i, align 4
  %idxprom19 = sext i32 %25 to i64
  %arrayidx20 = getelementptr inbounds float, float* %24, i64 %idxprom19
  %26 = load float, float* %arrayidx20, align 4
  %27 = load float*, float** %A.addr, align 8
  %28 = load i32, i32* %i, align 4
  %29 = load i32, i32* @NY, align 4
  %mul21 = mul nsw i32 %28, %29
  %30 = load i32, i32* %j, align 4
  %add22 = add nsw i32 %mul21, %30
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds float, float* %27, i64 %idxprom23
  %31 = load float, float* %arrayidx24, align 4
  %32 = load float*, float** %p.addr, align 8
  %33 = load i32, i32* %j, align 4
  %idxprom25 = sext i32 %33 to i64
  %arrayidx26 = getelementptr inbounds float, float* %32, i64 %idxprom25
  %34 = load float, float* %arrayidx26, align 4
  %mul27 = fmul contract float %31, %34
  %add28 = fadd contract float %26, %mul27
  %35 = load float*, float** %q.addr, align 8
  %36 = load i32, i32* %i, align 4
  %idxprom29 = sext i32 %36 to i64
  %arrayidx30 = getelementptr inbounds float, float* %35, i64 %idxprom29
  store float %add28, float* %arrayidx30, align 4
  br label %for.inc31

for.inc31:                                        ; preds = %for.body8
  %37 = load i32, i32* %j, align 4
  %inc32 = add nsw i32 %37, 1
  store i32 %inc32, i32* %j, align 4
  br label %for.cond6

for.end33:                                        ; preds = %for.cond6
  br label %for.inc34

for.inc34:                                        ; preds = %for.end33
  %38 = load i32, i32* %i, align 4
  %inc35 = add nsw i32 %38, 1
  store i32 %inc35, i32* %i, align 4
  br label %for.cond1

for.end36:                                        ; preds = %for.cond1
  ret void
}

; Function Attrs: noinline optnone uwtable
define dso_local void @_Z8bicgCudaPfS_S_S_S_S_S_(float* %A, float* %r, float* %s, float* %p, float* %q, float* %s_outputFromGpu, float* %q_outputFromGpu) #0 {
entry:
  %A.addr = alloca float*, align 8
  %r.addr = alloca float*, align 8
  %s.addr = alloca float*, align 8
  %p.addr = alloca float*, align 8
  %q.addr = alloca float*, align 8
  %s_outputFromGpu.addr = alloca float*, align 8
  %q_outputFromGpu.addr = alloca float*, align 8
  %t_start = alloca double, align 8
  %t_end = alloca double, align 8
  %t_m = alloca double, align 8
  %A_gpu = alloca float*, align 8
  %q_gpu = alloca float*, align 8
  %p_gpu = alloca float*, align 8
  %r_gpu = alloca float*, align 8
  %s_gpu = alloca float*, align 8
  %block = alloca %struct.dim3, align 4
  %grid1 = alloca %struct.dim3, align 4
  %grid2 = alloca %struct.dim3, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp50 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }, align 4
  %agg.tmp50.coerce = alloca { i64, i32 }, align 4
  %agg.tmp54 = alloca %struct.dim3, align 4
  %agg.tmp55 = alloca %struct.dim3, align 4
  %agg.tmp54.coerce = alloca { i64, i32 }, align 4
  %agg.tmp55.coerce = alloca { i64, i32 }, align 4
  store float* %A, float** %A.addr, align 8
  store float* %r, float** %r.addr, align 8
  store float* %s, float** %s.addr, align 8
  store float* %p, float** %p.addr, align 8
  store float* %q, float** %q.addr, align 8
  store float* %s_outputFromGpu, float** %s_outputFromGpu.addr, align 8
  store float* %q_outputFromGpu, float** %q_outputFromGpu.addr, align 8
  %0 = bitcast float** %A_gpu to i8**
  %1 = load i32, i32* @NX, align 4
  %conv = sext i32 %1 to i64
  %mul = mul i64 4, %conv
  %2 = load i32, i32* @NY, align 4
  %conv1 = sext i32 %2 to i64
  %mul2 = mul i64 %mul, %conv1
  %call = call i32 @cudaMalloc(i8** %0, i64 %mul2)
  %3 = bitcast float** %r_gpu to i8**
  %4 = load i32, i32* @NX, align 4
  %conv3 = sext i32 %4 to i64
  %mul4 = mul i64 4, %conv3
  %call5 = call i32 @cudaMalloc(i8** %3, i64 %mul4)
  %5 = bitcast float** %s_gpu to i8**
  %6 = load i32, i32* @NY, align 4
  %conv6 = sext i32 %6 to i64
  %mul7 = mul i64 4, %conv6
  %call8 = call i32 @cudaMalloc(i8** %5, i64 %mul7)
  %7 = bitcast float** %p_gpu to i8**
  %8 = load i32, i32* @NY, align 4
  %conv9 = sext i32 %8 to i64
  %mul10 = mul i64 4, %conv9
  %call11 = call i32 @cudaMalloc(i8** %7, i64 %mul10)
  %9 = bitcast float** %q_gpu to i8**
  %10 = load i32, i32* @NX, align 4
  %conv12 = sext i32 %10 to i64
  %mul13 = mul i64 4, %conv12
  %call14 = call i32 @cudaMalloc(i8** %9, i64 %mul13)
  %11 = load float*, float** %A_gpu, align 8
  %12 = bitcast float* %11 to i8*
  %13 = load float*, float** %A.addr, align 8
  %14 = bitcast float* %13 to i8*
  %15 = load i32, i32* @NX, align 4
  %conv15 = sext i32 %15 to i64
  %mul16 = mul i64 4, %conv15
  %16 = load i32, i32* @NY, align 4
  %conv17 = sext i32 %16 to i64
  %mul18 = mul i64 %mul16, %conv17
  %call19 = call i32 @cudaMemcpy(i8* %12, i8* %14, i64 %mul18, i32 1)
  %17 = load float*, float** %r_gpu, align 8
  %18 = bitcast float* %17 to i8*
  %19 = load float*, float** %r.addr, align 8
  %20 = bitcast float* %19 to i8*
  %21 = load i32, i32* @NX, align 4
  %conv20 = sext i32 %21 to i64
  %mul21 = mul i64 4, %conv20
  %call22 = call i32 @cudaMemcpy(i8* %18, i8* %20, i64 %mul21, i32 1)
  %22 = load float*, float** %s_gpu, align 8
  %23 = bitcast float* %22 to i8*
  %24 = load float*, float** %s.addr, align 8
  %25 = bitcast float* %24 to i8*
  %26 = load i32, i32* @NY, align 4
  %conv23 = sext i32 %26 to i64
  %mul24 = mul i64 4, %conv23
  %call25 = call i32 @cudaMemcpy(i8* %23, i8* %25, i64 %mul24, i32 1)
  %27 = load float*, float** %p_gpu, align 8
  %28 = bitcast float* %27 to i8*
  %29 = load float*, float** %p.addr, align 8
  %30 = bitcast float* %29 to i8*
  %31 = load i32, i32* @NY, align 4
  %conv26 = sext i32 %31 to i64
  %mul27 = mul i64 4, %conv26
  %call28 = call i32 @cudaMemcpy(i8* %28, i8* %30, i64 %mul27, i32 1)
  %32 = load float*, float** %q_gpu, align 8
  %33 = bitcast float* %32 to i8*
  %34 = load float*, float** %q.addr, align 8
  %35 = bitcast float* %34 to i8*
  %36 = load i32, i32* @NX, align 4
  %conv29 = sext i32 %36 to i64
  %mul30 = mul i64 4, %conv29
  %call31 = call i32 @cudaMemcpy(i8* %33, i8* %35, i64 %mul30, i32 1)
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %block, i32 256, i32 1, i32 1)
  %37 = load i32, i32* @NY, align 4
  %conv32 = sitofp i32 %37 to float
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 0
  %38 = load i32, i32* %x, align 4
  %conv33 = uitofp i32 %38 to float
  %div = fdiv float %conv32, %conv33
  %conv34 = fpext float %div to double
  %39 = call double @llvm.ceil.f64(double %conv34)
  %conv35 = fptoui double %39 to i64
  %conv36 = trunc i64 %conv35 to i32
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %grid1, i32 %conv36, i32 1, i32 1)
  %40 = load i32, i32* @NX, align 4
  %conv37 = sitofp i32 %40 to float
  %x38 = getelementptr inbounds %struct.dim3, %struct.dim3* %block, i32 0, i32 0
  %41 = load i32, i32* %x38, align 4
  %conv39 = uitofp i32 %41 to float
  %div40 = fdiv float %conv37, %conv39
  %conv41 = fpext float %div40 to double
  %42 = call double @llvm.ceil.f64(double %conv41)
  %conv42 = fptoui double %42 to i64
  %conv43 = trunc i64 %conv42 to i32
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %grid2, i32 %conv43, i32 1, i32 1)
  %x44 = getelementptr inbounds %struct.dim3, %struct.dim3* %grid1, i32 0, i32 0
  %43 = load i32, i32* %x44, align 4
  %call45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 %43)
  %x46 = getelementptr inbounds %struct.dim3, %struct.dim3* %grid2, i32 0, i32 0
  %44 = load i32, i32* %x46, align 4
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0), i32 %44)
  %call48 = call i32 @cudaThreadSynchronize()
  %call49 = call double @_Z7rtclockv()
  store double %call49, double* %t_start, align 8
  %45 = bitcast %struct.dim3* %agg.tmp to i8*
  %46 = bitcast %struct.dim3* %grid1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %45, i8* align 4 %46, i64 12, i1 false)
  %47 = bitcast %struct.dim3* %agg.tmp50 to i8*
  %48 = bitcast %struct.dim3* %block to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %47, i8* align 4 %48, i64 12, i1 false)
  %49 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*
  %50 = bitcast %struct.dim3* %agg.tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %49, i8* align 4 %50, i64 12, i1 false)
  %51 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0
  %52 = load i64, i64* %51, align 4
  %53 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1
  %54 = load i32, i32* %53, align 4
  %55 = bitcast { i64, i32 }* %agg.tmp50.coerce to i8*
  %56 = bitcast %struct.dim3* %agg.tmp50 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %55, i8* align 4 %56, i64 12, i1 false)
  %57 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp50.coerce, i32 0, i32 0
  %58 = load i64, i64* %57, align 4
  %59 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp50.coerce, i32 0, i32 1
  %60 = load i32, i32* %59, align 4
  %call51 = call i32 @cudaConfigureCall(i64 %52, i32 %54, i64 %58, i32 %60, i64 0, %struct.CUstream_st* null)
  %tobool = icmp ne i32 %call51, 0
  br i1 %tobool, label %kcall.end, label %kcall.configok

kcall.configok:                                   ; preds = %entry
  %61 = load float*, float** %A_gpu, align 8
  %62 = load float*, float** %r_gpu, align 8
  %63 = load float*, float** %s_gpu, align 8
  %64 = load i32, i32* @NX, align 4
  %65 = load i32, i32* @NY, align 4
  call void @_Z12bicg_kernel1PfS_S_ii(float* %61, float* %62, float* %63, i32 %64, i32 %65)
  br label %kcall.end

kcall.end:                                        ; preds = %kcall.configok, %entry
  %call52 = call i32 @cudaThreadSynchronize()
  %call53 = call double @_Z7rtclockv()
  store double %call53, double* %t_m, align 8
  %66 = bitcast %struct.dim3* %agg.tmp54 to i8*
  %67 = bitcast %struct.dim3* %grid2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %66, i8* align 4 %67, i64 12, i1 false)
  %68 = bitcast %struct.dim3* %agg.tmp55 to i8*
  %69 = bitcast %struct.dim3* %block to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %68, i8* align 4 %69, i64 12, i1 false)
  %70 = bitcast { i64, i32 }* %agg.tmp54.coerce to i8*
  %71 = bitcast %struct.dim3* %agg.tmp54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %70, i8* align 4 %71, i64 12, i1 false)
  %72 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp54.coerce, i32 0, i32 0
  %73 = load i64, i64* %72, align 4
  %74 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp54.coerce, i32 0, i32 1
  %75 = load i32, i32* %74, align 4
  %76 = bitcast { i64, i32 }* %agg.tmp55.coerce to i8*
  %77 = bitcast %struct.dim3* %agg.tmp55 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %76, i8* align 4 %77, i64 12, i1 false)
  %78 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp55.coerce, i32 0, i32 0
  %79 = load i64, i64* %78, align 4
  %80 = getelementptr inbounds { i64, i32 }, { i64, i32 }* %agg.tmp55.coerce, i32 0, i32 1
  %81 = load i32, i32* %80, align 4
  %call56 = call i32 @cudaConfigureCall(i64 %73, i32 %75, i64 %79, i32 %81, i64 0, %struct.CUstream_st* null)
  %tobool57 = icmp ne i32 %call56, 0
  br i1 %tobool57, label %kcall.end59, label %kcall.configok58

kcall.configok58:                                 ; preds = %kcall.end
  %82 = load float*, float** %A_gpu, align 8
  %83 = load float*, float** %p_gpu, align 8
  %84 = load float*, float** %q_gpu, align 8
  %85 = load i32, i32* @NX, align 4
  %86 = load i32, i32* @NY, align 4
  call void @_Z12bicg_kernel2PfS_S_ii(float* %82, float* %83, float* %84, i32 %85, i32 %86)
  br label %kcall.end59

kcall.end59:                                      ; preds = %kcall.configok58, %kcall.end
  %call60 = call i32 @cudaThreadSynchronize()
  %call61 = call double @_Z7rtclockv()
  store double %call61, double* %t_end, align 8
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %88 = load double, double* %t_end, align 8
  %89 = load double, double* %t_start, align 8
  %sub = fsub contract double %88, %89
  %call62 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %87, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i32 0, i32 0), double %sub)
  %90 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %91 = load double, double* %t_end, align 8
  %92 = load double, double* %t_start, align 8
  %sub63 = fsub contract double %91, %92
  %call64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %90, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), double %sub63)
  %93 = load float*, float** %s_outputFromGpu.addr, align 8
  %94 = bitcast float* %93 to i8*
  %95 = load float*, float** %s_gpu, align 8
  %96 = bitcast float* %95 to i8*
  %97 = load i32, i32* @NY, align 4
  %conv65 = sext i32 %97 to i64
  %mul66 = mul i64 4, %conv65
  %call67 = call i32 @cudaMemcpy(i8* %94, i8* %96, i64 %mul66, i32 2)
  %98 = load float*, float** %q_outputFromGpu.addr, align 8
  %99 = bitcast float* %98 to i8*
  %100 = load float*, float** %q_gpu, align 8
  %101 = bitcast float* %100 to i8*
  %102 = load i32, i32* @NX, align 4
  %conv68 = sext i32 %102 to i64
  %mul69 = mul i64 4, %conv68
  %call70 = call i32 @cudaMemcpy(i8* %99, i8* %101, i64 %mul69, i32 2)
  %103 = load float*, float** %A_gpu, align 8
  %104 = bitcast float* %103 to i8*
  %call71 = call i32 @cudaFree(i8* %104)
  %105 = load float*, float** %r_gpu, align 8
  %106 = bitcast float* %105 to i8*
  %call72 = call i32 @cudaFree(i8* %106)
  %107 = load float*, float** %s_gpu, align 8
  %108 = bitcast float* %107 to i8*
  %call73 = call i32 @cudaFree(i8* %108)
  %109 = load float*, float** %p_gpu, align 8
  %110 = bitcast float* %109 to i8*
  %call74 = call i32 @cudaFree(i8* %110)
  %111 = load float*, float** %q_gpu, align 8
  %112 = bitcast float* %111 to i8*
  %call75 = call i32 @cudaFree(i8* %112)
  ret void
}

declare dso_local i32 @cudaMalloc(i8**, i64) #2

declare dso_local i32 @cudaMemcpy(i8*, i8*, i64, i32) #2

; Function Attrs: noinline optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C1Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #0 comdat align 2 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  store i32 %vx, i32* %vx.addr, align 4
  store i32 %vy, i32* %vy.addr, align 4
  store i32 %vz, i32* %vz.addr, align 4
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %0 = load i32, i32* %vx.addr, align 4
  %1 = load i32, i32* %vy.addr, align 4
  %2 = load i32, i32* %vz.addr, align 4
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %this1, i32 %0, i32 %1, i32 %2)
  ret void
}

; Function Attrs: nounwind readnone speculatable
declare double @llvm.ceil.f64(double) #4

declare dso_local i32 @cudaThreadSynchronize() #2

declare dso_local i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #5

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare dso_local i32 @cudaFree(i8*) #2

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #6 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %t_start = alloca double, align 8
  %t_end = alloca double, align 8
  %A = alloca float*, align 8
  %r = alloca float*, align 8
  %s = alloca float*, align 8
  %p = alloca float*, align 8
  %q = alloca float*, align 8
  %s_outputFromGpu = alloca float*, align 8
  %q_outputFromGpu = alloca float*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp ne i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i32 0, i32 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1
  %2 = load i8*, i8** %arrayidx, align 8
  %call1 = call i32 @atoi(i8* %2) #9
  store i32 %call1, i32* @NX, align 4
  %3 = load i8**, i8*** %argv.addr, align 8
  %arrayidx2 = getelementptr inbounds i8*, i8** %3, i64 2
  %4 = load i8*, i8** %arrayidx2, align 8
  %call3 = call i32 @atoi(i8* %4) #9
  store i32 %call3, i32* @NY, align 4
  %5 = load i32, i32* @NX, align 4
  %6 = load i32, i32* @NY, align 4
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i32 0, i32 0), i32 %5, i32 %6)
  %7 = load i32, i32* @NX, align 4
  %8 = load i32, i32* @NY, align 4
  %mul = mul nsw i32 %7, %8
  %conv = sext i32 %mul to i64
  %mul5 = mul i64 %conv, 4
  %call6 = call noalias i8* @malloc(i64 %mul5) #8
  %9 = bitcast i8* %call6 to float*
  store float* %9, float** %A, align 8
  %10 = load i32, i32* @NX, align 4
  %conv7 = sext i32 %10 to i64
  %mul8 = mul i64 %conv7, 4
  %call9 = call noalias i8* @malloc(i64 %mul8) #8
  %11 = bitcast i8* %call9 to float*
  store float* %11, float** %r, align 8
  %12 = load i32, i32* @NY, align 4
  %conv10 = sext i32 %12 to i64
  %mul11 = mul i64 %conv10, 4
  %call12 = call noalias i8* @malloc(i64 %mul11) #8
  %13 = bitcast i8* %call12 to float*
  store float* %13, float** %s, align 8
  %14 = load i32, i32* @NY, align 4
  %conv13 = sext i32 %14 to i64
  %mul14 = mul i64 %conv13, 4
  %call15 = call noalias i8* @malloc(i64 %mul14) #8
  %15 = bitcast i8* %call15 to float*
  store float* %15, float** %p, align 8
  %16 = load i32, i32* @NX, align 4
  %conv16 = sext i32 %16 to i64
  %mul17 = mul i64 %conv16, 4
  %call18 = call noalias i8* @malloc(i64 %mul17) #8
  %17 = bitcast i8* %call18 to float*
  store float* %17, float** %q, align 8
  %18 = load i32, i32* @NY, align 4
  %conv19 = sext i32 %18 to i64
  %mul20 = mul i64 %conv19, 4
  %call21 = call noalias i8* @malloc(i64 %mul20) #8
  %19 = bitcast i8* %call21 to float*
  store float* %19, float** %s_outputFromGpu, align 8
  %20 = load i32, i32* @NX, align 4
  %conv22 = sext i32 %20 to i64
  %mul23 = mul i64 %conv22, 4
  %call24 = call noalias i8* @malloc(i64 %mul23) #8
  %21 = bitcast i8* %call24 to float*
  store float* %21, float** %q_outputFromGpu, align 8
  %22 = load float*, float** %A, align 8
  %23 = load float*, float** %p, align 8
  %24 = load float*, float** %r, align 8
  call void @_Z10init_arrayPfS_S_(float* %22, float* %23, float* %24)
  call void @_Z13GPU_argv_initv()
  %25 = load float*, float** %A, align 8
  %26 = load float*, float** %r, align 8
  %27 = load float*, float** %s, align 8
  %28 = load float*, float** %p, align 8
  %29 = load float*, float** %q, align 8
  %30 = load float*, float** %s_outputFromGpu, align 8
  %31 = load float*, float** %q_outputFromGpu, align 8
  call void @_Z8bicgCudaPfS_S_S_S_S_S_(float* %25, float* %26, float* %27, float* %28, float* %29, float* %30, float* %31)
  %call25 = call double @_Z7rtclockv()
  store double %call25, double* %t_start, align 8
  %32 = load float*, float** %A, align 8
  %33 = load float*, float** %r, align 8
  %34 = load float*, float** %s, align 8
  %35 = load float*, float** %p, align 8
  %36 = load float*, float** %q, align 8
  call void @_Z8bicg_cpuPfS_S_S_S_(float* %32, float* %33, float* %34, float* %35, float* %36)
  %call26 = call double @_Z7rtclockv()
  store double %call26, double* %t_end, align 8
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %38 = load double, double* %t_end, align 8
  %39 = load double, double* %t_start, align 8
  %sub = fsub contract double %38, %39
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i32 0, i32 0), double %sub)
  %40 = load float*, float** %s, align 8
  %41 = load float*, float** %s_outputFromGpu, align 8
  %42 = load float*, float** %q, align 8
  %43 = load float*, float** %q_outputFromGpu, align 8
  call void @_Z14compareResultsPfS_S_S_(float* %40, float* %41, float* %42, float* %43)
  %44 = load float*, float** %A, align 8
  %45 = bitcast float* %44 to i8*
  call void @free(i8* %45) #8
  %46 = load float*, float** %r, align 8
  %47 = bitcast float* %46 to i8*
  call void @free(i8* %47) #8
  %48 = load float*, float** %s, align 8
  %49 = bitcast float* %48 to i8*
  call void @free(i8* %49) #8
  %50 = load float*, float** %p, align 8
  %51 = bitcast float* %50 to i8*
  call void @free(i8* %51) #8
  %52 = load float*, float** %q, align 8
  %53 = bitcast float* %52 to i8*
  call void @free(i8* %53) #8
  %54 = load float*, float** %s_outputFromGpu, align 8
  %55 = bitcast float* %54 to i8*
  call void @free(i8* %55) #8
  %56 = load float*, float** %q_outputFromGpu, align 8
  %57 = bitcast float* %56 to i8*
  call void @free(i8* %57) #8
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %58 = load i32, i32* %retval, align 4
  ret i32 %58
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #7

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr #3 comdat align 2 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  store i32 %vx, i32* %vx.addr, align 4
  store i32 %vy, i32* %vy.addr, align 4
  store i32 %vz, i32* %vz.addr, align 4
  %this1 = load %struct.dim3*, %struct.dim3** %this.addr, align 8
  %x = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 0
  %0 = load i32, i32* %vx.addr, align 4
  store i32 %0, i32* %x, align 4
  %y = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 1
  %1 = load i32, i32* %vy.addr, align 4
  store i32 %1, i32* %y, align 4
  %z = getelementptr inbounds %struct.dim3, %struct.dim3* %this1, i32 0, i32 2
  %2 = load i32, i32* %vz.addr, align 4
  store i32 %2, i32* %z, align 4
  ret void
}

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable }
attributes #5 = { argmemonly nounwind }
attributes #6 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 (trunk 333411)"}
