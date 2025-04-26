import numpy as np
import scipy.io as sio
from sklearn.metrics import adjusted_rand_score
from sklearn.cluster import KMeans
from brainspace.gradient import GradientMaps
from sklearn.metrics.pairwise import cosine_similarity

results=sio.loadmat('f_nets.mat')
labels=sio.loadmat('label.mat')
neurotransmitter=results['net_neurotransmitter']
cluster_n = 7
n_components=3
labels = labels.ravel()
affinity = cosine_similarity(neurotransmitter)
gm = GradientMaps(n_components=10, approach='dm', kernel='normalized_angle', random_state=88)
gm.fit(affinity)
gradients = gm.gradients_  # shape: [n_nodes, n_components]
lambda_all = sum(gm.lambdas_[:n_components])/sum(gm.lambdas_)
X_embed = gradients[:, :n_components]
kmeans = KMeans(n_clusters=cluster_n, random_state=0).fit(X_embed)
y_cluster = kmeans.labels_
ari = adjusted_rand_score(labels, y_cluster)
null_ari = np.zeros(1000)
null_ca = np.zeros(1000)
for i in range(1000):
    y_perm = np.random.permutation(labels)
    null_ari[i]=adjusted_rand_score(y_perm, y_cluster)

ari_p = (np.sum(null_ari >= ari + 1)) / (1000 + 1)

