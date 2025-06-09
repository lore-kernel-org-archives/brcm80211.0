Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AC3155A25
	for <brcm80211@lists.linux.dev>; Mon,  9 Jun 2025 19:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749498165; cv=none; b=XqCrfUGYAZWm4BUudnmuqgVFH+WpEG6zEGoKDUasFhdqPZ2A+exR9zqkv56hW+rT3y4v7fNG8SKujx3/RftTIYjP6smW7ECc8bHlLriwUAvzdn1P+d2tfThbANQA0otApCTEYIm989dpl/OG6HFdHY3UHRg6KgduPsm3qrajisI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749498165; c=relaxed/simple;
	bh=A5qZejXgYhDbWfxjhrhDV+dglLLl8N+6OuuSx3j8hho=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ke0SEzJxOuro4eRGiIezUjL5a33rDaFNjqyPZvhsdA4GKYZ1h4VlwuScXC9tqzO74gq4jcITjRrK9+cLIY0Q5IzJhtcXryZPaItgz6B+rV7hpjX5v1goC+Vl8wmeKSYakFoyW68HbHdDBDax+aOnWPGNBmnoCG70/fiV0V0w9oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhLBbxtH; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhLBbxtH"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7db5c13088so3700835276.1
        for <brcm80211@lists.linux.dev>; Mon, 09 Jun 2025 12:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749498163; x=1750102963; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zf0suIXK7l9tUj4sDwSEuq16I7VSWcqaNo380WkrMA=;
        b=nhLBbxtHSTNunQPxtLS8FBFXipwPBZ8RTW/qHVVDGCOUVwjw88k8QNCqWRO4JY7wks
         1oghUjdAKjKjdpcXkTPG5gSTGPTt4mgyB/CYCJXKNxGkd/OxTwSaKIOp8KXV4XOFhrbt
         zCUqiOwzawSyIK6mMgCQaqgCw1wS/P9DPUsWh8Wl/9lVjtATriJ3x6po01aFxMi5lHS4
         JwLVnxLYQGibIiNmvDijJZV1NYficZALf05sIWD0oBE6e9jGlNbT5NYyu9FLKrlCJQW1
         xjWFjt3b/VvkLqfv5q/Y49IuHnN0wlZ8Onm1pdF03BIcrgyXZ+JL+0xnAl5s11MAMr+w
         Hrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749498163; x=1750102963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Zf0suIXK7l9tUj4sDwSEuq16I7VSWcqaNo380WkrMA=;
        b=eQUfFbyG6VxC8GPK8mKHJMCSu9I/tatRFIDNdNhKuykHIKRSerWlcnThkxjzCmr79X
         ic4eL3lYdT+OljPcM3CMjSI29wSUuqnXxemlttX8OMjvFEyYpPrawTKPH4y7kmGYteJC
         4Ls+Us8wd/m7wkJwmLA7eWZdVY1Qncsm6FFfxdoSLFjWpgGgRMPAX7on5RbhQr9HV9ta
         SLS8pW7BHQl9rz2Gh7OstKLPAIQi1ltPoqO5HfgDh3p/LydAZg44WYfZk/LgVn4t5PNk
         XG3FhvlBX/EPgpvQa+jmJcWK3gV2Dlz3tJoU+708RGsmne+/zcdYAIdccvYzlaxgqFfB
         eUTg==
X-Gm-Message-State: AOJu0Yz07NZBunaszusdiDDzE8CJ1QOHAUmZRe7jLruG/yIrThb36GhB
	TeaY6CPG7vvkCBLbgLWVMEu3SErlvxwD4F0fRQq38hWu3OT3yPcU22WYGktq870M3sOVXJW6sqf
	BMIZA3gPPGq+1pMIiDqPBKrE2PoVriGKmBDek8Yw=
X-Gm-Gg: ASbGncvASV81XQTUOwiVvKZWXNc1Dv65bmMDL5a70E7XcUEPL+2qy9Xz0rFcIb9frQX
	DB8pG+So0IYxoo9jHjwLKWxWCe8YLlTiZHGax/WVKehz9em57Uy0xAqq5Tv1nzt0uiAies1zZwW
	juWbl5HlXxbPe87Q3GMKItB5Jk76mSTe/s9Wg=
