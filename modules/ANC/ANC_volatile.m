function hrsig = ANC_volatile(ppg,acc,order,mu)

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
       
  ha = adaptfilt.lms(order,mu);
  [~,hrsig] = filter(ha,ppg,acc);
end
