# Google Interview Question as Seen on Youtube

Youtube Video: https://www.youtube.com/watch?v=rw4s4M3hFfs


```
@blocks = [
     {"gym": false, "school": true, "store": false },
     {"gym": true, "school": false, "store": false },
     {"gym": true, "school": true, "store": false },
     {"gym": false, "school": true, "store": false },
     {"gym": false, "school": true, "store": true }
   ]


@reqs = [:gym, :school, :store]

```

### Question:

Find the block that will minimize the furthest distance that you have to go to reach all of your requirements.


### Solution
Iterate through @blocks. For each block, find the least distance to each of @reqs and put the distances in an array. So now you have a 2D array of distances for each block like:
```
@maximum_distances[0] = [1,0,4]
@maximum_distances[0] = [0, 1, 3]
...
```
 Find the array that has the lowest numbers.
