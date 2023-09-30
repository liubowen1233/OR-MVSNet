import open3d as o3d
pcd = o3d.io.read_point_cloud('UR_1/scan110/points_mvsnet/consistencyCheck-20220510-213748/final3d_model.ply')
o3d.visualization.draw_geometries([pcd])