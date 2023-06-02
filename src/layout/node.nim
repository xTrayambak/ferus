#[
  Basic layout node

  This code is licensed under the MIT license
  
  Authors: xTrayambak (xtrayambak at gmail dot com) 
]#
import ../dom/dom, boxmodelmetrics

type
  SelectionState* = enum
    ssNone
    ssStart
    ssEnd
    ssStartAndEnd
    ssFull

  LayoutNode* = ref object of RootObj
    dom*: DOM

    generated*: bool
    anonymous*: bool
    visible*: bool
    childrenAreInline*: bool
    selectionState*: SelectionState

  LayoutNodeWithBoxModelMetrics* = ref object of LayoutNode
    boxModelMetrics*: BoxModelMetrics

proc newLayoutNode*(dom: DOM, 
                    generated, anonymous, visible, childrenAreInline: bool,
                    selectionState: SelectionState
                   ): bool {.inline.} =
  LayoutNode(dom: dom, generated: generated, visible: visible, 
             childrenAreInline: childrenAreInline, 
             selectionState: selectionState)

proc newLayoutNodeWithBoxModelMetrics*(dom: DOM, 
                                       generated, anonymous, visible, 
                                       childrenAreInline: bool, selectionState: SelectionState,
                                       boxModelMetrics: BoxModelMetrics
                                      ): LayoutNodeWithBoxModelMetrics {.inline.} =
  LayoutNodeWithBoxModelMetrics(dom: dom, generated: generated, 
                                anonymous: anonymous, 
                                childrenAreInline: childrenAreInline, 
                                selectionState: selectionState, 
                                boxModelMetrics: boxModelMetrics)
