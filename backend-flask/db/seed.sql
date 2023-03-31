-- this file was manually created
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Eyob Berhe','eyob@ymail.com' , 'eyobberhe' ,'0f5b4b90-26d9-42c0-9de3-37b0b8d324c1'),
  ('Eyob Tesfay','eberhe800@gmail.com' , 'tesfay' ,'18c3e3e7-43e9-4a66-9c47-1b634b4fd63c'),
  ('Hiryakos Tesfay', 'hiryakos@gmail.com','hiryakos','b07179ba-f677-417c-a9bd-3191c3962059');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'eyobberhe' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )