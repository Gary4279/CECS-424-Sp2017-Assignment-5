      PROGRAM f5
        INTEGER arrSize
        PRINT *, 'Enter size for array of numbers: '
        READ *, arrSize

        CALL arrNums(arrSize)
      END

* SUBROUTINE to initialize array of desired size, then sort and search
      SUBROUTINE arrNums(arrSize)
        INTEGER arrSize
        INTEGER arrOfNums(arrSize)
        INTEGER i
        INTEGER j
        INTEGER temp
        INTEGER start
        INTEGER finish
        INTEGER mid
        INTEGER range
        INTEGER target


* Filling out the array
        i = 1
        PRINT *, 'Enter elements of array one at a time'
1       IF (i .LE. arrSize) THEN
          READ *, arrOfNums(i)
          PRINT *, 'You entered ', i, ' in the array'
          i = i + 1
          GO TO 1
        ENDIF
        PRINT *, 'Array is filled!'

* Printing out the array
        PRINT *, 'Unsorted array'
        i = 1
2       IF (i .LE. arrSize) THEN
          PRINT *, 'Index ', i, ': ', arrOfNums(i)
          i = i + 1
          GO TO 2
        ENDIF

* Sorting the array
        i = 1
3       IF (i .LE. arrSize) THEN
          j = arrSize
4           IF (j .GE. i + 1) THEN
              IF (arrOfNums(j - 1) .GT. arrOfNums(j)) THEN
                temp = arrOfNums(j - 1)
                arrOfNums(j - 1) = arrOfNums(j)
                arrOfNums(j) = temp
              ENDIF
              j = j - 1
              GO TO 4
            ENDIF
          i  = i + 1
          GO TO 3
        ENDIF

* Printing out the array
        PRINT *, 'Sorted array'
        i = 1
5       IF (i .LE. arrSize) THEN
          PRINT *, 'Index ', i, ': ', arrOfNums(i)
          i = i + 1
          GO TO 5
        ENDIF

* Searching for a number using Binary Search
7       IF (.TRUE.) THEN
          PRINT *, 'Enter number to look for in the array: '
          READ *, target

          start = 1
          finish = arrSize
          range = finish - start
          mid = (start + finish) / 2
6         IF (arrOfNums(mid) .NE. target .AND. range .GT. 0) THEN
            IF(target .GT. arrOfNums(mid)) THEN
              start = mid + 1
            ELSE
              finish = mid - 1
            ENDIF
            range = finish - start
            mid = (start + finish) / 2
            GO TO 6
          ENDIF
          IF (arrOfNums(mid) .NE. target) THEN
            PRINT *, 'Target: ', target, ' is not in the array'
          ELSE
            PRINT *, 'Target at index: ', mid
          ENDIF
          GO TO 7
        ENDIF
      END
