# Perlin Noise Generator on Processing
Perlin Noise Generator with seeds on Processing.

## Seeds and Trees
On the same seed trees locations and textures will be the same. 

### How to change seeds? 
Change "seed" variable to your value (sb.pde).
```Processing
int seed = seedGen(100, 1000);
```
To:
```Processing
int seed = 999; //for example
```

### How to add trees? 
Add tree texture to the "tree_txr" folder. Then add some strings of code(sb.pde).

- Add "PImage":
```Processing
//Original code
PImage oak;
PImage sakura;
//Example code
PImage dark_oak;
```
- Change this string:
```Processing 
tree_type = (int) random(0, num); 
```
Change "num" to number of your tree.

- Add cases to switch:
```Processing 
switch (tree_type) {
//Original code
  case 0:
    image(oak, wn, hn, treeh, treeh);
    break;
  case 1:
    image(sakura, wn, hn, treeh,treeh);
    break;
//Example code
  case 2:
    image(dark_oak, wn, hn, treeh, treeh);
    break;
}
```