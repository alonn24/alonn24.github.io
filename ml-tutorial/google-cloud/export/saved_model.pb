эС
ЈР
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"TА

value"T

output_ref"TА"	
Ttype"
validate_shapebool("
use_lockingbool(Ш
s
	AssignAdd
ref"TА

value"T

output_ref"TА" 
Ttype:
2	"
use_lockingbool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
~
BiasAddGrad
out_backprop"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
R
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
8
Const
output"dtype"
valuetensor"
dtypetype
S
DynamicStitch
indices*N
data"T*N
merged"T"
Nint(0"	
Ttype
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
?
FloorDiv
x"T
y"T
z"T"
Ttype:
2	
8
FloorMod
x"T
y"T
z"T"
Ttype:	
2	
.
Identity

input"T
output"T"	
Ttype
N
IsVariableInitialized
ref"dtypeА
is_initialized
"
dtypetypeШ
p
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
	2
;
Maximum
x"T
y"T
z"T"
Ttype:

2	Р
Н
Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(И
;
Minimum
x"T
y"T
z"T"
Ttype:

2	Р
=
Mul
x"T
y"T
z"T"
Ttype:
2	Р
.
Neg
x"T
y"T"
Ttype:

2	

NoOp
E
NotEqual
x"T
y"T
z
"
Ttype:
2	
Р
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
6
Pow
x"T
y"T
z"T"
Ttype:

2	
Н
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	И
a
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:	
2	
>
RealDiv
x"T
y"T
z"T"
Ttype:
2	
D
Relu
features"T
activations"T"
Ttype:
2	
V
ReluGrad
	gradients"T
features"T
	backprops"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
-
Sqrt
x"T
y"T"
Ttype:

2
1
Square
x"T
y"T"
Ttype:

2	
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
:
Sub
x"T
y"T
z"T"
Ttype:
2	
М
Sum

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
s

VariableV2
ref"dtypeА"
shapeshape"
dtypetype"
	containerstring "
shared_namestring И"serve*1.7.02v1.7.0-3-g024aecf414і≤
p
layer_1_inputPlaceholder*
shape:€€€€€€€€€	*
dtype0*'
_output_shapes
:€€€€€€€€€	
m
layer_1/random_uniform/shapeConst*
valueB"	   2   *
dtype0*
_output_shapes
:
_
layer_1/random_uniform/minConst*
valueB
 *dF£Њ*
dtype0*
_output_shapes
: 
_
layer_1/random_uniform/maxConst*
valueB
 *dF£>*
dtype0*
_output_shapes
: 
І
$layer_1/random_uniform/RandomUniformRandomUniformlayer_1/random_uniform/shape*
T0*
dtype0*
_output_shapes

:	2*
seed2ЊЋp*
seed±€е)
z
layer_1/random_uniform/subSublayer_1/random_uniform/maxlayer_1/random_uniform/min*
_output_shapes
: *
T0
М
layer_1/random_uniform/mulMul$layer_1/random_uniform/RandomUniformlayer_1/random_uniform/sub*
T0*
_output_shapes

:	2
~
layer_1/random_uniformAddlayer_1/random_uniform/mullayer_1/random_uniform/min*
T0*
_output_shapes

:	2
В
layer_1/kernel
VariableV2*
shared_name *
dtype0*
_output_shapes

:	2*
	container *
shape
:	2
Љ
layer_1/kernel/AssignAssignlayer_1/kernellayer_1/random_uniform*
use_locking(*
T0*!
_class
loc:@layer_1/kernel*
validate_shape(*
_output_shapes

:	2
{
layer_1/kernel/readIdentitylayer_1/kernel*
T0*!
_class
loc:@layer_1/kernel*
_output_shapes

:	2
Z
layer_1/ConstConst*
valueB2*    *
dtype0*
_output_shapes
:2
x
layer_1/bias
VariableV2*
shared_name *
dtype0*
_output_shapes
:2*
	container *
shape:2
©
layer_1/bias/AssignAssignlayer_1/biaslayer_1/Const*
T0*
_class
loc:@layer_1/bias*
validate_shape(*
_output_shapes
:2*
use_locking(
q
layer_1/bias/readIdentitylayer_1/bias*
T0*
_class
loc:@layer_1/bias*
_output_shapes
:2
Ф
layer_1/MatMulMatMullayer_1_inputlayer_1/kernel/read*
transpose_b( *
T0*'
_output_shapes
:€€€€€€€€€2*
transpose_a( 
Ж
layer_1/BiasAddBiasAddlayer_1/MatMullayer_1/bias/read*
T0*
data_formatNHWC*'
_output_shapes
:€€€€€€€€€2
W
layer_1/ReluRelulayer_1/BiasAdd*'
_output_shapes
:€€€€€€€€€2*
T0
m
layer_2/random_uniform/shapeConst*
valueB"2   d   *
dtype0*
_output_shapes
:
_
layer_2/random_uniform/minConst*
valueB
 *ЌћLЊ*
dtype0*
_output_shapes
: 
_
layer_2/random_uniform/maxConst*
valueB
 *ЌћL>*
dtype0*
_output_shapes
: 
®
$layer_2/random_uniform/RandomUniformRandomUniformlayer_2/random_uniform/shape*
dtype0*
_output_shapes

:2d*
seed2ҐЌљ*
seed±€е)*
T0
z
layer_2/random_uniform/subSublayer_2/random_uniform/maxlayer_2/random_uniform/min*
_output_shapes
: *
T0
М
layer_2/random_uniform/mulMul$layer_2/random_uniform/RandomUniformlayer_2/random_uniform/sub*
T0*
_output_shapes

:2d
~
layer_2/random_uniformAddlayer_2/random_uniform/mullayer_2/random_uniform/min*
T0*
_output_shapes

:2d
В
layer_2/kernel
VariableV2*
dtype0*
_output_shapes

:2d*
	container *
shape
:2d*
shared_name 
Љ
layer_2/kernel/AssignAssignlayer_2/kernellayer_2/random_uniform*
use_locking(*
T0*!
_class
loc:@layer_2/kernel*
validate_shape(*
_output_shapes

:2d
{
layer_2/kernel/readIdentitylayer_2/kernel*
_output_shapes

:2d*
T0*!
_class
loc:@layer_2/kernel
Z
layer_2/ConstConst*
dtype0*
_output_shapes
:d*
valueBd*    
x
layer_2/bias
VariableV2*
shared_name *
dtype0*
_output_shapes
:d*
	container *
shape:d
©
layer_2/bias/AssignAssignlayer_2/biaslayer_2/Const*
T0*
_class
loc:@layer_2/bias*
validate_shape(*
_output_shapes
:d*
use_locking(
q
layer_2/bias/readIdentitylayer_2/bias*
_output_shapes
:d*
T0*
_class
loc:@layer_2/bias
У
layer_2/MatMulMatMullayer_1/Relulayer_2/kernel/read*
transpose_b( *
T0*'
_output_shapes
:€€€€€€€€€d*
transpose_a( 
Ж
layer_2/BiasAddBiasAddlayer_2/MatMullayer_2/bias/read*
data_formatNHWC*'
_output_shapes
:€€€€€€€€€d*
T0
W
layer_2/ReluRelulayer_2/BiasAdd*
T0*'
_output_shapes
:€€€€€€€€€d
m
layer_3/random_uniform/shapeConst*
valueB"d   2   *
dtype0*
_output_shapes
:
_
layer_3/random_uniform/minConst*
valueB
 *ЌћLЊ*
dtype0*
_output_shapes
: 
_
layer_3/random_uniform/maxConst*
valueB
 *ЌћL>*
dtype0*
_output_shapes
: 
®
$layer_3/random_uniform/RandomUniformRandomUniformlayer_3/random_uniform/shape*
dtype0*
_output_shapes

:d2*
seed2феА*
seed±€е)*
T0
z
layer_3/random_uniform/subSublayer_3/random_uniform/maxlayer_3/random_uniform/min*
T0*
_output_shapes
: 
М
layer_3/random_uniform/mulMul$layer_3/random_uniform/RandomUniformlayer_3/random_uniform/sub*
_output_shapes

:d2*
T0
~
layer_3/random_uniformAddlayer_3/random_uniform/mullayer_3/random_uniform/min*
T0*
_output_shapes

:d2
В
layer_3/kernel
VariableV2*
shared_name *
dtype0*
_output_shapes

:d2*
	container *
shape
:d2
Љ
layer_3/kernel/AssignAssignlayer_3/kernellayer_3/random_uniform*
T0*!
_class
loc:@layer_3/kernel*
validate_shape(*
_output_shapes

:d2*
use_locking(
{
layer_3/kernel/readIdentitylayer_3/kernel*
T0*!
_class
loc:@layer_3/kernel*
_output_shapes

:d2
Z
layer_3/ConstConst*
valueB2*    *
dtype0*
_output_shapes
:2
x
layer_3/bias
VariableV2*
shared_name *
dtype0*
_output_shapes
:2*
	container *
shape:2
©
layer_3/bias/AssignAssignlayer_3/biaslayer_3/Const*
use_locking(*
T0*
_class
loc:@layer_3/bias*
validate_shape(*
_output_shapes
:2
q
layer_3/bias/readIdentitylayer_3/bias*
T0*
_class
loc:@layer_3/bias*
_output_shapes
:2
У
layer_3/MatMulMatMullayer_2/Relulayer_3/kernel/read*
T0*'
_output_shapes
:€€€€€€€€€2*
transpose_a( *
transpose_b( 
Ж
layer_3/BiasAddBiasAddlayer_3/MatMullayer_3/bias/read*
T0*
data_formatNHWC*'
_output_shapes
:€€€€€€€€€2
W
layer_3/ReluRelulayer_3/BiasAdd*
T0*'
_output_shapes
:€€€€€€€€€2
r
!output_layer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*
valueB"2      
d
output_layer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *SЭѓЊ
d
output_layer/random_uniform/maxConst*
valueB
 *SЭѓ>*
dtype0*
_output_shapes
: 
≤
)output_layer/random_uniform/RandomUniformRandomUniform!output_layer/random_uniform/shape*
T0*
dtype0*
_output_shapes

:2*
seed2§∞•*
seed±€е)
Й
output_layer/random_uniform/subSuboutput_layer/random_uniform/maxoutput_layer/random_uniform/min*
T0*
_output_shapes
: 
Ы
output_layer/random_uniform/mulMul)output_layer/random_uniform/RandomUniformoutput_layer/random_uniform/sub*
T0*
_output_shapes

:2
Н
output_layer/random_uniformAddoutput_layer/random_uniform/muloutput_layer/random_uniform/min*
T0*
_output_shapes

:2
З
output_layer/kernel
VariableV2*
dtype0*
_output_shapes

:2*
	container *
shape
:2*
shared_name 
–
output_layer/kernel/AssignAssignoutput_layer/kerneloutput_layer/random_uniform*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0*&
_class
loc:@output_layer/kernel
К
output_layer/kernel/readIdentityoutput_layer/kernel*
T0*&
_class
loc:@output_layer/kernel*
_output_shapes

:2
_
output_layer/ConstConst*
valueB*    *
dtype0*
_output_shapes
:
}
output_layer/bias
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
љ
output_layer/bias/AssignAssignoutput_layer/biasoutput_layer/Const*
use_locking(*
T0*$
_class
loc:@output_layer/bias*
validate_shape(*
_output_shapes
:
А
output_layer/bias/readIdentityoutput_layer/bias*
_output_shapes
:*
T0*$
_class
loc:@output_layer/bias
Э
output_layer/MatMulMatMullayer_3/Reluoutput_layer/kernel/read*
transpose_b( *
T0*'
_output_shapes
:€€€€€€€€€*
transpose_a( 
Х
output_layer/BiasAddBiasAddoutput_layer/MatMuloutput_layer/bias/read*
T0*
data_formatNHWC*'
_output_shapes
:€€€€€€€€€
\
PlaceholderPlaceholder*
shape
:	2*
dtype0*
_output_shapes

:	2
Ґ
AssignAssignlayer_1/kernelPlaceholder*
use_locking( *
T0*!
_class
loc:@layer_1/kernel*
validate_shape(*
_output_shapes

:	2
V
Placeholder_1Placeholder*
dtype0*
_output_shapes
:2*
shape:2
Ю
Assign_1Assignlayer_1/biasPlaceholder_1*
T0*
_class
loc:@layer_1/bias*
validate_shape(*
_output_shapes
:2*
use_locking( 
^
Placeholder_2Placeholder*
shape
:2d*
dtype0*
_output_shapes

:2d
¶
Assign_2Assignlayer_2/kernelPlaceholder_2*
T0*!
_class
loc:@layer_2/kernel*
validate_shape(*
_output_shapes

:2d*
use_locking( 
V
Placeholder_3Placeholder*
dtype0*
_output_shapes
:d*
shape:d
Ю
Assign_3Assignlayer_2/biasPlaceholder_3*
use_locking( *
T0*
_class
loc:@layer_2/bias*
validate_shape(*
_output_shapes
:d
^
Placeholder_4Placeholder*
dtype0*
_output_shapes

:d2*
shape
:d2
¶
Assign_4Assignlayer_3/kernelPlaceholder_4*
validate_shape(*
_output_shapes

:d2*
use_locking( *
T0*!
_class
loc:@layer_3/kernel
V
Placeholder_5Placeholder*
shape:2*
dtype0*
_output_shapes
:2
Ю
Assign_5Assignlayer_3/biasPlaceholder_5*
T0*
_class
loc:@layer_3/bias*
validate_shape(*
_output_shapes
:2*
use_locking( 
^
Placeholder_6Placeholder*
dtype0*
_output_shapes

:2*
shape
:2
∞
Assign_6Assignoutput_layer/kernelPlaceholder_6*
use_locking( *
T0*&
_class
loc:@output_layer/kernel*
validate_shape(*
_output_shapes

:2
V
Placeholder_7Placeholder*
dtype0*
_output_shapes
:*
shape:
®
Assign_7Assignoutput_layer/biasPlaceholder_7*
use_locking( *
T0*$
_class
loc:@output_layer/bias*
validate_shape(*
_output_shapes
:
Ж
IsVariableInitializedIsVariableInitializedlayer_1/kernel*!
_class
loc:@layer_1/kernel*
dtype0*
_output_shapes
: 
Д
IsVariableInitialized_1IsVariableInitializedlayer_1/bias*
dtype0*
_output_shapes
: *
_class
loc:@layer_1/bias
И
IsVariableInitialized_2IsVariableInitializedlayer_2/kernel*!
_class
loc:@layer_2/kernel*
dtype0*
_output_shapes
: 
Д
IsVariableInitialized_3IsVariableInitializedlayer_2/bias*
_class
loc:@layer_2/bias*
dtype0*
_output_shapes
: 
И
IsVariableInitialized_4IsVariableInitializedlayer_3/kernel*
dtype0*
_output_shapes
: *!
_class
loc:@layer_3/kernel
Д
IsVariableInitialized_5IsVariableInitializedlayer_3/bias*
dtype0*
_output_shapes
: *
_class
loc:@layer_3/bias
Т
IsVariableInitialized_6IsVariableInitializedoutput_layer/kernel*&
_class
loc:@output_layer/kernel*
dtype0*
_output_shapes
: 
О
IsVariableInitialized_7IsVariableInitializedoutput_layer/bias*$
_class
loc:@output_layer/bias*
dtype0*
_output_shapes
: 
ќ
initNoOp^layer_1/kernel/Assign^layer_1/bias/Assign^layer_2/kernel/Assign^layer_2/bias/Assign^layer_3/kernel/Assign^layer_3/bias/Assign^output_layer/kernel/Assign^output_layer/bias/Assign
_
Adam/iterations/initial_valueConst*
value	B	 R *
dtype0	*
_output_shapes
: 
s
Adam/iterations
VariableV2*
shape: *
shared_name *
dtype0	*
_output_shapes
: *
	container 
Њ
Adam/iterations/AssignAssignAdam/iterationsAdam/iterations/initial_value*
T0	*"
_class
loc:@Adam/iterations*
validate_shape(*
_output_shapes
: *
use_locking(
v
Adam/iterations/readIdentityAdam/iterations*
_output_shapes
: *
T0	*"
_class
loc:@Adam/iterations
Z
Adam/lr/initial_valueConst*
valueB
 *oГ:*
dtype0*
_output_shapes
: 
k
Adam/lr
VariableV2*
shared_name *
dtype0*
_output_shapes
: *
	container *
shape: 
Ю
Adam/lr/AssignAssignAdam/lrAdam/lr/initial_value*
T0*
_class
loc:@Adam/lr*
validate_shape(*
_output_shapes
: *
use_locking(
^
Adam/lr/readIdentityAdam/lr*
T0*
_class
loc:@Adam/lr*
_output_shapes
: 
^
Adam/beta_1/initial_valueConst*
valueB
 *fff?*
dtype0*
_output_shapes
: 
o
Adam/beta_1
VariableV2*
shape: *
shared_name *
dtype0*
_output_shapes
: *
	container 
Ѓ
Adam/beta_1/AssignAssignAdam/beta_1Adam/beta_1/initial_value*
use_locking(*
T0*
_class
loc:@Adam/beta_1*
validate_shape(*
_output_shapes
: 
j
Adam/beta_1/readIdentityAdam/beta_1*
T0*
_class
loc:@Adam/beta_1*
_output_shapes
: 
^
Adam/beta_2/initial_valueConst*
valueB
 *wЊ?*
dtype0*
_output_shapes
: 
o
Adam/beta_2
VariableV2*
shape: *
shared_name *
dtype0*
_output_shapes
: *
	container 
Ѓ
Adam/beta_2/AssignAssignAdam/beta_2Adam/beta_2/initial_value*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Adam/beta_2
j
Adam/beta_2/readIdentityAdam/beta_2*
T0*
_class
loc:@Adam/beta_2*
_output_shapes
: 
]
Adam/decay/initial_valueConst*
dtype0*
_output_shapes
: *
valueB
 *    
n

Adam/decay
VariableV2*
dtype0*
_output_shapes
: *
	container *
shape: *
shared_name 
™
Adam/decay/AssignAssign
Adam/decayAdam/decay/initial_value*
T0*
_class
loc:@Adam/decay*
validate_shape(*
_output_shapes
: *
use_locking(
g
Adam/decay/readIdentity
Adam/decay*
T0*
_class
loc:@Adam/decay*
_output_shapes
: 
И
output_layer_targetPlaceholder*%
shape:€€€€€€€€€€€€€€€€€€*
dtype0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
v
output_layer_sample_weightsPlaceholder*
dtype0*#
_output_shapes
:€€€€€€€€€*
shape:€€€€€€€€€
З
loss/output_layer_loss/subSuboutput_layer/BiasAddoutput_layer_target*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
~
loss/output_layer_loss/SquareSquareloss/output_layer_loss/sub*0
_output_shapes
:€€€€€€€€€€€€€€€€€€*
T0
x
-loss/output_layer_loss/Mean/reduction_indicesConst*
valueB :
€€€€€€€€€*
dtype0*
_output_shapes
: 
Љ
loss/output_layer_loss/MeanMeanloss/output_layer_loss/Square-loss/output_layer_loss/Mean/reduction_indices*

Tidx0*
	keep_dims( *
T0*#
_output_shapes
:€€€€€€€€€
r
/loss/output_layer_loss/Mean_1/reduction_indicesConst*
valueB *
dtype0*
_output_shapes
: 
Њ
loss/output_layer_loss/Mean_1Meanloss/output_layer_loss/Mean/loss/output_layer_loss/Mean_1/reduction_indices*
T0*#
_output_shapes
:€€€€€€€€€*

Tidx0*
	keep_dims( 
Л
loss/output_layer_loss/mulMulloss/output_layer_loss/Mean_1output_layer_sample_weights*
T0*#
_output_shapes
:€€€€€€€€€
f
!loss/output_layer_loss/NotEqual/yConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Щ
loss/output_layer_loss/NotEqualNotEqualoutput_layer_sample_weights!loss/output_layer_loss/NotEqual/y*#
_output_shapes
:€€€€€€€€€*
T0
Б
loss/output_layer_loss/CastCastloss/output_layer_loss/NotEqual*#
_output_shapes
:€€€€€€€€€*

DstT0*

SrcT0

f
loss/output_layer_loss/ConstConst*
dtype0*
_output_shapes
:*
valueB: 
Ю
loss/output_layer_loss/Mean_2Meanloss/output_layer_loss/Castloss/output_layer_loss/Const*

Tidx0*
	keep_dims( *
T0*
_output_shapes
: 
Т
loss/output_layer_loss/truedivRealDivloss/output_layer_loss/mulloss/output_layer_loss/Mean_2*
T0*#
_output_shapes
:€€€€€€€€€
h
loss/output_layer_loss/Const_1Const*
valueB: *
dtype0*
_output_shapes
:
£
loss/output_layer_loss/Mean_3Meanloss/output_layer_loss/truedivloss/output_layer_loss/Const_1*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0
O

loss/mul/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
[
loss/mulMul
loss/mul/xloss/output_layer_loss/Mean_3*
_output_shapes
: *
T0
}
training/Adam/gradients/ShapeConst*
dtype0*
_output_shapes
: *
valueB *
_class
loc:@loss/mul
Г
!training/Adam/gradients/grad_ys_0Const*
valueB
 *  А?*
_class
loc:@loss/mul*
dtype0*
_output_shapes
: 
ґ
training/Adam/gradients/FillFilltraining/Adam/gradients/Shape!training/Adam/gradients/grad_ys_0*
_output_shapes
: *
T0*

index_type0*
_class
loc:@loss/mul
Ђ
)training/Adam/gradients/loss/mul_grad/MulMultraining/Adam/gradients/Fillloss/output_layer_loss/Mean_3*
T0*
_class
loc:@loss/mul*
_output_shapes
: 
Ъ
+training/Adam/gradients/loss/mul_grad/Mul_1Multraining/Adam/gradients/Fill
loss/mul/x*
T0*
_class
loc:@loss/mul*
_output_shapes
: 
ƒ
Htraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Reshape/shapeConst*
valueB:*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
dtype0*
_output_shapes
:
©
Btraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/ReshapeReshape+training/Adam/gradients/loss/mul_grad/Mul_1Htraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Reshape/shape*
T0*
Tshape0*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
_output_shapes
:
–
@training/Adam/gradients/loss/output_layer_loss/Mean_3_grad/ShapeShapeloss/output_layer_loss/truediv*
T0*
out_type0*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
_output_shapes
:
њ
?training/Adam/gradients/loss/output_layer_loss/Mean_3_grad/TileTileBtraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Reshape@training/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Shape*

Tmultiples0*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*#
_output_shapes
:€€€€€€€€€
“
Btraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Shape_1Shapeloss/output_layer_loss/truediv*
T0*
out_type0*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
_output_shapes
:
Ј
Btraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Shape_2Const*
dtype0*
_output_shapes
: *
valueB *0
_class&
$"loc:@loss/output_layer_loss/Mean_3
Љ
@training/Adam/gradients/loss/output_layer_loss/Mean_3_grad/ConstConst*
valueB: *0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
dtype0*
_output_shapes
:
љ
?training/Adam/gradients/loss/output_layer_loss/Mean_3_grad/ProdProdBtraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Shape_1@training/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Const*

Tidx0*
	keep_dims( *
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
_output_shapes
: 
Њ
Btraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Const_1Const*
valueB: *0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
dtype0*
_output_shapes
:
Ѕ
Atraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Prod_1ProdBtraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Shape_2Btraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Const_1*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
_output_shapes
: *

Tidx0*
	keep_dims( 
Є
Dtraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Maximum/yConst*
value	B :*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
dtype0*
_output_shapes
: 
©
Btraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/MaximumMaximumAtraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Prod_1Dtraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Maximum/y*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
_output_shapes
: 
І
Ctraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/floordivFloorDiv?training/Adam/gradients/loss/output_layer_loss/Mean_3_grad/ProdBtraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Maximum*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
_output_shapes
: 
о
?training/Adam/gradients/loss/output_layer_loss/Mean_3_grad/CastCastCtraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/floordiv*

SrcT0*0
_class&
$"loc:@loss/output_layer_loss/Mean_3*
_output_shapes
: *

DstT0
ѓ
Btraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/truedivRealDiv?training/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Tile?training/Adam/gradients/loss/output_layer_loss/Mean_3_grad/Cast*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_3
ќ
Atraining/Adam/gradients/loss/output_layer_loss/truediv_grad/ShapeShapeloss/output_layer_loss/mul*
T0*
out_type0*1
_class'
%#loc:@loss/output_layer_loss/truediv*
_output_shapes
:
є
Ctraining/Adam/gradients/loss/output_layer_loss/truediv_grad/Shape_1Const*
valueB *1
_class'
%#loc:@loss/output_layer_loss/truediv*
dtype0*
_output_shapes
: 
в
Qtraining/Adam/gradients/loss/output_layer_loss/truediv_grad/BroadcastGradientArgsBroadcastGradientArgsAtraining/Adam/gradients/loss/output_layer_loss/truediv_grad/ShapeCtraining/Adam/gradients/loss/output_layer_loss/truediv_grad/Shape_1*
T0*1
_class'
%#loc:@loss/output_layer_loss/truediv*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
Т
Ctraining/Adam/gradients/loss/output_layer_loss/truediv_grad/RealDivRealDivBtraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/truedivloss/output_layer_loss/Mean_2*#
_output_shapes
:€€€€€€€€€*
T0*1
_class'
%#loc:@loss/output_layer_loss/truediv
—
?training/Adam/gradients/loss/output_layer_loss/truediv_grad/SumSumCtraining/Adam/gradients/loss/output_layer_loss/truediv_grad/RealDivQtraining/Adam/gradients/loss/output_layer_loss/truediv_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0*1
_class'
%#loc:@loss/output_layer_loss/truediv*
_output_shapes
:
Ѕ
Ctraining/Adam/gradients/loss/output_layer_loss/truediv_grad/ReshapeReshape?training/Adam/gradients/loss/output_layer_loss/truediv_grad/SumAtraining/Adam/gradients/loss/output_layer_loss/truediv_grad/Shape*
T0*
Tshape0*1
_class'
%#loc:@loss/output_layer_loss/truediv*#
_output_shapes
:€€€€€€€€€
√
?training/Adam/gradients/loss/output_layer_loss/truediv_grad/NegNegloss/output_layer_loss/mul*
T0*1
_class'
%#loc:@loss/output_layer_loss/truediv*#
_output_shapes
:€€€€€€€€€
С
Etraining/Adam/gradients/loss/output_layer_loss/truediv_grad/RealDiv_1RealDiv?training/Adam/gradients/loss/output_layer_loss/truediv_grad/Negloss/output_layer_loss/Mean_2*
T0*1
_class'
%#loc:@loss/output_layer_loss/truediv*#
_output_shapes
:€€€€€€€€€
Ч
Etraining/Adam/gradients/loss/output_layer_loss/truediv_grad/RealDiv_2RealDivEtraining/Adam/gradients/loss/output_layer_loss/truediv_grad/RealDiv_1loss/output_layer_loss/Mean_2*
T0*1
_class'
%#loc:@loss/output_layer_loss/truediv*#
_output_shapes
:€€€€€€€€€
≤
?training/Adam/gradients/loss/output_layer_loss/truediv_grad/mulMulBtraining/Adam/gradients/loss/output_layer_loss/Mean_3_grad/truedivEtraining/Adam/gradients/loss/output_layer_loss/truediv_grad/RealDiv_2*#
_output_shapes
:€€€€€€€€€*
T0*1
_class'
%#loc:@loss/output_layer_loss/truediv
—
Atraining/Adam/gradients/loss/output_layer_loss/truediv_grad/Sum_1Sum?training/Adam/gradients/loss/output_layer_loss/truediv_grad/mulStraining/Adam/gradients/loss/output_layer_loss/truediv_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*1
_class'
%#loc:@loss/output_layer_loss/truediv
Ї
Etraining/Adam/gradients/loss/output_layer_loss/truediv_grad/Reshape_1ReshapeAtraining/Adam/gradients/loss/output_layer_loss/truediv_grad/Sum_1Ctraining/Adam/gradients/loss/output_layer_loss/truediv_grad/Shape_1*
T0*
Tshape0*1
_class'
%#loc:@loss/output_layer_loss/truediv*
_output_shapes
: 
…
=training/Adam/gradients/loss/output_layer_loss/mul_grad/ShapeShapeloss/output_layer_loss/Mean_1*
T0*
out_type0*-
_class#
!loc:@loss/output_layer_loss/mul*
_output_shapes
:
…
?training/Adam/gradients/loss/output_layer_loss/mul_grad/Shape_1Shapeoutput_layer_sample_weights*
T0*
out_type0*-
_class#
!loc:@loss/output_layer_loss/mul*
_output_shapes
:
“
Mtraining/Adam/gradients/loss/output_layer_loss/mul_grad/BroadcastGradientArgsBroadcastGradientArgs=training/Adam/gradients/loss/output_layer_loss/mul_grad/Shape?training/Adam/gradients/loss/output_layer_loss/mul_grad/Shape_1*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€*
T0*-
_class#
!loc:@loss/output_layer_loss/mul
Б
;training/Adam/gradients/loss/output_layer_loss/mul_grad/MulMulCtraining/Adam/gradients/loss/output_layer_loss/truediv_grad/Reshapeoutput_layer_sample_weights*#
_output_shapes
:€€€€€€€€€*
T0*-
_class#
!loc:@loss/output_layer_loss/mul
љ
;training/Adam/gradients/loss/output_layer_loss/mul_grad/SumSum;training/Adam/gradients/loss/output_layer_loss/mul_grad/MulMtraining/Adam/gradients/loss/output_layer_loss/mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0*-
_class#
!loc:@loss/output_layer_loss/mul*
_output_shapes
:
±
?training/Adam/gradients/loss/output_layer_loss/mul_grad/ReshapeReshape;training/Adam/gradients/loss/output_layer_loss/mul_grad/Sum=training/Adam/gradients/loss/output_layer_loss/mul_grad/Shape*
T0*
Tshape0*-
_class#
!loc:@loss/output_layer_loss/mul*#
_output_shapes
:€€€€€€€€€
Е
=training/Adam/gradients/loss/output_layer_loss/mul_grad/Mul_1Mulloss/output_layer_loss/Mean_1Ctraining/Adam/gradients/loss/output_layer_loss/truediv_grad/Reshape*
T0*-
_class#
!loc:@loss/output_layer_loss/mul*#
_output_shapes
:€€€€€€€€€
√
=training/Adam/gradients/loss/output_layer_loss/mul_grad/Sum_1Sum=training/Adam/gradients/loss/output_layer_loss/mul_grad/Mul_1Otraining/Adam/gradients/loss/output_layer_loss/mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0*-
_class#
!loc:@loss/output_layer_loss/mul*
_output_shapes
:
Ј
Atraining/Adam/gradients/loss/output_layer_loss/mul_grad/Reshape_1Reshape=training/Adam/gradients/loss/output_layer_loss/mul_grad/Sum_1?training/Adam/gradients/loss/output_layer_loss/mul_grad/Shape_1*
T0*
Tshape0*-
_class#
!loc:@loss/output_layer_loss/mul*#
_output_shapes
:€€€€€€€€€
Ќ
@training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/ShapeShapeloss/output_layer_loss/Mean*
T0*
out_type0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
:
≥
?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/SizeConst*
value	B :*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
dtype0*
_output_shapes
: 
М
>training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/addAdd/loss/output_layer_loss/Mean_1/reduction_indices?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Size*
_output_shapes
: *
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1
†
>training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/modFloorMod>training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/add?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Size*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
: 
Њ
Btraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Shape_1Const*
valueB: *0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
dtype0*
_output_shapes
:
Ї
Ftraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/range/startConst*
value	B : *0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
dtype0*
_output_shapes
: 
Ї
Ftraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :*0
_class&
$"loc:@loss/output_layer_loss/Mean_1
ф
@training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/rangeRangeFtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/range/start?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/SizeFtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/range/delta*

Tidx0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
:
є
Etraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Fill/valueConst*
dtype0*
_output_shapes
: *
value	B :*0
_class&
$"loc:@loss/output_layer_loss/Mean_1
є
?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/FillFillBtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Shape_1Etraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Fill/value*
T0*

index_type0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
: 
«
Htraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/DynamicStitchDynamicStitch@training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/range>training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/mod@training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Shape?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Fill*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
N*#
_output_shapes
:€€€€€€€€€
Є
Dtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Maximum/yConst*
value	B :*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
dtype0*
_output_shapes
: 
љ
Btraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/MaximumMaximumHtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/DynamicStitchDtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Maximum/y*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*#
_output_shapes
:€€€€€€€€€
µ
Ctraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/floordivFloorDiv@training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/ShapeBtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Maximum*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*#
_output_shapes
:€€€€€€€€€
ї
Btraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/ReshapeReshape?training/Adam/gradients/loss/output_layer_loss/mul_grad/ReshapeHtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/DynamicStitch*
T0*
Tshape0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
:
Ј
?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/TileTileBtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/ReshapeCtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/floordiv*
_output_shapes
:*

Tmultiples0*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1
ѕ
Btraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Shape_2Shapeloss/output_layer_loss/Mean*
T0*
out_type0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
:
—
Btraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Shape_3Shapeloss/output_layer_loss/Mean_1*
_output_shapes
:*
T0*
out_type0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1
Љ
@training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/ConstConst*
valueB: *0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
dtype0*
_output_shapes
:
љ
?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/ProdProdBtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Shape_2@training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Const*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
: *

Tidx0*
	keep_dims( 
Њ
Btraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Const_1Const*
valueB: *0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
dtype0*
_output_shapes
:
Ѕ
Atraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Prod_1ProdBtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Shape_3Btraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Const_1*

Tidx0*
	keep_dims( *
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
: 
Ї
Ftraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Maximum_1/yConst*
value	B :*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
dtype0*
_output_shapes
: 
≠
Dtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Maximum_1MaximumAtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Prod_1Ftraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Maximum_1/y*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
: 
Ђ
Etraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/floordiv_1FloorDiv?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/ProdDtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Maximum_1*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
: 
р
?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/CastCastEtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/floordiv_1*

SrcT0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1*
_output_shapes
: *

DstT0
ѓ
Btraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/truedivRealDiv?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Tile?training/Adam/gradients/loss/output_layer_loss/Mean_1_grad/Cast*#
_output_shapes
:€€€€€€€€€*
T0*0
_class&
$"loc:@loss/output_layer_loss/Mean_1
Ћ
>training/Adam/gradients/loss/output_layer_loss/Mean_grad/ShapeShapeloss/output_layer_loss/Square*
T0*
out_type0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
:
ѓ
=training/Adam/gradients/loss/output_layer_loss/Mean_grad/SizeConst*
value	B :*.
_class$
" loc:@loss/output_layer_loss/Mean*
dtype0*
_output_shapes
: 
В
<training/Adam/gradients/loss/output_layer_loss/Mean_grad/addAdd-loss/output_layer_loss/Mean/reduction_indices=training/Adam/gradients/loss/output_layer_loss/Mean_grad/Size*
T0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
: 
Ц
<training/Adam/gradients/loss/output_layer_loss/Mean_grad/modFloorMod<training/Adam/gradients/loss/output_layer_loss/Mean_grad/add=training/Adam/gradients/loss/output_layer_loss/Mean_grad/Size*
_output_shapes
: *
T0*.
_class$
" loc:@loss/output_layer_loss/Mean
≥
@training/Adam/gradients/loss/output_layer_loss/Mean_grad/Shape_1Const*
valueB *.
_class$
" loc:@loss/output_layer_loss/Mean*
dtype0*
_output_shapes
: 
ґ
Dtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/range/startConst*
value	B : *.
_class$
" loc:@loss/output_layer_loss/Mean*
dtype0*
_output_shapes
: 
ґ
Dtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/range/deltaConst*
dtype0*
_output_shapes
: *
value	B :*.
_class$
" loc:@loss/output_layer_loss/Mean
к
>training/Adam/gradients/loss/output_layer_loss/Mean_grad/rangeRangeDtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/range/start=training/Adam/gradients/loss/output_layer_loss/Mean_grad/SizeDtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/range/delta*

Tidx0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
:
µ
Ctraining/Adam/gradients/loss/output_layer_loss/Mean_grad/Fill/valueConst*
value	B :*.
_class$
" loc:@loss/output_layer_loss/Mean*
dtype0*
_output_shapes
: 
ѓ
=training/Adam/gradients/loss/output_layer_loss/Mean_grad/FillFill@training/Adam/gradients/loss/output_layer_loss/Mean_grad/Shape_1Ctraining/Adam/gradients/loss/output_layer_loss/Mean_grad/Fill/value*
T0*

index_type0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
: 
ї
Ftraining/Adam/gradients/loss/output_layer_loss/Mean_grad/DynamicStitchDynamicStitch>training/Adam/gradients/loss/output_layer_loss/Mean_grad/range<training/Adam/gradients/loss/output_layer_loss/Mean_grad/mod>training/Adam/gradients/loss/output_layer_loss/Mean_grad/Shape=training/Adam/gradients/loss/output_layer_loss/Mean_grad/Fill*
N*#
_output_shapes
:€€€€€€€€€*
T0*.
_class$
" loc:@loss/output_layer_loss/Mean
і
Btraining/Adam/gradients/loss/output_layer_loss/Mean_grad/Maximum/yConst*
value	B :*.
_class$
" loc:@loss/output_layer_loss/Mean*
dtype0*
_output_shapes
: 
µ
@training/Adam/gradients/loss/output_layer_loss/Mean_grad/MaximumMaximumFtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/DynamicStitchBtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/Maximum/y*
T0*.
_class$
" loc:@loss/output_layer_loss/Mean*#
_output_shapes
:€€€€€€€€€
§
Atraining/Adam/gradients/loss/output_layer_loss/Mean_grad/floordivFloorDiv>training/Adam/gradients/loss/output_layer_loss/Mean_grad/Shape@training/Adam/gradients/loss/output_layer_loss/Mean_grad/Maximum*
T0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
:
Є
@training/Adam/gradients/loss/output_layer_loss/Mean_grad/ReshapeReshapeBtraining/Adam/gradients/loss/output_layer_loss/Mean_1_grad/truedivFtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/DynamicStitch*
T0*
Tshape0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
:
«
=training/Adam/gradients/loss/output_layer_loss/Mean_grad/TileTile@training/Adam/gradients/loss/output_layer_loss/Mean_grad/ReshapeAtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/floordiv*
T0*.
_class$
" loc:@loss/output_layer_loss/Mean*0
_output_shapes
:€€€€€€€€€€€€€€€€€€*

Tmultiples0
Ќ
@training/Adam/gradients/loss/output_layer_loss/Mean_grad/Shape_2Shapeloss/output_layer_loss/Square*
T0*
out_type0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
:
Ћ
@training/Adam/gradients/loss/output_layer_loss/Mean_grad/Shape_3Shapeloss/output_layer_loss/Mean*
T0*
out_type0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
:
Є
>training/Adam/gradients/loss/output_layer_loss/Mean_grad/ConstConst*
valueB: *.
_class$
" loc:@loss/output_layer_loss/Mean*
dtype0*
_output_shapes
:
µ
=training/Adam/gradients/loss/output_layer_loss/Mean_grad/ProdProd@training/Adam/gradients/loss/output_layer_loss/Mean_grad/Shape_2>training/Adam/gradients/loss/output_layer_loss/Mean_grad/Const*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0*.
_class$
" loc:@loss/output_layer_loss/Mean
Ї
@training/Adam/gradients/loss/output_layer_loss/Mean_grad/Const_1Const*
valueB: *.
_class$
" loc:@loss/output_layer_loss/Mean*
dtype0*
_output_shapes
:
є
?training/Adam/gradients/loss/output_layer_loss/Mean_grad/Prod_1Prod@training/Adam/gradients/loss/output_layer_loss/Mean_grad/Shape_3@training/Adam/gradients/loss/output_layer_loss/Mean_grad/Const_1*
_output_shapes
: *

Tidx0*
	keep_dims( *
T0*.
_class$
" loc:@loss/output_layer_loss/Mean
ґ
Dtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/Maximum_1/yConst*
value	B :*.
_class$
" loc:@loss/output_layer_loss/Mean*
dtype0*
_output_shapes
: 
•
Btraining/Adam/gradients/loss/output_layer_loss/Mean_grad/Maximum_1Maximum?training/Adam/gradients/loss/output_layer_loss/Mean_grad/Prod_1Dtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/Maximum_1/y*
T0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
: 
£
Ctraining/Adam/gradients/loss/output_layer_loss/Mean_grad/floordiv_1FloorDiv=training/Adam/gradients/loss/output_layer_loss/Mean_grad/ProdBtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/Maximum_1*
T0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
: 
к
=training/Adam/gradients/loss/output_layer_loss/Mean_grad/CastCastCtraining/Adam/gradients/loss/output_layer_loss/Mean_grad/floordiv_1*

SrcT0*.
_class$
" loc:@loss/output_layer_loss/Mean*
_output_shapes
: *

DstT0
і
@training/Adam/gradients/loss/output_layer_loss/Mean_grad/truedivRealDiv=training/Adam/gradients/loss/output_layer_loss/Mean_grad/Tile=training/Adam/gradients/loss/output_layer_loss/Mean_grad/Cast*
T0*.
_class$
" loc:@loss/output_layer_loss/Mean*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
ъ
@training/Adam/gradients/loss/output_layer_loss/Square_grad/ConstConstA^training/Adam/gradients/loss/output_layer_loss/Mean_grad/truediv*
valueB
 *   @*0
_class&
$"loc:@loss/output_layer_loss/Square*
dtype0*
_output_shapes
: 
Р
>training/Adam/gradients/loss/output_layer_loss/Square_grad/MulMulloss/output_layer_loss/sub@training/Adam/gradients/loss/output_layer_loss/Square_grad/Const*0
_output_shapes
:€€€€€€€€€€€€€€€€€€*
T0*0
_class&
$"loc:@loss/output_layer_loss/Square
ґ
@training/Adam/gradients/loss/output_layer_loss/Square_grad/Mul_1Mul@training/Adam/gradients/loss/output_layer_loss/Mean_grad/truediv>training/Adam/gradients/loss/output_layer_loss/Square_grad/Mul*
T0*0
_class&
$"loc:@loss/output_layer_loss/Square*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
ј
=training/Adam/gradients/loss/output_layer_loss/sub_grad/ShapeShapeoutput_layer/BiasAdd*
T0*
out_type0*-
_class#
!loc:@loss/output_layer_loss/sub*
_output_shapes
:
Ѕ
?training/Adam/gradients/loss/output_layer_loss/sub_grad/Shape_1Shapeoutput_layer_target*
T0*
out_type0*-
_class#
!loc:@loss/output_layer_loss/sub*
_output_shapes
:
“
Mtraining/Adam/gradients/loss/output_layer_loss/sub_grad/BroadcastGradientArgsBroadcastGradientArgs=training/Adam/gradients/loss/output_layer_loss/sub_grad/Shape?training/Adam/gradients/loss/output_layer_loss/sub_grad/Shape_1*
T0*-
_class#
!loc:@loss/output_layer_loss/sub*2
_output_shapes 
:€€€€€€€€€:€€€€€€€€€
¬
;training/Adam/gradients/loss/output_layer_loss/sub_grad/SumSum@training/Adam/gradients/loss/output_layer_loss/Square_grad/Mul_1Mtraining/Adam/gradients/loss/output_layer_loss/sub_grad/BroadcastGradientArgs*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*-
_class#
!loc:@loss/output_layer_loss/sub
µ
?training/Adam/gradients/loss/output_layer_loss/sub_grad/ReshapeReshape;training/Adam/gradients/loss/output_layer_loss/sub_grad/Sum=training/Adam/gradients/loss/output_layer_loss/sub_grad/Shape*
T0*
Tshape0*-
_class#
!loc:@loss/output_layer_loss/sub*'
_output_shapes
:€€€€€€€€€
∆
=training/Adam/gradients/loss/output_layer_loss/sub_grad/Sum_1Sum@training/Adam/gradients/loss/output_layer_loss/Square_grad/Mul_1Otraining/Adam/gradients/loss/output_layer_loss/sub_grad/BroadcastGradientArgs:1*
_output_shapes
:*

Tidx0*
	keep_dims( *
T0*-
_class#
!loc:@loss/output_layer_loss/sub
”
;training/Adam/gradients/loss/output_layer_loss/sub_grad/NegNeg=training/Adam/gradients/loss/output_layer_loss/sub_grad/Sum_1*
T0*-
_class#
!loc:@loss/output_layer_loss/sub*
_output_shapes
:
¬
Atraining/Adam/gradients/loss/output_layer_loss/sub_grad/Reshape_1Reshape;training/Adam/gradients/loss/output_layer_loss/sub_grad/Neg?training/Adam/gradients/loss/output_layer_loss/sub_grad/Shape_1*
T0*
Tshape0*-
_class#
!loc:@loss/output_layer_loss/sub*0
_output_shapes
:€€€€€€€€€€€€€€€€€€
т
=training/Adam/gradients/output_layer/BiasAdd_grad/BiasAddGradBiasAddGrad?training/Adam/gradients/loss/output_layer_loss/sub_grad/Reshape*
T0*'
_class
loc:@output_layer/BiasAdd*
data_formatNHWC*
_output_shapes
:
Ь
7training/Adam/gradients/output_layer/MatMul_grad/MatMulMatMul?training/Adam/gradients/loss/output_layer_loss/sub_grad/Reshapeoutput_layer/kernel/read*
T0*&
_class
loc:@output_layer/MatMul*'
_output_shapes
:€€€€€€€€€2*
transpose_a( *
transpose_b(
Й
9training/Adam/gradients/output_layer/MatMul_grad/MatMul_1MatMullayer_3/Relu?training/Adam/gradients/loss/output_layer_loss/sub_grad/Reshape*
transpose_b( *
T0*&
_class
loc:@output_layer/MatMul*
_output_shapes

:2*
transpose_a(
Ў
2training/Adam/gradients/layer_3/Relu_grad/ReluGradReluGrad7training/Adam/gradients/output_layer/MatMul_grad/MatMullayer_3/Relu*'
_output_shapes
:€€€€€€€€€2*
T0*
_class
loc:@layer_3/Relu
џ
8training/Adam/gradients/layer_3/BiasAdd_grad/BiasAddGradBiasAddGrad2training/Adam/gradients/layer_3/Relu_grad/ReluGrad*
data_formatNHWC*
_output_shapes
:2*
T0*"
_class
loc:@layer_3/BiasAdd
А
2training/Adam/gradients/layer_3/MatMul_grad/MatMulMatMul2training/Adam/gradients/layer_3/Relu_grad/ReluGradlayer_3/kernel/read*
T0*!
_class
loc:@layer_3/MatMul*'
_output_shapes
:€€€€€€€€€d*
transpose_a( *
transpose_b(
т
4training/Adam/gradients/layer_3/MatMul_grad/MatMul_1MatMullayer_2/Relu2training/Adam/gradients/layer_3/Relu_grad/ReluGrad*
transpose_b( *
T0*!
_class
loc:@layer_3/MatMul*
_output_shapes

:d2*
transpose_a(
”
2training/Adam/gradients/layer_2/Relu_grad/ReluGradReluGrad2training/Adam/gradients/layer_3/MatMul_grad/MatMullayer_2/Relu*'
_output_shapes
:€€€€€€€€€d*
T0*
_class
loc:@layer_2/Relu
џ
8training/Adam/gradients/layer_2/BiasAdd_grad/BiasAddGradBiasAddGrad2training/Adam/gradients/layer_2/Relu_grad/ReluGrad*
T0*"
_class
loc:@layer_2/BiasAdd*
data_formatNHWC*
_output_shapes
:d
А
2training/Adam/gradients/layer_2/MatMul_grad/MatMulMatMul2training/Adam/gradients/layer_2/Relu_grad/ReluGradlayer_2/kernel/read*
transpose_b(*
T0*!
_class
loc:@layer_2/MatMul*'
_output_shapes
:€€€€€€€€€2*
transpose_a( 
т
4training/Adam/gradients/layer_2/MatMul_grad/MatMul_1MatMullayer_1/Relu2training/Adam/gradients/layer_2/Relu_grad/ReluGrad*
_output_shapes

:2d*
transpose_a(*
transpose_b( *
T0*!
_class
loc:@layer_2/MatMul
”
2training/Adam/gradients/layer_1/Relu_grad/ReluGradReluGrad2training/Adam/gradients/layer_2/MatMul_grad/MatMullayer_1/Relu*'
_output_shapes
:€€€€€€€€€2*
T0*
_class
loc:@layer_1/Relu
џ
8training/Adam/gradients/layer_1/BiasAdd_grad/BiasAddGradBiasAddGrad2training/Adam/gradients/layer_1/Relu_grad/ReluGrad*
T0*"
_class
loc:@layer_1/BiasAdd*
data_formatNHWC*
_output_shapes
:2
А
2training/Adam/gradients/layer_1/MatMul_grad/MatMulMatMul2training/Adam/gradients/layer_1/Relu_grad/ReluGradlayer_1/kernel/read*
T0*!
_class
loc:@layer_1/MatMul*'
_output_shapes
:€€€€€€€€€	*
transpose_a( *
transpose_b(
у
4training/Adam/gradients/layer_1/MatMul_grad/MatMul_1MatMullayer_1_input2training/Adam/gradients/layer_1/Relu_grad/ReluGrad*
transpose_b( *
T0*!
_class
loc:@layer_1/MatMul*
_output_shapes

:	2*
transpose_a(
_
training/Adam/AssignAdd/valueConst*
value	B	 R*
dtype0	*
_output_shapes
: 
ђ
training/Adam/AssignAdd	AssignAddAdam/iterationstraining/Adam/AssignAdd/value*
use_locking( *
T0	*"
_class
loc:@Adam/iterations*
_output_shapes
: 
`
training/Adam/CastCastAdam/iterations/read*

SrcT0	*
_output_shapes
: *

DstT0
X
training/Adam/add/yConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
b
training/Adam/addAddtraining/Adam/Casttraining/Adam/add/y*
T0*
_output_shapes
: 
^
training/Adam/PowPowAdam/beta_2/readtraining/Adam/add*
T0*
_output_shapes
: 
X
training/Adam/sub/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
a
training/Adam/subSubtraining/Adam/sub/xtraining/Adam/Pow*
_output_shapes
: *
T0
X
training/Adam/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
Z
training/Adam/Const_1Const*
dtype0*
_output_shapes
: *
valueB
 *  А
y
#training/Adam/clip_by_value/MinimumMinimumtraining/Adam/subtraining/Adam/Const_1*
T0*
_output_shapes
: 
Б
training/Adam/clip_by_valueMaximum#training/Adam/clip_by_value/Minimumtraining/Adam/Const*
T0*
_output_shapes
: 
X
training/Adam/SqrtSqrttraining/Adam/clip_by_value*
T0*
_output_shapes
: 
`
training/Adam/Pow_1PowAdam/beta_1/readtraining/Adam/add*
T0*
_output_shapes
: 
Z
training/Adam/sub_1/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
g
training/Adam/sub_1Subtraining/Adam/sub_1/xtraining/Adam/Pow_1*
T0*
_output_shapes
: 
j
training/Adam/truedivRealDivtraining/Adam/Sqrttraining/Adam/sub_1*
T0*
_output_shapes
: 
^
training/Adam/mulMulAdam/lr/readtraining/Adam/truediv*
T0*
_output_shapes
: 
t
#training/Adam/zeros/shape_as_tensorConst*
valueB"	   2   *
dtype0*
_output_shapes
:
^
training/Adam/zeros/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ц
training/Adam/zerosFill#training/Adam/zeros/shape_as_tensortraining/Adam/zeros/Const*
T0*

index_type0*
_output_shapes

:	2
К
training/Adam/Variable
VariableV2*
shared_name *
dtype0*
_output_shapes

:	2*
	container *
shape
:	2
—
training/Adam/Variable/AssignAssigntraining/Adam/Variabletraining/Adam/zeros*
use_locking(*
T0*)
_class
loc:@training/Adam/Variable*
validate_shape(*
_output_shapes

:	2
У
training/Adam/Variable/readIdentitytraining/Adam/Variable*
_output_shapes

:	2*
T0*)
_class
loc:@training/Adam/Variable
o
%training/Adam/zeros_1/shape_as_tensorConst*
valueB:2*
dtype0*
_output_shapes
:
`
training/Adam/zeros_1/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ш
training/Adam/zeros_1Fill%training/Adam/zeros_1/shape_as_tensortraining/Adam/zeros_1/Const*
_output_shapes
:2*
T0*

index_type0
Д
training/Adam/Variable_1
VariableV2*
shared_name *
dtype0*
_output_shapes
:2*
	container *
shape:2
’
training/Adam/Variable_1/AssignAssigntraining/Adam/Variable_1training/Adam/zeros_1*
T0*+
_class!
loc:@training/Adam/Variable_1*
validate_shape(*
_output_shapes
:2*
use_locking(
Х
training/Adam/Variable_1/readIdentitytraining/Adam/Variable_1*
_output_shapes
:2*
T0*+
_class!
loc:@training/Adam/Variable_1
v
%training/Adam/zeros_2/shape_as_tensorConst*
valueB"2   d   *
dtype0*
_output_shapes
:
`
training/Adam/zeros_2/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ь
training/Adam/zeros_2Fill%training/Adam/zeros_2/shape_as_tensortraining/Adam/zeros_2/Const*
T0*

index_type0*
_output_shapes

:2d
М
training/Adam/Variable_2
VariableV2*
shape
:2d*
shared_name *
dtype0*
_output_shapes

:2d*
	container 
ў
training/Adam/Variable_2/AssignAssigntraining/Adam/Variable_2training/Adam/zeros_2*
T0*+
_class!
loc:@training/Adam/Variable_2*
validate_shape(*
_output_shapes

:2d*
use_locking(
Щ
training/Adam/Variable_2/readIdentitytraining/Adam/Variable_2*
T0*+
_class!
loc:@training/Adam/Variable_2*
_output_shapes

:2d
o
%training/Adam/zeros_3/shape_as_tensorConst*
valueB:d*
dtype0*
_output_shapes
:
`
training/Adam/zeros_3/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ш
training/Adam/zeros_3Fill%training/Adam/zeros_3/shape_as_tensortraining/Adam/zeros_3/Const*
T0*

index_type0*
_output_shapes
:d
Д
training/Adam/Variable_3
VariableV2*
shape:d*
shared_name *
dtype0*
_output_shapes
:d*
	container 
’
training/Adam/Variable_3/AssignAssigntraining/Adam/Variable_3training/Adam/zeros_3*
T0*+
_class!
loc:@training/Adam/Variable_3*
validate_shape(*
_output_shapes
:d*
use_locking(
Х
training/Adam/Variable_3/readIdentitytraining/Adam/Variable_3*
T0*+
_class!
loc:@training/Adam/Variable_3*
_output_shapes
:d
v
%training/Adam/zeros_4/shape_as_tensorConst*
valueB"d   2   *
dtype0*
_output_shapes
:
`
training/Adam/zeros_4/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ь
training/Adam/zeros_4Fill%training/Adam/zeros_4/shape_as_tensortraining/Adam/zeros_4/Const*
_output_shapes

:d2*
T0*

index_type0
М
training/Adam/Variable_4
VariableV2*
shared_name *
dtype0*
_output_shapes

:d2*
	container *
shape
:d2
ў
training/Adam/Variable_4/AssignAssigntraining/Adam/Variable_4training/Adam/zeros_4*
T0*+
_class!
loc:@training/Adam/Variable_4*
validate_shape(*
_output_shapes

:d2*
use_locking(
Щ
training/Adam/Variable_4/readIdentitytraining/Adam/Variable_4*
_output_shapes

:d2*
T0*+
_class!
loc:@training/Adam/Variable_4
o
%training/Adam/zeros_5/shape_as_tensorConst*
valueB:2*
dtype0*
_output_shapes
:
`
training/Adam/zeros_5/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ш
training/Adam/zeros_5Fill%training/Adam/zeros_5/shape_as_tensortraining/Adam/zeros_5/Const*
T0*

index_type0*
_output_shapes
:2
Д
training/Adam/Variable_5
VariableV2*
shape:2*
shared_name *
dtype0*
_output_shapes
:2*
	container 
’
training/Adam/Variable_5/AssignAssigntraining/Adam/Variable_5training/Adam/zeros_5*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_5*
validate_shape(*
_output_shapes
:2
Х
training/Adam/Variable_5/readIdentitytraining/Adam/Variable_5*
_output_shapes
:2*
T0*+
_class!
loc:@training/Adam/Variable_5
v
%training/Adam/zeros_6/shape_as_tensorConst*
valueB"2      *
dtype0*
_output_shapes
:
`
training/Adam/zeros_6/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ь
training/Adam/zeros_6Fill%training/Adam/zeros_6/shape_as_tensortraining/Adam/zeros_6/Const*
T0*

index_type0*
_output_shapes

:2
М
training/Adam/Variable_6
VariableV2*
shared_name *
dtype0*
_output_shapes

:2*
	container *
shape
:2
ў
training/Adam/Variable_6/AssignAssigntraining/Adam/Variable_6training/Adam/zeros_6*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_6
Щ
training/Adam/Variable_6/readIdentitytraining/Adam/Variable_6*
_output_shapes

:2*
T0*+
_class!
loc:@training/Adam/Variable_6
o
%training/Adam/zeros_7/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
`
training/Adam/zeros_7/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
Ш
training/Adam/zeros_7Fill%training/Adam/zeros_7/shape_as_tensortraining/Adam/zeros_7/Const*
T0*

index_type0*
_output_shapes
:
Д
training/Adam/Variable_7
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
’
training/Adam/Variable_7/AssignAssigntraining/Adam/Variable_7training/Adam/zeros_7*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_7*
validate_shape(*
_output_shapes
:
Х
training/Adam/Variable_7/readIdentitytraining/Adam/Variable_7*
T0*+
_class!
loc:@training/Adam/Variable_7*
_output_shapes
:
v
%training/Adam/zeros_8/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB"	   2   
`
training/Adam/zeros_8/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
Ь
training/Adam/zeros_8Fill%training/Adam/zeros_8/shape_as_tensortraining/Adam/zeros_8/Const*
T0*

index_type0*
_output_shapes

:	2
М
training/Adam/Variable_8
VariableV2*
dtype0*
_output_shapes

:	2*
	container *
shape
:	2*
shared_name 
ў
training/Adam/Variable_8/AssignAssigntraining/Adam/Variable_8training/Adam/zeros_8*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_8*
validate_shape(*
_output_shapes

:	2
Щ
training/Adam/Variable_8/readIdentitytraining/Adam/Variable_8*
T0*+
_class!
loc:@training/Adam/Variable_8*
_output_shapes

:	2
o
%training/Adam/zeros_9/shape_as_tensorConst*
valueB:2*
dtype0*
_output_shapes
:
`
training/Adam/zeros_9/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ш
training/Adam/zeros_9Fill%training/Adam/zeros_9/shape_as_tensortraining/Adam/zeros_9/Const*
T0*

index_type0*
_output_shapes
:2
Д
training/Adam/Variable_9
VariableV2*
shared_name *
dtype0*
_output_shapes
:2*
	container *
shape:2
’
training/Adam/Variable_9/AssignAssigntraining/Adam/Variable_9training/Adam/zeros_9*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_9
Х
training/Adam/Variable_9/readIdentitytraining/Adam/Variable_9*
T0*+
_class!
loc:@training/Adam/Variable_9*
_output_shapes
:2
w
&training/Adam/zeros_10/shape_as_tensorConst*
valueB"2   d   *
dtype0*
_output_shapes
:
a
training/Adam/zeros_10/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Я
training/Adam/zeros_10Fill&training/Adam/zeros_10/shape_as_tensortraining/Adam/zeros_10/Const*
T0*

index_type0*
_output_shapes

:2d
Н
training/Adam/Variable_10
VariableV2*
shape
:2d*
shared_name *
dtype0*
_output_shapes

:2d*
	container 
Ё
 training/Adam/Variable_10/AssignAssigntraining/Adam/Variable_10training/Adam/zeros_10*
T0*,
_class"
 loc:@training/Adam/Variable_10*
validate_shape(*
_output_shapes

:2d*
use_locking(
Ь
training/Adam/Variable_10/readIdentitytraining/Adam/Variable_10*
_output_shapes

:2d*
T0*,
_class"
 loc:@training/Adam/Variable_10
p
&training/Adam/zeros_11/shape_as_tensorConst*
valueB:d*
dtype0*
_output_shapes
:
a
training/Adam/zeros_11/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ы
training/Adam/zeros_11Fill&training/Adam/zeros_11/shape_as_tensortraining/Adam/zeros_11/Const*
T0*

index_type0*
_output_shapes
:d
Е
training/Adam/Variable_11
VariableV2*
shared_name *
dtype0*
_output_shapes
:d*
	container *
shape:d
ў
 training/Adam/Variable_11/AssignAssigntraining/Adam/Variable_11training/Adam/zeros_11*
T0*,
_class"
 loc:@training/Adam/Variable_11*
validate_shape(*
_output_shapes
:d*
use_locking(
Ш
training/Adam/Variable_11/readIdentitytraining/Adam/Variable_11*
T0*,
_class"
 loc:@training/Adam/Variable_11*
_output_shapes
:d
w
&training/Adam/zeros_12/shape_as_tensorConst*
valueB"d   2   *
dtype0*
_output_shapes
:
a
training/Adam/zeros_12/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Я
training/Adam/zeros_12Fill&training/Adam/zeros_12/shape_as_tensortraining/Adam/zeros_12/Const*
T0*

index_type0*
_output_shapes

:d2
Н
training/Adam/Variable_12
VariableV2*
dtype0*
_output_shapes

:d2*
	container *
shape
:d2*
shared_name 
Ё
 training/Adam/Variable_12/AssignAssigntraining/Adam/Variable_12training/Adam/zeros_12*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_12*
validate_shape(*
_output_shapes

:d2
Ь
training/Adam/Variable_12/readIdentitytraining/Adam/Variable_12*
_output_shapes

:d2*
T0*,
_class"
 loc:@training/Adam/Variable_12
p
&training/Adam/zeros_13/shape_as_tensorConst*
valueB:2*
dtype0*
_output_shapes
:
a
training/Adam/zeros_13/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ы
training/Adam/zeros_13Fill&training/Adam/zeros_13/shape_as_tensortraining/Adam/zeros_13/Const*
T0*

index_type0*
_output_shapes
:2
Е
training/Adam/Variable_13
VariableV2*
shape:2*
shared_name *
dtype0*
_output_shapes
:2*
	container 
ў
 training/Adam/Variable_13/AssignAssigntraining/Adam/Variable_13training/Adam/zeros_13*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_13*
validate_shape(*
_output_shapes
:2
Ш
training/Adam/Variable_13/readIdentitytraining/Adam/Variable_13*
_output_shapes
:2*
T0*,
_class"
 loc:@training/Adam/Variable_13
w
&training/Adam/zeros_14/shape_as_tensorConst*
valueB"2      *
dtype0*
_output_shapes
:
a
training/Adam/zeros_14/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
Я
training/Adam/zeros_14Fill&training/Adam/zeros_14/shape_as_tensortraining/Adam/zeros_14/Const*
T0*

index_type0*
_output_shapes

:2
Н
training/Adam/Variable_14
VariableV2*
shared_name *
dtype0*
_output_shapes

:2*
	container *
shape
:2
Ё
 training/Adam/Variable_14/AssignAssigntraining/Adam/Variable_14training/Adam/zeros_14*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_14*
validate_shape(*
_output_shapes

:2
Ь
training/Adam/Variable_14/readIdentitytraining/Adam/Variable_14*
T0*,
_class"
 loc:@training/Adam/Variable_14*
_output_shapes

:2
p
&training/Adam/zeros_15/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_15/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ы
training/Adam/zeros_15Fill&training/Adam/zeros_15/shape_as_tensortraining/Adam/zeros_15/Const*
T0*

index_type0*
_output_shapes
:
Е
training/Adam/Variable_15
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
ў
 training/Adam/Variable_15/AssignAssigntraining/Adam/Variable_15training/Adam/zeros_15*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_15
Ш
training/Adam/Variable_15/readIdentitytraining/Adam/Variable_15*
T0*,
_class"
 loc:@training/Adam/Variable_15*
_output_shapes
:
p
&training/Adam/zeros_16/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_16/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ы
training/Adam/zeros_16Fill&training/Adam/zeros_16/shape_as_tensortraining/Adam/zeros_16/Const*
_output_shapes
:*
T0*

index_type0
Е
training/Adam/Variable_16
VariableV2*
shared_name *
dtype0*
_output_shapes
:*
	container *
shape:
ў
 training/Adam/Variable_16/AssignAssigntraining/Adam/Variable_16training/Adam/zeros_16*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_16*
validate_shape(*
_output_shapes
:
Ш
training/Adam/Variable_16/readIdentitytraining/Adam/Variable_16*
T0*,
_class"
 loc:@training/Adam/Variable_16*
_output_shapes
:
p
&training/Adam/zeros_17/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_17/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ы
training/Adam/zeros_17Fill&training/Adam/zeros_17/shape_as_tensortraining/Adam/zeros_17/Const*
T0*

index_type0*
_output_shapes
:
Е
training/Adam/Variable_17
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
ў
 training/Adam/Variable_17/AssignAssigntraining/Adam/Variable_17training/Adam/zeros_17*
T0*,
_class"
 loc:@training/Adam/Variable_17*
validate_shape(*
_output_shapes
:*
use_locking(
Ш
training/Adam/Variable_17/readIdentitytraining/Adam/Variable_17*
_output_shapes
:*
T0*,
_class"
 loc:@training/Adam/Variable_17
p
&training/Adam/zeros_18/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_18/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
Ы
training/Adam/zeros_18Fill&training/Adam/zeros_18/shape_as_tensortraining/Adam/zeros_18/Const*
T0*

index_type0*
_output_shapes
:
Е
training/Adam/Variable_18
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
ў
 training/Adam/Variable_18/AssignAssigntraining/Adam/Variable_18training/Adam/zeros_18*
T0*,
_class"
 loc:@training/Adam/Variable_18*
validate_shape(*
_output_shapes
:*
use_locking(
Ш
training/Adam/Variable_18/readIdentitytraining/Adam/Variable_18*
T0*,
_class"
 loc:@training/Adam/Variable_18*
_output_shapes
:
p
&training/Adam/zeros_19/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_19/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ы
training/Adam/zeros_19Fill&training/Adam/zeros_19/shape_as_tensortraining/Adam/zeros_19/Const*
T0*

index_type0*
_output_shapes
:
Е
training/Adam/Variable_19
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
ў
 training/Adam/Variable_19/AssignAssigntraining/Adam/Variable_19training/Adam/zeros_19*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_19*
validate_shape(*
_output_shapes
:
Ш
training/Adam/Variable_19/readIdentitytraining/Adam/Variable_19*
T0*,
_class"
 loc:@training/Adam/Variable_19*
_output_shapes
:
p
&training/Adam/zeros_20/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
a
training/Adam/zeros_20/ConstConst*
dtype0*
_output_shapes
: *
valueB
 *    
Ы
training/Adam/zeros_20Fill&training/Adam/zeros_20/shape_as_tensortraining/Adam/zeros_20/Const*
T0*

index_type0*
_output_shapes
:
Е
training/Adam/Variable_20
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
ў
 training/Adam/Variable_20/AssignAssigntraining/Adam/Variable_20training/Adam/zeros_20*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_20
Ш
training/Adam/Variable_20/readIdentitytraining/Adam/Variable_20*
T0*,
_class"
 loc:@training/Adam/Variable_20*
_output_shapes
:
p
&training/Adam/zeros_21/shape_as_tensorConst*
dtype0*
_output_shapes
:*
valueB:
a
training/Adam/zeros_21/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ы
training/Adam/zeros_21Fill&training/Adam/zeros_21/shape_as_tensortraining/Adam/zeros_21/Const*
T0*

index_type0*
_output_shapes
:
Е
training/Adam/Variable_21
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
ў
 training/Adam/Variable_21/AssignAssigntraining/Adam/Variable_21training/Adam/zeros_21*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_21*
validate_shape(*
_output_shapes
:
Ш
training/Adam/Variable_21/readIdentitytraining/Adam/Variable_21*
T0*,
_class"
 loc:@training/Adam/Variable_21*
_output_shapes
:
p
&training/Adam/zeros_22/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_22/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ы
training/Adam/zeros_22Fill&training/Adam/zeros_22/shape_as_tensortraining/Adam/zeros_22/Const*
T0*

index_type0*
_output_shapes
:
Е
training/Adam/Variable_22
VariableV2*
dtype0*
_output_shapes
:*
	container *
shape:*
shared_name 
ў
 training/Adam/Variable_22/AssignAssigntraining/Adam/Variable_22training/Adam/zeros_22*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_22*
validate_shape(*
_output_shapes
:
Ш
training/Adam/Variable_22/readIdentitytraining/Adam/Variable_22*
T0*,
_class"
 loc:@training/Adam/Variable_22*
_output_shapes
:
p
&training/Adam/zeros_23/shape_as_tensorConst*
valueB:*
dtype0*
_output_shapes
:
a
training/Adam/zeros_23/ConstConst*
valueB
 *    *
dtype0*
_output_shapes
: 
Ы
training/Adam/zeros_23Fill&training/Adam/zeros_23/shape_as_tensortraining/Adam/zeros_23/Const*
T0*

index_type0*
_output_shapes
:
Е
training/Adam/Variable_23
VariableV2*
shape:*
shared_name *
dtype0*
_output_shapes
:*
	container 
ў
 training/Adam/Variable_23/AssignAssigntraining/Adam/Variable_23training/Adam/zeros_23*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_23
Ш
training/Adam/Variable_23/readIdentitytraining/Adam/Variable_23*
T0*,
_class"
 loc:@training/Adam/Variable_23*
_output_shapes
:
r
training/Adam/mul_1MulAdam/beta_1/readtraining/Adam/Variable/read*
T0*
_output_shapes

:	2
Z
training/Adam/sub_2/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
d
training/Adam/sub_2Subtraining/Adam/sub_2/xAdam/beta_1/read*
_output_shapes
: *
T0
О
training/Adam/mul_2Multraining/Adam/sub_24training/Adam/gradients/layer_1/MatMul_grad/MatMul_1*
_output_shapes

:	2*
T0
m
training/Adam/add_1Addtraining/Adam/mul_1training/Adam/mul_2*
T0*
_output_shapes

:	2
t
training/Adam/mul_3MulAdam/beta_2/readtraining/Adam/Variable_8/read*
T0*
_output_shapes

:	2
Z
training/Adam/sub_3/xConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
d
training/Adam/sub_3Subtraining/Adam/sub_3/xAdam/beta_2/read*
T0*
_output_shapes
: 
}
training/Adam/SquareSquare4training/Adam/gradients/layer_1/MatMul_grad/MatMul_1*
_output_shapes

:	2*
T0
n
training/Adam/mul_4Multraining/Adam/sub_3training/Adam/Square*
_output_shapes

:	2*
T0
m
training/Adam/add_2Addtraining/Adam/mul_3training/Adam/mul_4*
T0*
_output_shapes

:	2
k
training/Adam/mul_5Multraining/Adam/multraining/Adam/add_1*
_output_shapes

:	2*
T0
Z
training/Adam/Const_2Const*
valueB
 *    *
dtype0*
_output_shapes
: 
Z
training/Adam/Const_3Const*
valueB
 *  А*
dtype0*
_output_shapes
: 
Е
%training/Adam/clip_by_value_1/MinimumMinimumtraining/Adam/add_2training/Adam/Const_3*
T0*
_output_shapes

:	2
П
training/Adam/clip_by_value_1Maximum%training/Adam/clip_by_value_1/Minimumtraining/Adam/Const_2*
T0*
_output_shapes

:	2
d
training/Adam/Sqrt_1Sqrttraining/Adam/clip_by_value_1*
T0*
_output_shapes

:	2
Z
training/Adam/add_3/yConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
p
training/Adam/add_3Addtraining/Adam/Sqrt_1training/Adam/add_3/y*
T0*
_output_shapes

:	2
u
training/Adam/truediv_1RealDivtraining/Adam/mul_5training/Adam/add_3*
T0*
_output_shapes

:	2
q
training/Adam/sub_4Sublayer_1/kernel/readtraining/Adam/truediv_1*
_output_shapes

:	2*
T0
»
training/Adam/AssignAssigntraining/Adam/Variabletraining/Adam/add_1*
use_locking(*
T0*)
_class
loc:@training/Adam/Variable*
validate_shape(*
_output_shapes

:	2
ќ
training/Adam/Assign_1Assigntraining/Adam/Variable_8training/Adam/add_2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_8*
validate_shape(*
_output_shapes

:	2
Ї
training/Adam/Assign_2Assignlayer_1/kerneltraining/Adam/sub_4*
validate_shape(*
_output_shapes

:	2*
use_locking(*
T0*!
_class
loc:@layer_1/kernel
p
training/Adam/mul_6MulAdam/beta_1/readtraining/Adam/Variable_1/read*
_output_shapes
:2*
T0
Z
training/Adam/sub_5/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
d
training/Adam/sub_5Subtraining/Adam/sub_5/xAdam/beta_1/read*
_output_shapes
: *
T0
О
training/Adam/mul_7Multraining/Adam/sub_58training/Adam/gradients/layer_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:2
i
training/Adam/add_4Addtraining/Adam/mul_6training/Adam/mul_7*
T0*
_output_shapes
:2
p
training/Adam/mul_8MulAdam/beta_2/readtraining/Adam/Variable_9/read*
T0*
_output_shapes
:2
Z
training/Adam/sub_6/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
d
training/Adam/sub_6Subtraining/Adam/sub_6/xAdam/beta_2/read*
T0*
_output_shapes
: 

training/Adam/Square_1Square8training/Adam/gradients/layer_1/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:2
l
training/Adam/mul_9Multraining/Adam/sub_6training/Adam/Square_1*
T0*
_output_shapes
:2
i
training/Adam/add_5Addtraining/Adam/mul_8training/Adam/mul_9*
T0*
_output_shapes
:2
h
training/Adam/mul_10Multraining/Adam/multraining/Adam/add_4*
_output_shapes
:2*
T0
Z
training/Adam/Const_4Const*
valueB
 *    *
dtype0*
_output_shapes
: 
Z
training/Adam/Const_5Const*
valueB
 *  А*
dtype0*
_output_shapes
: 
Б
%training/Adam/clip_by_value_2/MinimumMinimumtraining/Adam/add_5training/Adam/Const_5*
T0*
_output_shapes
:2
Л
training/Adam/clip_by_value_2Maximum%training/Adam/clip_by_value_2/Minimumtraining/Adam/Const_4*
_output_shapes
:2*
T0
`
training/Adam/Sqrt_2Sqrttraining/Adam/clip_by_value_2*
T0*
_output_shapes
:2
Z
training/Adam/add_6/yConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
l
training/Adam/add_6Addtraining/Adam/Sqrt_2training/Adam/add_6/y*
_output_shapes
:2*
T0
r
training/Adam/truediv_2RealDivtraining/Adam/mul_10training/Adam/add_6*
T0*
_output_shapes
:2
k
training/Adam/sub_7Sublayer_1/bias/readtraining/Adam/truediv_2*
T0*
_output_shapes
:2
 
training/Adam/Assign_3Assigntraining/Adam/Variable_1training/Adam/add_4*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_1*
validate_shape(*
_output_shapes
:2
 
training/Adam/Assign_4Assigntraining/Adam/Variable_9training/Adam/add_5*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_9
≤
training/Adam/Assign_5Assignlayer_1/biastraining/Adam/sub_7*
T0*
_class
loc:@layer_1/bias*
validate_shape(*
_output_shapes
:2*
use_locking(
u
training/Adam/mul_11MulAdam/beta_1/readtraining/Adam/Variable_2/read*
T0*
_output_shapes

:2d
Z
training/Adam/sub_8/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
d
training/Adam/sub_8Subtraining/Adam/sub_8/xAdam/beta_1/read*
T0*
_output_shapes
: 
П
training/Adam/mul_12Multraining/Adam/sub_84training/Adam/gradients/layer_2/MatMul_grad/MatMul_1*
T0*
_output_shapes

:2d
o
training/Adam/add_7Addtraining/Adam/mul_11training/Adam/mul_12*
T0*
_output_shapes

:2d
v
training/Adam/mul_13MulAdam/beta_2/readtraining/Adam/Variable_10/read*
T0*
_output_shapes

:2d
Z
training/Adam/sub_9/xConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
d
training/Adam/sub_9Subtraining/Adam/sub_9/xAdam/beta_2/read*
T0*
_output_shapes
: 

training/Adam/Square_2Square4training/Adam/gradients/layer_2/MatMul_grad/MatMul_1*
T0*
_output_shapes

:2d
q
training/Adam/mul_14Multraining/Adam/sub_9training/Adam/Square_2*
T0*
_output_shapes

:2d
o
training/Adam/add_8Addtraining/Adam/mul_13training/Adam/mul_14*
_output_shapes

:2d*
T0
l
training/Adam/mul_15Multraining/Adam/multraining/Adam/add_7*
T0*
_output_shapes

:2d
Z
training/Adam/Const_6Const*
valueB
 *    *
dtype0*
_output_shapes
: 
Z
training/Adam/Const_7Const*
valueB
 *  А*
dtype0*
_output_shapes
: 
Е
%training/Adam/clip_by_value_3/MinimumMinimumtraining/Adam/add_8training/Adam/Const_7*
T0*
_output_shapes

:2d
П
training/Adam/clip_by_value_3Maximum%training/Adam/clip_by_value_3/Minimumtraining/Adam/Const_6*
T0*
_output_shapes

:2d
d
training/Adam/Sqrt_3Sqrttraining/Adam/clip_by_value_3*
T0*
_output_shapes

:2d
Z
training/Adam/add_9/yConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
p
training/Adam/add_9Addtraining/Adam/Sqrt_3training/Adam/add_9/y*
T0*
_output_shapes

:2d
v
training/Adam/truediv_3RealDivtraining/Adam/mul_15training/Adam/add_9*
T0*
_output_shapes

:2d
r
training/Adam/sub_10Sublayer_2/kernel/readtraining/Adam/truediv_3*
_output_shapes

:2d*
T0
ќ
training/Adam/Assign_6Assigntraining/Adam/Variable_2training/Adam/add_7*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_2*
validate_shape(*
_output_shapes

:2d
–
training/Adam/Assign_7Assigntraining/Adam/Variable_10training/Adam/add_8*
T0*,
_class"
 loc:@training/Adam/Variable_10*
validate_shape(*
_output_shapes

:2d*
use_locking(
ї
training/Adam/Assign_8Assignlayer_2/kerneltraining/Adam/sub_10*
T0*!
_class
loc:@layer_2/kernel*
validate_shape(*
_output_shapes

:2d*
use_locking(
q
training/Adam/mul_16MulAdam/beta_1/readtraining/Adam/Variable_3/read*
_output_shapes
:d*
T0
[
training/Adam/sub_11/xConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
f
training/Adam/sub_11Subtraining/Adam/sub_11/xAdam/beta_1/read*
T0*
_output_shapes
: 
Р
training/Adam/mul_17Multraining/Adam/sub_118training/Adam/gradients/layer_2/BiasAdd_grad/BiasAddGrad*
_output_shapes
:d*
T0
l
training/Adam/add_10Addtraining/Adam/mul_16training/Adam/mul_17*
_output_shapes
:d*
T0
r
training/Adam/mul_18MulAdam/beta_2/readtraining/Adam/Variable_11/read*
T0*
_output_shapes
:d
[
training/Adam/sub_12/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_12Subtraining/Adam/sub_12/xAdam/beta_2/read*
T0*
_output_shapes
: 

training/Adam/Square_3Square8training/Adam/gradients/layer_2/BiasAdd_grad/BiasAddGrad*
_output_shapes
:d*
T0
n
training/Adam/mul_19Multraining/Adam/sub_12training/Adam/Square_3*
T0*
_output_shapes
:d
l
training/Adam/add_11Addtraining/Adam/mul_18training/Adam/mul_19*
T0*
_output_shapes
:d
i
training/Adam/mul_20Multraining/Adam/multraining/Adam/add_10*
_output_shapes
:d*
T0
Z
training/Adam/Const_8Const*
valueB
 *    *
dtype0*
_output_shapes
: 
Z
training/Adam/Const_9Const*
valueB
 *  А*
dtype0*
_output_shapes
: 
В
%training/Adam/clip_by_value_4/MinimumMinimumtraining/Adam/add_11training/Adam/Const_9*
T0*
_output_shapes
:d
Л
training/Adam/clip_by_value_4Maximum%training/Adam/clip_by_value_4/Minimumtraining/Adam/Const_8*
T0*
_output_shapes
:d
`
training/Adam/Sqrt_4Sqrttraining/Adam/clip_by_value_4*
T0*
_output_shapes
:d
[
training/Adam/add_12/yConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
n
training/Adam/add_12Addtraining/Adam/Sqrt_4training/Adam/add_12/y*
T0*
_output_shapes
:d
s
training/Adam/truediv_4RealDivtraining/Adam/mul_20training/Adam/add_12*
T0*
_output_shapes
:d
l
training/Adam/sub_13Sublayer_2/bias/readtraining/Adam/truediv_4*
T0*
_output_shapes
:d
Ћ
training/Adam/Assign_9Assigntraining/Adam/Variable_3training/Adam/add_10*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_3*
validate_shape(*
_output_shapes
:d
ќ
training/Adam/Assign_10Assigntraining/Adam/Variable_11training/Adam/add_11*
T0*,
_class"
 loc:@training/Adam/Variable_11*
validate_shape(*
_output_shapes
:d*
use_locking(
і
training/Adam/Assign_11Assignlayer_2/biastraining/Adam/sub_13*
use_locking(*
T0*
_class
loc:@layer_2/bias*
validate_shape(*
_output_shapes
:d
u
training/Adam/mul_21MulAdam/beta_1/readtraining/Adam/Variable_4/read*
T0*
_output_shapes

:d2
[
training/Adam/sub_14/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_14Subtraining/Adam/sub_14/xAdam/beta_1/read*
T0*
_output_shapes
: 
Р
training/Adam/mul_22Multraining/Adam/sub_144training/Adam/gradients/layer_3/MatMul_grad/MatMul_1*
T0*
_output_shapes

:d2
p
training/Adam/add_13Addtraining/Adam/mul_21training/Adam/mul_22*
T0*
_output_shapes

:d2
v
training/Adam/mul_23MulAdam/beta_2/readtraining/Adam/Variable_12/read*
T0*
_output_shapes

:d2
[
training/Adam/sub_15/xConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
f
training/Adam/sub_15Subtraining/Adam/sub_15/xAdam/beta_2/read*
T0*
_output_shapes
: 

training/Adam/Square_4Square4training/Adam/gradients/layer_3/MatMul_grad/MatMul_1*
T0*
_output_shapes

:d2
r
training/Adam/mul_24Multraining/Adam/sub_15training/Adam/Square_4*
_output_shapes

:d2*
T0
p
training/Adam/add_14Addtraining/Adam/mul_23training/Adam/mul_24*
_output_shapes

:d2*
T0
m
training/Adam/mul_25Multraining/Adam/multraining/Adam/add_13*
_output_shapes

:d2*
T0
[
training/Adam/Const_10Const*
dtype0*
_output_shapes
: *
valueB
 *    
[
training/Adam/Const_11Const*
valueB
 *  А*
dtype0*
_output_shapes
: 
З
%training/Adam/clip_by_value_5/MinimumMinimumtraining/Adam/add_14training/Adam/Const_11*
T0*
_output_shapes

:d2
Р
training/Adam/clip_by_value_5Maximum%training/Adam/clip_by_value_5/Minimumtraining/Adam/Const_10*
T0*
_output_shapes

:d2
d
training/Adam/Sqrt_5Sqrttraining/Adam/clip_by_value_5*
_output_shapes

:d2*
T0
[
training/Adam/add_15/yConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
r
training/Adam/add_15Addtraining/Adam/Sqrt_5training/Adam/add_15/y*
_output_shapes

:d2*
T0
w
training/Adam/truediv_5RealDivtraining/Adam/mul_25training/Adam/add_15*
_output_shapes

:d2*
T0
r
training/Adam/sub_16Sublayer_3/kernel/readtraining/Adam/truediv_5*
_output_shapes

:d2*
T0
–
training/Adam/Assign_12Assigntraining/Adam/Variable_4training/Adam/add_13*
validate_shape(*
_output_shapes

:d2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_4
“
training/Adam/Assign_13Assigntraining/Adam/Variable_12training/Adam/add_14*
validate_shape(*
_output_shapes

:d2*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_12
Љ
training/Adam/Assign_14Assignlayer_3/kerneltraining/Adam/sub_16*
use_locking(*
T0*!
_class
loc:@layer_3/kernel*
validate_shape(*
_output_shapes

:d2
q
training/Adam/mul_26MulAdam/beta_1/readtraining/Adam/Variable_5/read*
T0*
_output_shapes
:2
[
training/Adam/sub_17/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_17Subtraining/Adam/sub_17/xAdam/beta_1/read*
_output_shapes
: *
T0
Р
training/Adam/mul_27Multraining/Adam/sub_178training/Adam/gradients/layer_3/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:2
l
training/Adam/add_16Addtraining/Adam/mul_26training/Adam/mul_27*
_output_shapes
:2*
T0
r
training/Adam/mul_28MulAdam/beta_2/readtraining/Adam/Variable_13/read*
T0*
_output_shapes
:2
[
training/Adam/sub_18/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_18Subtraining/Adam/sub_18/xAdam/beta_2/read*
T0*
_output_shapes
: 

training/Adam/Square_5Square8training/Adam/gradients/layer_3/BiasAdd_grad/BiasAddGrad*
_output_shapes
:2*
T0
n
training/Adam/mul_29Multraining/Adam/sub_18training/Adam/Square_5*
T0*
_output_shapes
:2
l
training/Adam/add_17Addtraining/Adam/mul_28training/Adam/mul_29*
T0*
_output_shapes
:2
i
training/Adam/mul_30Multraining/Adam/multraining/Adam/add_16*
T0*
_output_shapes
:2
[
training/Adam/Const_12Const*
valueB
 *    *
dtype0*
_output_shapes
: 
[
training/Adam/Const_13Const*
dtype0*
_output_shapes
: *
valueB
 *  А
Г
%training/Adam/clip_by_value_6/MinimumMinimumtraining/Adam/add_17training/Adam/Const_13*
T0*
_output_shapes
:2
М
training/Adam/clip_by_value_6Maximum%training/Adam/clip_by_value_6/Minimumtraining/Adam/Const_12*
T0*
_output_shapes
:2
`
training/Adam/Sqrt_6Sqrttraining/Adam/clip_by_value_6*
T0*
_output_shapes
:2
[
training/Adam/add_18/yConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
n
training/Adam/add_18Addtraining/Adam/Sqrt_6training/Adam/add_18/y*
T0*
_output_shapes
:2
s
training/Adam/truediv_6RealDivtraining/Adam/mul_30training/Adam/add_18*
T0*
_output_shapes
:2
l
training/Adam/sub_19Sublayer_3/bias/readtraining/Adam/truediv_6*
T0*
_output_shapes
:2
ћ
training/Adam/Assign_15Assigntraining/Adam/Variable_5training/Adam/add_16*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_5
ќ
training/Adam/Assign_16Assigntraining/Adam/Variable_13training/Adam/add_17*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_13
і
training/Adam/Assign_17Assignlayer_3/biastraining/Adam/sub_19*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*
_class
loc:@layer_3/bias
u
training/Adam/mul_31MulAdam/beta_1/readtraining/Adam/Variable_6/read*
T0*
_output_shapes

:2
[
training/Adam/sub_20/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_20Subtraining/Adam/sub_20/xAdam/beta_1/read*
T0*
_output_shapes
: 
Х
training/Adam/mul_32Multraining/Adam/sub_209training/Adam/gradients/output_layer/MatMul_grad/MatMul_1*
T0*
_output_shapes

:2
p
training/Adam/add_19Addtraining/Adam/mul_31training/Adam/mul_32*
T0*
_output_shapes

:2
v
training/Adam/mul_33MulAdam/beta_2/readtraining/Adam/Variable_14/read*
T0*
_output_shapes

:2
[
training/Adam/sub_21/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_21Subtraining/Adam/sub_21/xAdam/beta_2/read*
T0*
_output_shapes
: 
Д
training/Adam/Square_6Square9training/Adam/gradients/output_layer/MatMul_grad/MatMul_1*
_output_shapes

:2*
T0
r
training/Adam/mul_34Multraining/Adam/sub_21training/Adam/Square_6*
_output_shapes

:2*
T0
p
training/Adam/add_20Addtraining/Adam/mul_33training/Adam/mul_34*
T0*
_output_shapes

:2
m
training/Adam/mul_35Multraining/Adam/multraining/Adam/add_19*
T0*
_output_shapes

:2
[
training/Adam/Const_14Const*
valueB
 *    *
dtype0*
_output_shapes
: 
[
training/Adam/Const_15Const*
valueB
 *  А*
dtype0*
_output_shapes
: 
З
%training/Adam/clip_by_value_7/MinimumMinimumtraining/Adam/add_20training/Adam/Const_15*
T0*
_output_shapes

:2
Р
training/Adam/clip_by_value_7Maximum%training/Adam/clip_by_value_7/Minimumtraining/Adam/Const_14*
T0*
_output_shapes

:2
d
training/Adam/Sqrt_7Sqrttraining/Adam/clip_by_value_7*
T0*
_output_shapes

:2
[
training/Adam/add_21/yConst*
dtype0*
_output_shapes
: *
valueB
 *Хњ÷3
r
training/Adam/add_21Addtraining/Adam/Sqrt_7training/Adam/add_21/y*
T0*
_output_shapes

:2
w
training/Adam/truediv_7RealDivtraining/Adam/mul_35training/Adam/add_21*
T0*
_output_shapes

:2
w
training/Adam/sub_22Suboutput_layer/kernel/readtraining/Adam/truediv_7*
T0*
_output_shapes

:2
–
training/Adam/Assign_18Assigntraining/Adam/Variable_6training/Adam/add_19*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_6*
validate_shape(*
_output_shapes

:2
“
training/Adam/Assign_19Assigntraining/Adam/Variable_14training/Adam/add_20*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_14*
validate_shape(*
_output_shapes

:2
∆
training/Adam/Assign_20Assignoutput_layer/kerneltraining/Adam/sub_22*
use_locking(*
T0*&
_class
loc:@output_layer/kernel*
validate_shape(*
_output_shapes

:2
q
training/Adam/mul_36MulAdam/beta_1/readtraining/Adam/Variable_7/read*
_output_shapes
:*
T0
[
training/Adam/sub_23/xConst*
dtype0*
_output_shapes
: *
valueB
 *  А?
f
training/Adam/sub_23Subtraining/Adam/sub_23/xAdam/beta_1/read*
T0*
_output_shapes
: 
Х
training/Adam/mul_37Multraining/Adam/sub_23=training/Adam/gradients/output_layer/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:
l
training/Adam/add_22Addtraining/Adam/mul_36training/Adam/mul_37*
T0*
_output_shapes
:
r
training/Adam/mul_38MulAdam/beta_2/readtraining/Adam/Variable_15/read*
T0*
_output_shapes
:
[
training/Adam/sub_24/xConst*
valueB
 *  А?*
dtype0*
_output_shapes
: 
f
training/Adam/sub_24Subtraining/Adam/sub_24/xAdam/beta_2/read*
T0*
_output_shapes
: 
Д
training/Adam/Square_7Square=training/Adam/gradients/output_layer/BiasAdd_grad/BiasAddGrad*
T0*
_output_shapes
:
n
training/Adam/mul_39Multraining/Adam/sub_24training/Adam/Square_7*
T0*
_output_shapes
:
l
training/Adam/add_23Addtraining/Adam/mul_38training/Adam/mul_39*
T0*
_output_shapes
:
i
training/Adam/mul_40Multraining/Adam/multraining/Adam/add_22*
T0*
_output_shapes
:
[
training/Adam/Const_16Const*
dtype0*
_output_shapes
: *
valueB
 *    
[
training/Adam/Const_17Const*
valueB
 *  А*
dtype0*
_output_shapes
: 
Г
%training/Adam/clip_by_value_8/MinimumMinimumtraining/Adam/add_23training/Adam/Const_17*
T0*
_output_shapes
:
М
training/Adam/clip_by_value_8Maximum%training/Adam/clip_by_value_8/Minimumtraining/Adam/Const_16*
_output_shapes
:*
T0
`
training/Adam/Sqrt_8Sqrttraining/Adam/clip_by_value_8*
T0*
_output_shapes
:
[
training/Adam/add_24/yConst*
valueB
 *Хњ÷3*
dtype0*
_output_shapes
: 
n
training/Adam/add_24Addtraining/Adam/Sqrt_8training/Adam/add_24/y*
T0*
_output_shapes
:
s
training/Adam/truediv_8RealDivtraining/Adam/mul_40training/Adam/add_24*
T0*
_output_shapes
:
q
training/Adam/sub_25Suboutput_layer/bias/readtraining/Adam/truediv_8*
_output_shapes
:*
T0
ћ
training/Adam/Assign_21Assigntraining/Adam/Variable_7training/Adam/add_22*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_7*
validate_shape(*
_output_shapes
:
ќ
training/Adam/Assign_22Assigntraining/Adam/Variable_15training/Adam/add_23*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_15*
validate_shape(*
_output_shapes
:
Њ
training/Adam/Assign_23Assignoutput_layer/biastraining/Adam/sub_25*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*$
_class
loc:@output_layer/bias
§
training/group_depsNoOp	^loss/mul^training/Adam/AssignAdd^training/Adam/Assign^training/Adam/Assign_1^training/Adam/Assign_2^training/Adam/Assign_3^training/Adam/Assign_4^training/Adam/Assign_5^training/Adam/Assign_6^training/Adam/Assign_7^training/Adam/Assign_8^training/Adam/Assign_9^training/Adam/Assign_10^training/Adam/Assign_11^training/Adam/Assign_12^training/Adam/Assign_13^training/Adam/Assign_14^training/Adam/Assign_15^training/Adam/Assign_16^training/Adam/Assign_17^training/Adam/Assign_18^training/Adam/Assign_19^training/Adam/Assign_20^training/Adam/Assign_21^training/Adam/Assign_22^training/Adam/Assign_23
К
IsVariableInitialized_8IsVariableInitializedAdam/iterations*"
_class
loc:@Adam/iterations*
dtype0	*
_output_shapes
: 
z
IsVariableInitialized_9IsVariableInitializedAdam/lr*
_class
loc:@Adam/lr*
dtype0*
_output_shapes
: 
Г
IsVariableInitialized_10IsVariableInitializedAdam/beta_1*
_class
loc:@Adam/beta_1*
dtype0*
_output_shapes
: 
Г
IsVariableInitialized_11IsVariableInitializedAdam/beta_2*
_class
loc:@Adam/beta_2*
dtype0*
_output_shapes
: 
Б
IsVariableInitialized_12IsVariableInitialized
Adam/decay*
_class
loc:@Adam/decay*
dtype0*
_output_shapes
: 
Щ
IsVariableInitialized_13IsVariableInitializedtraining/Adam/Variable*)
_class
loc:@training/Adam/Variable*
dtype0*
_output_shapes
: 
Э
IsVariableInitialized_14IsVariableInitializedtraining/Adam/Variable_1*+
_class!
loc:@training/Adam/Variable_1*
dtype0*
_output_shapes
: 
Э
IsVariableInitialized_15IsVariableInitializedtraining/Adam/Variable_2*
dtype0*
_output_shapes
: *+
_class!
loc:@training/Adam/Variable_2
Э
IsVariableInitialized_16IsVariableInitializedtraining/Adam/Variable_3*+
_class!
loc:@training/Adam/Variable_3*
dtype0*
_output_shapes
: 
Э
IsVariableInitialized_17IsVariableInitializedtraining/Adam/Variable_4*
dtype0*
_output_shapes
: *+
_class!
loc:@training/Adam/Variable_4
Э
IsVariableInitialized_18IsVariableInitializedtraining/Adam/Variable_5*
dtype0*
_output_shapes
: *+
_class!
loc:@training/Adam/Variable_5
Э
IsVariableInitialized_19IsVariableInitializedtraining/Adam/Variable_6*+
_class!
loc:@training/Adam/Variable_6*
dtype0*
_output_shapes
: 
Э
IsVariableInitialized_20IsVariableInitializedtraining/Adam/Variable_7*+
_class!
loc:@training/Adam/Variable_7*
dtype0*
_output_shapes
: 
Э
IsVariableInitialized_21IsVariableInitializedtraining/Adam/Variable_8*+
_class!
loc:@training/Adam/Variable_8*
dtype0*
_output_shapes
: 
Э
IsVariableInitialized_22IsVariableInitializedtraining/Adam/Variable_9*+
_class!
loc:@training/Adam/Variable_9*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_23IsVariableInitializedtraining/Adam/Variable_10*,
_class"
 loc:@training/Adam/Variable_10*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_24IsVariableInitializedtraining/Adam/Variable_11*,
_class"
 loc:@training/Adam/Variable_11*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_25IsVariableInitializedtraining/Adam/Variable_12*,
_class"
 loc:@training/Adam/Variable_12*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_26IsVariableInitializedtraining/Adam/Variable_13*,
_class"
 loc:@training/Adam/Variable_13*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_27IsVariableInitializedtraining/Adam/Variable_14*,
_class"
 loc:@training/Adam/Variable_14*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_28IsVariableInitializedtraining/Adam/Variable_15*,
_class"
 loc:@training/Adam/Variable_15*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_29IsVariableInitializedtraining/Adam/Variable_16*,
_class"
 loc:@training/Adam/Variable_16*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_30IsVariableInitializedtraining/Adam/Variable_17*,
_class"
 loc:@training/Adam/Variable_17*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_31IsVariableInitializedtraining/Adam/Variable_18*,
_class"
 loc:@training/Adam/Variable_18*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_32IsVariableInitializedtraining/Adam/Variable_19*,
_class"
 loc:@training/Adam/Variable_19*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_33IsVariableInitializedtraining/Adam/Variable_20*
dtype0*
_output_shapes
: *,
_class"
 loc:@training/Adam/Variable_20
Я
IsVariableInitialized_34IsVariableInitializedtraining/Adam/Variable_21*,
_class"
 loc:@training/Adam/Variable_21*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_35IsVariableInitializedtraining/Adam/Variable_22*,
_class"
 loc:@training/Adam/Variable_22*
dtype0*
_output_shapes
: 
Я
IsVariableInitialized_36IsVariableInitializedtraining/Adam/Variable_23*,
_class"
 loc:@training/Adam/Variable_23*
dtype0*
_output_shapes
: 
≤
init_1NoOp^Adam/iterations/Assign^Adam/lr/Assign^Adam/beta_1/Assign^Adam/beta_2/Assign^Adam/decay/Assign^training/Adam/Variable/Assign ^training/Adam/Variable_1/Assign ^training/Adam/Variable_2/Assign ^training/Adam/Variable_3/Assign ^training/Adam/Variable_4/Assign ^training/Adam/Variable_5/Assign ^training/Adam/Variable_6/Assign ^training/Adam/Variable_7/Assign ^training/Adam/Variable_8/Assign ^training/Adam/Variable_9/Assign!^training/Adam/Variable_10/Assign!^training/Adam/Variable_11/Assign!^training/Adam/Variable_12/Assign!^training/Adam/Variable_13/Assign!^training/Adam/Variable_14/Assign!^training/Adam/Variable_15/Assign!^training/Adam/Variable_16/Assign!^training/Adam/Variable_17/Assign!^training/Adam/Variable_18/Assign!^training/Adam/Variable_19/Assign!^training/Adam/Variable_20/Assign!^training/Adam/Variable_21/Assign!^training/Adam/Variable_22/Assign!^training/Adam/Variable_23/Assign
N
Placeholder_8Placeholder*
dtype0	*
_output_shapes
: *
shape: 
†
Assign_8AssignAdam/iterationsPlaceholder_8*
use_locking( *
T0	*"
_class
loc:@Adam/iterations*
validate_shape(*
_output_shapes
: 
^
Placeholder_9Placeholder*
dtype0*
_output_shapes

:	2*
shape
:	2
ґ
Assign_9Assigntraining/Adam/VariablePlaceholder_9*
T0*)
_class
loc:@training/Adam/Variable*
validate_shape(*
_output_shapes

:	2*
use_locking( 
W
Placeholder_10Placeholder*
dtype0*
_output_shapes
:2*
shape:2
Є
	Assign_10Assigntraining/Adam/Variable_1Placeholder_10*
T0*+
_class!
loc:@training/Adam/Variable_1*
validate_shape(*
_output_shapes
:2*
use_locking( 
_
Placeholder_11Placeholder*
dtype0*
_output_shapes

:2d*
shape
:2d
Љ
	Assign_11Assigntraining/Adam/Variable_2Placeholder_11*
use_locking( *
T0*+
_class!
loc:@training/Adam/Variable_2*
validate_shape(*
_output_shapes

:2d
W
Placeholder_12Placeholder*
dtype0*
_output_shapes
:d*
shape:d
Є
	Assign_12Assigntraining/Adam/Variable_3Placeholder_12*
T0*+
_class!
loc:@training/Adam/Variable_3*
validate_shape(*
_output_shapes
:d*
use_locking( 
_
Placeholder_13Placeholder*
dtype0*
_output_shapes

:d2*
shape
:d2
Љ
	Assign_13Assigntraining/Adam/Variable_4Placeholder_13*
validate_shape(*
_output_shapes

:d2*
use_locking( *
T0*+
_class!
loc:@training/Adam/Variable_4
W
Placeholder_14Placeholder*
dtype0*
_output_shapes
:2*
shape:2
Є
	Assign_14Assigntraining/Adam/Variable_5Placeholder_14*
use_locking( *
T0*+
_class!
loc:@training/Adam/Variable_5*
validate_shape(*
_output_shapes
:2
_
Placeholder_15Placeholder*
dtype0*
_output_shapes

:2*
shape
:2
Љ
	Assign_15Assigntraining/Adam/Variable_6Placeholder_15*
use_locking( *
T0*+
_class!
loc:@training/Adam/Variable_6*
validate_shape(*
_output_shapes

:2
W
Placeholder_16Placeholder*
shape:*
dtype0*
_output_shapes
:
Є
	Assign_16Assigntraining/Adam/Variable_7Placeholder_16*
validate_shape(*
_output_shapes
:*
use_locking( *
T0*+
_class!
loc:@training/Adam/Variable_7
_
Placeholder_17Placeholder*
shape
:	2*
dtype0*
_output_shapes

:	2
Љ
	Assign_17Assigntraining/Adam/Variable_8Placeholder_17*
T0*+
_class!
loc:@training/Adam/Variable_8*
validate_shape(*
_output_shapes

:	2*
use_locking( 
W
Placeholder_18Placeholder*
shape:2*
dtype0*
_output_shapes
:2
Є
	Assign_18Assigntraining/Adam/Variable_9Placeholder_18*
use_locking( *
T0*+
_class!
loc:@training/Adam/Variable_9*
validate_shape(*
_output_shapes
:2
_
Placeholder_19Placeholder*
dtype0*
_output_shapes

:2d*
shape
:2d
Њ
	Assign_19Assigntraining/Adam/Variable_10Placeholder_19*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_10*
validate_shape(*
_output_shapes

:2d
W
Placeholder_20Placeholder*
dtype0*
_output_shapes
:d*
shape:d
Ї
	Assign_20Assigntraining/Adam/Variable_11Placeholder_20*
T0*,
_class"
 loc:@training/Adam/Variable_11*
validate_shape(*
_output_shapes
:d*
use_locking( 
_
Placeholder_21Placeholder*
dtype0*
_output_shapes

:d2*
shape
:d2
Њ
	Assign_21Assigntraining/Adam/Variable_12Placeholder_21*
T0*,
_class"
 loc:@training/Adam/Variable_12*
validate_shape(*
_output_shapes

:d2*
use_locking( 
W
Placeholder_22Placeholder*
dtype0*
_output_shapes
:2*
shape:2
Ї
	Assign_22Assigntraining/Adam/Variable_13Placeholder_22*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_13*
validate_shape(*
_output_shapes
:2
_
Placeholder_23Placeholder*
dtype0*
_output_shapes

:2*
shape
:2
Њ
	Assign_23Assigntraining/Adam/Variable_14Placeholder_23*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_14*
validate_shape(*
_output_shapes

:2
W
Placeholder_24Placeholder*
shape:*
dtype0*
_output_shapes
:
Ї
	Assign_24Assigntraining/Adam/Variable_15Placeholder_24*
T0*,
_class"
 loc:@training/Adam/Variable_15*
validate_shape(*
_output_shapes
:*
use_locking( 
W
Placeholder_25Placeholder*
dtype0*
_output_shapes
:*
shape:
Ї
	Assign_25Assigntraining/Adam/Variable_16Placeholder_25*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_16*
validate_shape(*
_output_shapes
:
W
Placeholder_26Placeholder*
dtype0*
_output_shapes
:*
shape:
Ї
	Assign_26Assigntraining/Adam/Variable_17Placeholder_26*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_17*
validate_shape(*
_output_shapes
:
W
Placeholder_27Placeholder*
shape:*
dtype0*
_output_shapes
:
Ї
	Assign_27Assigntraining/Adam/Variable_18Placeholder_27*
validate_shape(*
_output_shapes
:*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_18
W
Placeholder_28Placeholder*
dtype0*
_output_shapes
:*
shape:
Ї
	Assign_28Assigntraining/Adam/Variable_19Placeholder_28*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_19*
validate_shape(*
_output_shapes
:
W
Placeholder_29Placeholder*
shape:*
dtype0*
_output_shapes
:
Ї
	Assign_29Assigntraining/Adam/Variable_20Placeholder_29*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_20*
validate_shape(*
_output_shapes
:
W
Placeholder_30Placeholder*
shape:*
dtype0*
_output_shapes
:
Ї
	Assign_30Assigntraining/Adam/Variable_21Placeholder_30*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_21*
validate_shape(*
_output_shapes
:
W
Placeholder_31Placeholder*
dtype0*
_output_shapes
:*
shape:
Ї
	Assign_31Assigntraining/Adam/Variable_22Placeholder_31*
validate_shape(*
_output_shapes
:*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_22
W
Placeholder_32Placeholder*
dtype0*
_output_shapes
:*
shape:
Ї
	Assign_32Assigntraining/Adam/Variable_23Placeholder_32*
validate_shape(*
_output_shapes
:*
use_locking( *
T0*,
_class"
 loc:@training/Adam/Variable_23
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
Д
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_3e9ac46f7a324621ab4192aef6cc31f0/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
dtype0*
_output_shapes
: *
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
М
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
ѓ
save/SaveV2/tensor_namesConst"/device:CPU:0*”
value…B∆%BAdam/beta_1BAdam/beta_2B
Adam/decayBAdam/iterationsBAdam/lrBlayer_1/biasBlayer_1/kernelBlayer_2/biasBlayer_2/kernelBlayer_3/biasBlayer_3/kernelBoutput_layer/biasBoutput_layer/kernelBtraining/Adam/VariableBtraining/Adam/Variable_1Btraining/Adam/Variable_10Btraining/Adam/Variable_11Btraining/Adam/Variable_12Btraining/Adam/Variable_13Btraining/Adam/Variable_14Btraining/Adam/Variable_15Btraining/Adam/Variable_16Btraining/Adam/Variable_17Btraining/Adam/Variable_18Btraining/Adam/Variable_19Btraining/Adam/Variable_2Btraining/Adam/Variable_20Btraining/Adam/Variable_21Btraining/Adam/Variable_22Btraining/Adam/Variable_23Btraining/Adam/Variable_3Btraining/Adam/Variable_4Btraining/Adam/Variable_5Btraining/Adam/Variable_6Btraining/Adam/Variable_7Btraining/Adam/Variable_8Btraining/Adam/Variable_9*
dtype0*
_output_shapes
:%
Љ
save/SaveV2/shape_and_slicesConst"/device:CPU:0*]
valueTBR%B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:%
е
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesAdam/beta_1Adam/beta_2
Adam/decayAdam/iterationsAdam/lrlayer_1/biaslayer_1/kernellayer_2/biaslayer_2/kernellayer_3/biaslayer_3/kerneloutput_layer/biasoutput_layer/kerneltraining/Adam/Variabletraining/Adam/Variable_1training/Adam/Variable_10training/Adam/Variable_11training/Adam/Variable_12training/Adam/Variable_13training/Adam/Variable_14training/Adam/Variable_15training/Adam/Variable_16training/Adam/Variable_17training/Adam/Variable_18training/Adam/Variable_19training/Adam/Variable_2training/Adam/Variable_20training/Adam/Variable_21training/Adam/Variable_22training/Adam/Variable_23training/Adam/Variable_3training/Adam/Variable_4training/Adam/Variable_5training/Adam/Variable_6training/Adam/Variable_7training/Adam/Variable_8training/Adam/Variable_9"/device:CPU:0*3
dtypes)
'2%	
†
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
ђ
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
N*
_output_shapes
:*
T0*

axis 
М
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
Й
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 
≤
save/RestoreV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:%*”
value…B∆%BAdam/beta_1BAdam/beta_2B
Adam/decayBAdam/iterationsBAdam/lrBlayer_1/biasBlayer_1/kernelBlayer_2/biasBlayer_2/kernelBlayer_3/biasBlayer_3/kernelBoutput_layer/biasBoutput_layer/kernelBtraining/Adam/VariableBtraining/Adam/Variable_1Btraining/Adam/Variable_10Btraining/Adam/Variable_11Btraining/Adam/Variable_12Btraining/Adam/Variable_13Btraining/Adam/Variable_14Btraining/Adam/Variable_15Btraining/Adam/Variable_16Btraining/Adam/Variable_17Btraining/Adam/Variable_18Btraining/Adam/Variable_19Btraining/Adam/Variable_2Btraining/Adam/Variable_20Btraining/Adam/Variable_21Btraining/Adam/Variable_22Btraining/Adam/Variable_23Btraining/Adam/Variable_3Btraining/Adam/Variable_4Btraining/Adam/Variable_5Btraining/Adam/Variable_6Btraining/Adam/Variable_7Btraining/Adam/Variable_8Btraining/Adam/Variable_9
њ
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*]
valueTBR%B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0*
_output_shapes
:%
÷
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*™
_output_shapesЧ
Ф:::::::::::::::::::::::::::::::::::::*3
dtypes)
'2%	
Ь
save/AssignAssignAdam/beta_1save/RestoreV2*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Adam/beta_1
†
save/Assign_1AssignAdam/beta_2save/RestoreV2:1*
use_locking(*
T0*
_class
loc:@Adam/beta_2*
validate_shape(*
_output_shapes
: 
Ю
save/Assign_2Assign
Adam/decaysave/RestoreV2:2*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Adam/decay
®
save/Assign_3AssignAdam/iterationssave/RestoreV2:3*
use_locking(*
T0	*"
_class
loc:@Adam/iterations*
validate_shape(*
_output_shapes
: 
Ш
save/Assign_4AssignAdam/lrsave/RestoreV2:4*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*
_class
loc:@Adam/lr
¶
save/Assign_5Assignlayer_1/biassave/RestoreV2:5*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*
_class
loc:@layer_1/bias
Ѓ
save/Assign_6Assignlayer_1/kernelsave/RestoreV2:6*
validate_shape(*
_output_shapes

:	2*
use_locking(*
T0*!
_class
loc:@layer_1/kernel
¶
save/Assign_7Assignlayer_2/biassave/RestoreV2:7*
use_locking(*
T0*
_class
loc:@layer_2/bias*
validate_shape(*
_output_shapes
:d
Ѓ
save/Assign_8Assignlayer_2/kernelsave/RestoreV2:8*
use_locking(*
T0*!
_class
loc:@layer_2/kernel*
validate_shape(*
_output_shapes

:2d
¶
save/Assign_9Assignlayer_3/biassave/RestoreV2:9*
use_locking(*
T0*
_class
loc:@layer_3/bias*
validate_shape(*
_output_shapes
:2
∞
save/Assign_10Assignlayer_3/kernelsave/RestoreV2:10*
use_locking(*
T0*!
_class
loc:@layer_3/kernel*
validate_shape(*
_output_shapes

:d2
≤
save/Assign_11Assignoutput_layer/biassave/RestoreV2:11*
use_locking(*
T0*$
_class
loc:@output_layer/bias*
validate_shape(*
_output_shapes
:
Ї
save/Assign_12Assignoutput_layer/kernelsave/RestoreV2:12*
use_locking(*
T0*&
_class
loc:@output_layer/kernel*
validate_shape(*
_output_shapes

:2
ј
save/Assign_13Assigntraining/Adam/Variablesave/RestoreV2:13*
validate_shape(*
_output_shapes

:	2*
use_locking(*
T0*)
_class
loc:@training/Adam/Variable
ј
save/Assign_14Assigntraining/Adam/Variable_1save/RestoreV2:14*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_1*
validate_shape(*
_output_shapes
:2
∆
save/Assign_15Assigntraining/Adam/Variable_10save/RestoreV2:15*
T0*,
_class"
 loc:@training/Adam/Variable_10*
validate_shape(*
_output_shapes

:2d*
use_locking(
¬
save/Assign_16Assigntraining/Adam/Variable_11save/RestoreV2:16*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_11*
validate_shape(*
_output_shapes
:d
∆
save/Assign_17Assigntraining/Adam/Variable_12save/RestoreV2:17*
T0*,
_class"
 loc:@training/Adam/Variable_12*
validate_shape(*
_output_shapes

:d2*
use_locking(
¬
save/Assign_18Assigntraining/Adam/Variable_13save/RestoreV2:18*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_13*
validate_shape(*
_output_shapes
:2
∆
save/Assign_19Assigntraining/Adam/Variable_14save/RestoreV2:19*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_14
¬
save/Assign_20Assigntraining/Adam/Variable_15save/RestoreV2:20*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_15*
validate_shape(*
_output_shapes
:
¬
save/Assign_21Assigntraining/Adam/Variable_16save/RestoreV2:21*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_16*
validate_shape(*
_output_shapes
:
¬
save/Assign_22Assigntraining/Adam/Variable_17save/RestoreV2:22*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_17
¬
save/Assign_23Assigntraining/Adam/Variable_18save/RestoreV2:23*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_18
¬
save/Assign_24Assigntraining/Adam/Variable_19save/RestoreV2:24*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_19
ƒ
save/Assign_25Assigntraining/Adam/Variable_2save/RestoreV2:25*
validate_shape(*
_output_shapes

:2d*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_2
¬
save/Assign_26Assigntraining/Adam/Variable_20save/RestoreV2:26*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_20*
validate_shape(*
_output_shapes
:
¬
save/Assign_27Assigntraining/Adam/Variable_21save/RestoreV2:27*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_21
¬
save/Assign_28Assigntraining/Adam/Variable_22save/RestoreV2:28*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_22*
validate_shape(*
_output_shapes
:
¬
save/Assign_29Assigntraining/Adam/Variable_23save/RestoreV2:29*
validate_shape(*
_output_shapes
:*
use_locking(*
T0*,
_class"
 loc:@training/Adam/Variable_23
ј
save/Assign_30Assigntraining/Adam/Variable_3save/RestoreV2:30*
validate_shape(*
_output_shapes
:d*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_3
ƒ
save/Assign_31Assigntraining/Adam/Variable_4save/RestoreV2:31*
T0*+
_class!
loc:@training/Adam/Variable_4*
validate_shape(*
_output_shapes

:d2*
use_locking(
ј
save/Assign_32Assigntraining/Adam/Variable_5save/RestoreV2:32*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_5*
validate_shape(*
_output_shapes
:2
ƒ
save/Assign_33Assigntraining/Adam/Variable_6save/RestoreV2:33*
validate_shape(*
_output_shapes

:2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_6
ј
save/Assign_34Assigntraining/Adam/Variable_7save/RestoreV2:34*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_7*
validate_shape(*
_output_shapes
:
ƒ
save/Assign_35Assigntraining/Adam/Variable_8save/RestoreV2:35*
validate_shape(*
_output_shapes

:	2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_8
ј
save/Assign_36Assigntraining/Adam/Variable_9save/RestoreV2:36*
validate_shape(*
_output_shapes
:2*
use_locking(*
T0*+
_class!
loc:@training/Adam/Variable_9
Г
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_23^save/Assign_24^save/Assign_25^save/Assign_26^save/Assign_27^save/Assign_28^save/Assign_29^save/Assign_30^save/Assign_31^save/Assign_32^save/Assign_33^save/Assign_34^save/Assign_35^save/Assign_36
-
save/restore_allNoOp^save/restore_shard"<
save/Const:0save/Identity:0save/restore_all (5 @F8"Щ 
trainable_variablesБ ю
Z
layer_1/kernel:0layer_1/kernel/Assignlayer_1/kernel/read:02layer_1/random_uniform:0
K
layer_1/bias:0layer_1/bias/Assignlayer_1/bias/read:02layer_1/Const:0
Z
layer_2/kernel:0layer_2/kernel/Assignlayer_2/kernel/read:02layer_2/random_uniform:0
K
layer_2/bias:0layer_2/bias/Assignlayer_2/bias/read:02layer_2/Const:0
Z
layer_3/kernel:0layer_3/kernel/Assignlayer_3/kernel/read:02layer_3/random_uniform:0
K
layer_3/bias:0layer_3/bias/Assignlayer_3/bias/read:02layer_3/Const:0
n
output_layer/kernel:0output_layer/kernel/Assignoutput_layer/kernel/read:02output_layer/random_uniform:0
_
output_layer/bias:0output_layer/bias/Assignoutput_layer/bias/read:02output_layer/Const:0
d
Adam/iterations:0Adam/iterations/AssignAdam/iterations/read:02Adam/iterations/initial_value:0
D
	Adam/lr:0Adam/lr/AssignAdam/lr/read:02Adam/lr/initial_value:0
T
Adam/beta_1:0Adam/beta_1/AssignAdam/beta_1/read:02Adam/beta_1/initial_value:0
T
Adam/beta_2:0Adam/beta_2/AssignAdam/beta_2/read:02Adam/beta_2/initial_value:0
P
Adam/decay:0Adam/decay/AssignAdam/decay/read:02Adam/decay/initial_value:0
o
training/Adam/Variable:0training/Adam/Variable/Assigntraining/Adam/Variable/read:02training/Adam/zeros:0
w
training/Adam/Variable_1:0training/Adam/Variable_1/Assigntraining/Adam/Variable_1/read:02training/Adam/zeros_1:0
w
training/Adam/Variable_2:0training/Adam/Variable_2/Assigntraining/Adam/Variable_2/read:02training/Adam/zeros_2:0
w
training/Adam/Variable_3:0training/Adam/Variable_3/Assigntraining/Adam/Variable_3/read:02training/Adam/zeros_3:0
w
training/Adam/Variable_4:0training/Adam/Variable_4/Assigntraining/Adam/Variable_4/read:02training/Adam/zeros_4:0
w
training/Adam/Variable_5:0training/Adam/Variable_5/Assigntraining/Adam/Variable_5/read:02training/Adam/zeros_5:0
w
training/Adam/Variable_6:0training/Adam/Variable_6/Assigntraining/Adam/Variable_6/read:02training/Adam/zeros_6:0
w
training/Adam/Variable_7:0training/Adam/Variable_7/Assigntraining/Adam/Variable_7/read:02training/Adam/zeros_7:0
w
training/Adam/Variable_8:0training/Adam/Variable_8/Assigntraining/Adam/Variable_8/read:02training/Adam/zeros_8:0
w
training/Adam/Variable_9:0training/Adam/Variable_9/Assigntraining/Adam/Variable_9/read:02training/Adam/zeros_9:0
{
training/Adam/Variable_10:0 training/Adam/Variable_10/Assign training/Adam/Variable_10/read:02training/Adam/zeros_10:0
{
training/Adam/Variable_11:0 training/Adam/Variable_11/Assign training/Adam/Variable_11/read:02training/Adam/zeros_11:0
{
training/Adam/Variable_12:0 training/Adam/Variable_12/Assign training/Adam/Variable_12/read:02training/Adam/zeros_12:0
{
training/Adam/Variable_13:0 training/Adam/Variable_13/Assign training/Adam/Variable_13/read:02training/Adam/zeros_13:0
{
training/Adam/Variable_14:0 training/Adam/Variable_14/Assign training/Adam/Variable_14/read:02training/Adam/zeros_14:0
{
training/Adam/Variable_15:0 training/Adam/Variable_15/Assign training/Adam/Variable_15/read:02training/Adam/zeros_15:0
{
training/Adam/Variable_16:0 training/Adam/Variable_16/Assign training/Adam/Variable_16/read:02training/Adam/zeros_16:0
{
training/Adam/Variable_17:0 training/Adam/Variable_17/Assign training/Adam/Variable_17/read:02training/Adam/zeros_17:0
{
training/Adam/Variable_18:0 training/Adam/Variable_18/Assign training/Adam/Variable_18/read:02training/Adam/zeros_18:0
{
training/Adam/Variable_19:0 training/Adam/Variable_19/Assign training/Adam/Variable_19/read:02training/Adam/zeros_19:0
{
training/Adam/Variable_20:0 training/Adam/Variable_20/Assign training/Adam/Variable_20/read:02training/Adam/zeros_20:0
{
training/Adam/Variable_21:0 training/Adam/Variable_21/Assign training/Adam/Variable_21/read:02training/Adam/zeros_21:0
{
training/Adam/Variable_22:0 training/Adam/Variable_22/Assign training/Adam/Variable_22/read:02training/Adam/zeros_22:0
{
training/Adam/Variable_23:0 training/Adam/Variable_23/Assign training/Adam/Variable_23/read:02training/Adam/zeros_23:0"П 
	variablesБ ю
Z
layer_1/kernel:0layer_1/kernel/Assignlayer_1/kernel/read:02layer_1/random_uniform:0
K
layer_1/bias:0layer_1/bias/Assignlayer_1/bias/read:02layer_1/Const:0
Z
layer_2/kernel:0layer_2/kernel/Assignlayer_2/kernel/read:02layer_2/random_uniform:0
K
layer_2/bias:0layer_2/bias/Assignlayer_2/bias/read:02layer_2/Const:0
Z
layer_3/kernel:0layer_3/kernel/Assignlayer_3/kernel/read:02layer_3/random_uniform:0
K
layer_3/bias:0layer_3/bias/Assignlayer_3/bias/read:02layer_3/Const:0
n
output_layer/kernel:0output_layer/kernel/Assignoutput_layer/kernel/read:02output_layer/random_uniform:0
_
output_layer/bias:0output_layer/bias/Assignoutput_layer/bias/read:02output_layer/Const:0
d
Adam/iterations:0Adam/iterations/AssignAdam/iterations/read:02Adam/iterations/initial_value:0
D
	Adam/lr:0Adam/lr/AssignAdam/lr/read:02Adam/lr/initial_value:0
T
Adam/beta_1:0Adam/beta_1/AssignAdam/beta_1/read:02Adam/beta_1/initial_value:0
T
Adam/beta_2:0Adam/beta_2/AssignAdam/beta_2/read:02Adam/beta_2/initial_value:0
P
Adam/decay:0Adam/decay/AssignAdam/decay/read:02Adam/decay/initial_value:0
o
training/Adam/Variable:0training/Adam/Variable/Assigntraining/Adam/Variable/read:02training/Adam/zeros:0
w
training/Adam/Variable_1:0training/Adam/Variable_1/Assigntraining/Adam/Variable_1/read:02training/Adam/zeros_1:0
w
training/Adam/Variable_2:0training/Adam/Variable_2/Assigntraining/Adam/Variable_2/read:02training/Adam/zeros_2:0
w
training/Adam/Variable_3:0training/Adam/Variable_3/Assigntraining/Adam/Variable_3/read:02training/Adam/zeros_3:0
w
training/Adam/Variable_4:0training/Adam/Variable_4/Assigntraining/Adam/Variable_4/read:02training/Adam/zeros_4:0
w
training/Adam/Variable_5:0training/Adam/Variable_5/Assigntraining/Adam/Variable_5/read:02training/Adam/zeros_5:0
w
training/Adam/Variable_6:0training/Adam/Variable_6/Assigntraining/Adam/Variable_6/read:02training/Adam/zeros_6:0
w
training/Adam/Variable_7:0training/Adam/Variable_7/Assigntraining/Adam/Variable_7/read:02training/Adam/zeros_7:0
w
training/Adam/Variable_8:0training/Adam/Variable_8/Assigntraining/Adam/Variable_8/read:02training/Adam/zeros_8:0
w
training/Adam/Variable_9:0training/Adam/Variable_9/Assigntraining/Adam/Variable_9/read:02training/Adam/zeros_9:0
{
training/Adam/Variable_10:0 training/Adam/Variable_10/Assign training/Adam/Variable_10/read:02training/Adam/zeros_10:0
{
training/Adam/Variable_11:0 training/Adam/Variable_11/Assign training/Adam/Variable_11/read:02training/Adam/zeros_11:0
{
training/Adam/Variable_12:0 training/Adam/Variable_12/Assign training/Adam/Variable_12/read:02training/Adam/zeros_12:0
{
training/Adam/Variable_13:0 training/Adam/Variable_13/Assign training/Adam/Variable_13/read:02training/Adam/zeros_13:0
{
training/Adam/Variable_14:0 training/Adam/Variable_14/Assign training/Adam/Variable_14/read:02training/Adam/zeros_14:0
{
training/Adam/Variable_15:0 training/Adam/Variable_15/Assign training/Adam/Variable_15/read:02training/Adam/zeros_15:0
{
training/Adam/Variable_16:0 training/Adam/Variable_16/Assign training/Adam/Variable_16/read:02training/Adam/zeros_16:0
{
training/Adam/Variable_17:0 training/Adam/Variable_17/Assign training/Adam/Variable_17/read:02training/Adam/zeros_17:0
{
training/Adam/Variable_18:0 training/Adam/Variable_18/Assign training/Adam/Variable_18/read:02training/Adam/zeros_18:0
{
training/Adam/Variable_19:0 training/Adam/Variable_19/Assign training/Adam/Variable_19/read:02training/Adam/zeros_19:0
{
training/Adam/Variable_20:0 training/Adam/Variable_20/Assign training/Adam/Variable_20/read:02training/Adam/zeros_20:0
{
training/Adam/Variable_21:0 training/Adam/Variable_21/Assign training/Adam/Variable_21/read:02training/Adam/zeros_21:0
{
training/Adam/Variable_22:0 training/Adam/Variable_22/Assign training/Adam/Variable_22/read:02training/Adam/zeros_22:0
{
training/Adam/Variable_23:0 training/Adam/Variable_23/Assign training/Adam/Variable_23/read:02training/Adam/zeros_23:0*Ь
serving_defaultИ
/
input&
layer_1_input:0€€€€€€€€€	9
earnings-
output_layer/BiasAdd:0€€€€€€€€€tensorflow/serving/predict