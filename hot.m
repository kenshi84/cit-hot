function hot(data_dir)

% Read meshes
[A_V, A_F] = readOBJ(data_dir + "A-orig.obj");
[B_V, B_F] = readOBJ(data_dir + "B-orig.obj");

% Read landmarks
landmarks_str = fileread(data_dir + "landmarks.txt");
landmarks_str = strsplit(landmarks_str, ',');

num_landmarks = length(landmarks_str);

A_landmarks = zeros(1, num_landmarks);
B_landmarks = zeros(1, num_landmarks);

for i= 1:num_landmarks
    landmark_str = landmarks_str{i};
    landmark_str = strsplit(landmark_str, '/');
    A_landmarks(i) = str2num(landmark_str{1});
    B_landmarks(i) = str2num(landmark_str{2});
end

% Convert indices to one-based
A_landmarks = A_landmarks + 1;
B_landmarks = B_landmarks + 1;

% Run the algorithm
init

A_embedder = Flattener(A_V, A_F, A_landmarks);
B_embedder = Flattener(B_V, B_F, B_landmarks);

mapper = Mapper({A_embedder, B_embedder});

mapper.computeMap();

mapper.lift(2, 1);
BtoA = mapper.map.barCoords{1, 2};

mapper.lift(1, 2);
AtoB = mapper.map.barCoords{2, 1};

% Write resulting vertex images
write_sparse_matrix(BtoA, data_dir + "BtoA.txt");
write_sparse_matrix(AtoB, data_dir + "AtoB.txt");

% Write deformed meshes
BonA = BtoA * A_V;
AonB = AtoB * B_V;
writeOBJ(data_dir + "AonB.obj", AonB, A_F);
writeOBJ(data_dir + "BonA.obj", BonA, B_F);

end
