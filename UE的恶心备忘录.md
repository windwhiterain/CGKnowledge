<!--
 * @author: whitingyan
 * @LastEditors: whitingyan
 * @Copyright: 2021 Tencent Inc. All rights reserved.
 * @Date: 2024-10-22 20:59:28
 * @LastEditTime: 2024-10-22 21:05:02
-->
# 知乎的恶心东西备忘
- 不要再c++ Spawn一个Blueprint Object后立即Call它的BlueprintImplementable,此时这个函数还没加载完成，什么都不会发生。
- Dynamically add Component之后一定要Actor AddInstanceComponent，否则Component过一会儿会被清理