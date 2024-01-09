function B = boundary(binary_image)

    %find a 1 value to start with
    [row,col] = find(binary_image==1); 
    r = row(1); c = col(1);

    %finding 1 with no zero at the bottom.
    %(because we have assumed 1 with no zero at bottom as starting point)
    %this assumption will help our pixels with clockwise motion.
    while binary_image(r+1,c)==1 
        r=r+1;
    end
    starting_point = [r c];

     %flag to check completion of algorithm
    boundary_complete = false;

     %array to store all boundary points
    inner_boundary = starting_point;

    %how columns change when rotating- clockwise around a cell,
    %starting from the bottom.
    clockwise_col = [0 -1 -1 -1 0 1 1 1];

    %same for rows
    clockwise_row = [1 1 0 -1 -1 -1 0 1]; 

    %this array maps from where should a new cell start its clockwise
    %rotation, since when we find another inner boundary cell and point to
    %it as our current pixel, it should be connected to the previous pixel
    %and start its clockwise motion from that point. this array helps it
    %implement that.
    point_finder = [5 6 7 8 1 2 3 4];

    %point is 1 i.e bottom for the initial cell because it is zero at the
    %bottom.
    point = 1;
    while boundary_complete==false

        %where to start its clockwise motion
        index=point;

        %for loop is hardcoded 8 iterations because no matter from where we
        %start, the loop can run a maximum of 8 times.
        for jj=1:8

            %checking if cell is 1
            if binary_image(r+clockwise_row(index),c+clockwise_col(index))==1

                %moving to that cell as our current pixel
                r=r+clockwise_row(index);c=c+clockwise_col(index);

                %stopping criterion #1 implemented
                if [r c]==starting_point
                    boundary_complete = true;
                end

                %storing all boundary coordinates
                inner_boundary = [inner_boundary; r c];
                check = index+1;
                if index+1>8
                    check=1;
                end
                point=point_finder(check);
                break
            end
            
            %mapping index around
            index=index+1;
            if index>8
                index=1;
            end
        end
    end
    B = inner_boundary;
end