X-Google-Smtp-Source: AGHT+IGiPRCBM71VlQZOqTkUdEvQLPtmrUYm9pvIz+jXqH+F6YtTl/PJKJkt0Yyz/XT6RBuIerdS2+/IBq7VCwvYPo8=
X-Received: by 2002:a05:6902:1682:b0:e7d:7963:941 with SMTP id
 3f1490d57ef6-e81f07b27bamr1310375276.16.1749498162877; Mon, 09 Jun 2025
 12:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: KeithG <ys3al35l@gmail.com>
Date: Mon, 9 Jun 2025 14:42:32 -0500
X-Gm-Features: AX0GCFsFLqM9dk08aKYpOa2H33M-oI2qV2wz2gFfGA6FutHHd1sklEtKD6O6Xwo
Message-ID: <CAG17S_P0WmE4o3wCbi4Pq0j28C-HUZHwGJXzurTME4TsgYLQOQ@mail.gmail.com>
Subject: wpa_supplicant floods the log with scan error
To: brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am using wpa_supplicant on RPiOS with the laterst kerenel 6.12.x
I have wpa_supplicant set up systemd service 'wpa_supplicnat@wlan0'
and use wpa_cli to manage the known networks. I use systemd-networkd
to manage DHCP and such. When the RPi is not connected to a wireless
SSID, I get tons of this in the log:
Jun 09 14:29:56 rpi wpa_supplicant[420]: wlan0: Failed to initiate sched sc=
an
Jun 09 14:30:03 rpi wpa_supplicant[420]: wlan0: Failed to initiate sched sc=
an
Jun 09 14:30:10 rpi wpa_supplicant[420]: wlan0: Failed to initiate sched sc=
an
Jun 09 14:30:16 rpi wpa_supplicant[420]: wlan0: Failed to initiate sched sc=
an
Jun 09 14:30:22 rpi wpa_supplicant[420]: wlan0: Failed to initiate sched sc=
an
Jun 09 14:30:29 rpi wpa_supplicant[420]: wlan0: Failed to initiate sched sc=
an
Jun 09 14:30:35 rpi wpa_supplicant[420]: wlan0: Failed to initiate sched sc=
an
Jun 09 14:30:41 rpi wpa_supplicant[420]: wlan0: Failed to initiate sched sc=
an
Jun 09 14:30:47 rpi wpa_supplicant[420]: wlan0: Failed to initiate sched sc=
an

It repeats about every 6 seconds. I know it is scanning, because when
my known SSID reappears, it connects, so it *is* scanning.

My wpa_supplicant@wlan0 config has not much in it:

# cat /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
ctrl_interface=3D/run/wpa_supplicant
update_config=3D1

network=3D{
        ssid=3D"KnownSSID"
        psk=3D"password"
        mesh_fwding=3D1
}

the service is using the default, debian 'wpa_supplicant@.service'
that comes with RPiOS and uses my config shown above.# systemctl
status wpa_supplicant@wlan0.service
=E2=97=8F wpa_supplicant@wlan0.service - WPA supplicant daemon
(interface-specific version)
     Loaded: loaded (/lib/systemd/system/wpa_supplicant@.service;
enabled; preset: enabled)
     Active: active (running) since Mon 2025-06-09 11:24:42 CDT; 3h 6min ag=
o
   Main PID: 420 (wpa_supplicant)
      Tasks: 1 (limit: 1654)
        CPU: 6.727s
     CGroup: /system.slice/system-wpa_supplicant.slice/wpa_supplicant@wlan0=
.service
             =E2=94=94=E2=94=80420 /sbin/wpa_supplicant
-c/etc/wpa_supplicant/wpa_supplicant-wlan0.conf -iwlan0

the base wpa_supplicant.service is not running.

I have this in my brcmfmac.conf under /etc/modprobe.d/

options brcmfmac feature_disable=3D0x200000

Is there something I can do to keep this from flooding the log?

Keith
