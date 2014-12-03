function hrsig = ANC_persistent(ppg,acc,order,mu)
persistent ha;
  if nargin < 4
      if nargin < 3       
          if nargin < 2
              disp('Not enough arguments for ANC!');
              return;
          else
              order = 32;
          end
      else
          mu = 0.008; % LMS step size.
      end
  end
 if isempty(ha)
    ha = adaptfilt.lms(order,mu);
 end
  [~,hrsig] = filter(ha,ppg,acc);
end
