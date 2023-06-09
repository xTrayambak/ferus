#[
 Layout images

 This code is licensed undre the MIT license.

 Authors: xTrayambak (xtrayambak at gmail dot com)
]#
import ../renderer/[primitives, render, fontmanager],
       box, node, aabb, element,
       pixie

type LayoutImage* = ref object of LayoutElement

method draw*(layoutImg: LayoutImage, surface: RenderImage, pos: tuple[x, y: float32]) =
 layoutImg.box.aabb.debugDraw(surface)
 layoutImg.renderer.drawImage(layoutImg.primitive.img)

proc newLayoutImage*(image: Image, renderer: Renderer): LayoutImage = 
 let
  prim = newRenderImage(
   image, (w: image.width.float32, h: image.height.float32)
  )
  aabb = newAABB(
   prim.pos.x.int, prim.pos.y.int,
   image.width.int, image.height.int
  )

 LayoutImage(
  renderer: renderer,
  primitive: prim,
  node: newLayoutNode(
   true, false, true, false, ssNone
  ),
  box: newBox(aabb),
  breaksLine: false
 )