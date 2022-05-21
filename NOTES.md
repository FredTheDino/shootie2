Change the priority of `>=` and `and`.
```
typecheck error: gamestate.sy:40
      < is not defined for 'bool' and 'bool'
  38 |
  39 | held :: pu x, frame, diff -> bool
  40 |     is_down(x) and get_frame(x) + diff >= frame
```
