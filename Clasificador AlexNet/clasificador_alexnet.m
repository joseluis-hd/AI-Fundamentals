nnet = alexnet;
layers = nnet.Layers;

layers(23) = fullyConnectedLayer(5); 
layers(25) = classificationLayer;

allImages = imageDatastore('folder', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
allImages.ReadFcn = @(loc) imresize(imread(loc), [227, 227]);

[trainingImages, testImages] = splitEachLabel(allImages, 0.8, 'randomize');

opts = trainingOptions('sgdm', 'InitialLearnRate', 0.001, 'MaxEpochs', 20, 'MiniBatchSize', 64);
myNet = trainNetwork(trainingImages, layers, opts);

predictedLabels = classify(myNet, testImages);
accuracy = mean(predictedLabels == testImages.Labels);

allImages = imageDatastore('imagenes_test', 'IncludeSubfolders', true);
allImages.ReadFcn = @(loc) imresize(imread(loc), [227, 227]);

figure;
for image_index = 1:21
    picture = readimage(allImages, image_index);
    label = classify(myNet, picture);
    
    
    cla; 
    imshow(picture);  
    title(char(label));  
    
    
    if strcmp(char(label), 'ceda el paso')
        respuestaCorrecta = false;
        while ~respuestaCorrecta
            choice = questdlg('¿Qué debes hacer ante una señal de "Ceda el paso"?', ...
                              'Curso de manejo', ...
                              'Reducir velocidad y ceder el paso', 'Seguir a la misma velocidad', 'Detenerse completamente', 'Reducir velocidad y ceder el paso');
            if strcmp(choice, 'Reducir velocidad y ceder el paso')
                msgbox('¡Correcto! Recuerda ceder el paso a los vehículos que se aproximan.');
                respuestaCorrecta = true;
            else
                msgbox('Respuesta incorrecta. Inténtalo nuevamente.');
            end
        end
    elseif strcmp(char(label), 'alto')
        respuestaCorrecta = false;
        while ~respuestaCorrecta
            choice = questdlg('¿Qué debes hacer ante una señal de "Alto"?', ...
                              'Curso de manejo', ...
                              'Detenerse completamente', 'Reducir la velocidad', 'Seguir si no hay tráfico', 'Detenerse completamente');
            if strcmp(choice, 'Detenerse completamente')
                msgbox('¡Correcto! Debes detener el vehículo completamente antes de avanzar.');
                respuestaCorrecta = true;
            else
                msgbox('Respuesta incorrecta. Inténtalo nuevamente.');
            end
        end
    elseif strcmp(char(label), 'curva')
        respuestaCorrecta = false;
        while ~respuestaCorrecta
            choice = questdlg('¿Qué debes hacer ante una señal de "Curva"?', ...
                              'Curso de manejo', ...
                              'Reducir la velocidad', 'Aumentar la velocidad', 'Seguir recto', 'Reducir la velocidad');
            if strcmp(choice, 'Reducir la velocidad')
                msgbox('¡Correcto! Reduce la velocidad y sigue la curva con precaución.');
                respuestaCorrecta = true;
            else
                msgbox('Respuesta incorrecta. Inténtalo nuevamente.');
            end
        end
    elseif strcmp(char(label), 'cruce de peatones')
        respuestaCorrecta = false;
        while ~respuestaCorrecta
            choice = questdlg('¿Qué debes hacer ante un "Cruce de peatones"?', ...
                              'Curso de manejo', ...
                              'Detenerse y ceder el paso a los peatones', 'Tocar el claxon', 'Aumentar la velocidad', 'Detenerse y ceder el paso a los peatones');
            if strcmp(choice, 'Detenerse y ceder el paso a los peatones')
                msgbox('¡Correcto! Asegúrate de detenerte y ceder el paso a los peatones.');
                respuestaCorrecta = true;
            else
                msgbox('Respuesta incorrecta. Inténtalo nuevamente.');
            end
        end
    elseif strcmp(char(label), 'limite de velocidad')
        respuestaCorrecta = false;
        while ~respuestaCorrecta
            choice = questdlg('¿Qué debes hacer ante una señal de "Límite de velocidad"?', ...
                              'Curso de manejo', ...
                              'Ajustar tu velocidad al límite indicado', 'Superar el límite si es seguro', 'Reducir más allá del límite', 'Ajustar tu velocidad al límite indicado');
            if strcmp(choice, 'Ajustar tu velocidad al límite indicado')
                msgbox('¡Correcto! Ajusta tu velocidad de acuerdo al límite indicado.');
                respuestaCorrecta = true;
            else
                msgbox('Respuesta incorrecta. Inténtalo nuevamente.');
            end
        end
    end
    
    pause(3);
end
