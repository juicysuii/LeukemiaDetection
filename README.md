# LeukemiaDetection

<a name="br1"></a> 

**Détection de Lucémie dans le sang**

<a name="br2"></a> 

**Présentation du sujet :**

La leucémie est un type de cancer du sang qui se

caractérise par une production excessive de cellules

sanguines anormales. Le diagnostic précoce de la

leucémie est essentiel pour un traitement efficace.

Dans le cadre de ce projet, nous avons développé un

système de traitement d'image basé sur l'intelligence

artificielle pour la détection précoce de la leucémie

dans le sang.

**Objectif**

Ce projet ouvre la voie à de nombreuses applications

potentielles dans le domaine médical. En combinant le

traitement d'image et l'intelligence artificielle, il est

possible de développer des outils de diagnostic plus

précis et efficaces pour la détection de la leucémie.

Cela pourrait permettre aux médecins de

diagnostiquer la maladie à un stade précoce, d'initier

un traitement approprié plus tôt et d'améliorer les taux

de survie des patients.



<a name="br3"></a> 

**Etapes**

**Création de dataset**

Imporation de l'image

**Binarisation**



<a name="br4"></a> 

**Segmentation : Thresholding by Color**

**imsplit(x) :** Il divise l'image d'entrée x en ses canaux de couleur. Cela

sépare l'image en canaux L (luminance), a (composante de couleur

verte-rouge) et b (composante de couleur bleu-jaune).

**histogram(b) :** Cela crée un histogramme du canal b, qui représente la

composante de couleur bleu-jaune de l'image. Cela permet de

visualiser la distribution des valeurs de pixels dans ce canal.

**bluemask = b < -30** : Cela crée un masque binaire en seuillant le canal

b. Les pixels ayant des valeurs inférieures à -30 sont définis à 1 (blanc),

représentant les régions de l'image considérées comme "bleues".

**cancer = imoverlay(A\_resized, bluemask\_resized, 'red')** : Cela

superpose le masque binaire bluemask sur l'image redimensionnée

A\_resized. Les régions identifiées comme "bleues" dans le masque sont

recouvertes d'une couleur rouge, les mettant en évidence comme des

zones potentiellement liées au cancer.



<a name="br5"></a> 

**Calcul du pourcentage**

**count = bwconncomp(bluemask);** : Cette ligne calcule les composantes connexes du

masque binaire bluemask. Cela permet de trouver les régions distinctes de pixels blancs

dans le masque.

**num = count.NumObjects**; : Cette ligne récupère le nombre total d'objets (régions)

trouvés dans le masque bluemask. Cela correspond au nombre de régions bleues

distinctes détectées dans l'image.

**count1 = bwconncomp(bin)**; : Cette ligne calcule les composantes connexes du masque

binaire bin. Cependant, la variable bin n'est pas définie dans le code fourni, il est nécessaire

de la définir correctement.

imshow(bin); : Cette ligne affiche l'image binaire bin. Elle est généralement utilisée pour

visualiser le masque binaire résultant.

**numall = count1.NumObjects;** : Cette ligne récupère le nombre total d'objets (régions)

trouvés dans le masque binaire bin. Cela correspond au nombre total de régions dans

l'image, indépendamment de leur couleur ou de leur caractéristique.

percentage = (num / numall) \* 100; : Cette ligne calcule le pourcentage de régions bleues

(num) par rapport au nombre total de régions (numall). Cela permet d'estimer la

proportion de régions bleues par rapport à l'ensemble des régions de l'image.

**disp("Percentage: " + percentage);** : Cette ligne affiche le pourcentage calculé dans la

console MATLAB. Il affiche le texte "Percentage: " suivi de la valeur du pourcentage.



<a name="br6"></a> 

**Stade de cancer**

Pour cela, nous avons utiliser Deep Learning Toolbox où nous

avons utilisé une architecture de réseau de neurones

convolutifs (Convolutional Neural Network - CNN) pour

effectuer la tâche de classification des images de stade de la

leucémie

Cette architecture est couramment utilisée pour la

classification d'images et est adaptée pour apprendre des

représentations visuelles à partir des images fournies. Le

modèle apprendra à détecter les caractéristiques pertinentes

pour la classification de la leucémie à partir des images

d'entraînement et à prédire les étiquettes de classe

correspondantes pour les nouvelles images.



<a name="br7"></a> 



<a name="br8"></a> 

**Vue générale de l'appli**

![image](https://github.com/juicysuii/LeukemiaDetection/assets/104457893/5644da50-6b4d-4bb2-aae3-e4842150d520)

![image](https://github.com/juicysuii/LeukemiaDetection/assets/104457893/bd100402-2c0c-4b30-936d-9aeac574f8a3)


<a name="br9"></a> 

**~~Conclusion~~**

Ce système permet d'automatiser le processus de

détection et de fournir un outil de diagnostic précis et

efficace. Cependant, des études supplémentaires sont

nécessaires pour valider les performances du modèle sur

des ensembles de données plus larges et pour intégrer le

système dans la pratique clinique.

