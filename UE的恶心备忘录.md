<!--
 * @author: whitingyan
 * @LastEditors: whitingyan
 * @Copyright: 2021 Tencent Inc. All rights reserved.
 * @Date: 2024-10-22 20:59:28
 * @LastEditTime: 2024-10-25 16:19:55
-->
# 知乎的恶心东西备忘
- 不要再c++ Spawn一个Blueprint Object后立即Call它的BlueprintImplementable,此时这个函数还没加载完成，什么都不会发生。
- Dynamically add Component之后一定要Actor AddInstanceComponent，否则Component过一会儿会被清理
- qeury/collision 就改两个东西
  - MeshComponent->SetCollisionProfileName
  - MeshComponent->SetComplexAsSimpleCollisionEnabled
- bp里的函数调用没执行，可能是target invalid，editor期啥错也不报
- vs编辑器版本与实际使用的toolchain不一定相同，有时会迷惑的选择太老的toolchain，只能删除
- 在继承其他模块的类时仅仅依赖其模块是不够的，还要依赖其继承链上的所有模块，Build.cs里的private/public只考虑访问不考虑继承
- FSceneView.ScreenToWorld将FVector4直接返回为FVector没做投影，纯sbBug