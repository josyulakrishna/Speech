# Speech Recognition for isolated words using Matlab and Kevin Murphy's HMM Toolbox
This solution works for the isolated speech recognition with a sufficient training database, in this case 10 utterances of a single word are taken as a training database to construct the model. 

Construction of the HMM:
Each word has its own HMM with 3 states(which can be set inside the file constructHMM), the model is then trained using the Baum-Welch Algorithm, maximising the output likelihood of the model given the speech MFCC vectors. 

Flow of the Program: 

Preprocessing --> MFCC| --> GMM --> HMM --> Train.|


GMM is initalized with 3 mixtures for each state. 
