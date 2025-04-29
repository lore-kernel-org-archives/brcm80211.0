Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681FD84E1C
	for <brcm80211@lists.linux.dev>; Tue, 29 Apr 2025 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914743; cv=none; b=KRR6Ef6iaBY1YEQX+nzNgCAKtn/xFFiS8JEqNWxxMxopUkylhFI0nxJrgt8xnx95wBS/xmZOtMhOTrnZw0UDRP3tx03Ygm5DYQ+ZyTadRGqSCAV09qwzSK6gp2z6Zp6X/9qFCW3vsNLxRkqs4Bn340KXLA+gMhOso97K49pLEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914743; c=relaxed/simple;
	bh=fyeAUEwLUYKSRsuVTgiJXl67h2Z0MGSJEx4fLZd4c/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j39sJi280zdndJdtLvjSRZtDwTXJ8kD2sLKrW4P+iDQe1F+Kag2Y+Z+CeeqLOvJd8+ha+0sDlaCi9QNAWUfdhFvhzpaa2ONLvkpy0Gm5gsQcKKoHXhi8Fkzki/JE+JOhjfAi38Mn/QiWfN2fqOY3IlbS4I/Jg56SbYUsp4K0MmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJTpztpe; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJTpztpe"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso8430807a12.0
        for <brcm80211@lists.linux.dev>; Tue, 29 Apr 2025 01:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745914740; x=1746519540; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WbzJw1Y0dP0F/OzgjAdJU3vqXnQX132JQqwwW18Z+U8=;
        b=MJTpztpeirNVi52ECcL+l+Ka/dzlpehEmA0JDExUu6Jw3sn21izXIVMa0BMeAnNuJy
         mAYtZyOkUZD4IkMqU1PBNDwyCQF4KM3BDwMUbn5SchoajiuJXjuTsruQufdJAHsxEa6D
         JycWHwM3Y9jael9i3VXqiVKqrXP5eUFQrH/swckIWSHLtMwM9MN3NcUyYLghxXLELcSR
         9hePbUvLJIPomDjYjmfQcTYE8j3wOn1MU98KWjMyt42yUNkQc4udPY/dwKH433z2cO+3
         5oFHpibd3UfNmFVrpgRcsyO9ZKR9LEbmrclq6rrFXpWjItKzQAW/1GYZijRWuolHHQ5K
         qnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914740; x=1746519540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbzJw1Y0dP0F/OzgjAdJU3vqXnQX132JQqwwW18Z+U8=;
        b=K/HttobamVpCtehwbG+WG21blnxSwI57tPQ7mFhxxFUlKV25+0e3lwpan1Ttzl7me5
         AjhrkdDQLPVr204diAfjJFLRX5oTZvDyK3LR5sotGe14ZRy1GnhW0D9ysDClskjtRBbI
         eu58nexs5IjJ3v6UvU3R9DyoK3vml9nAeR86DfQ8eBvO1YnJziY/o94MKp1DGueELtzA
         LVJDQZIzZf53Cr7iApvFEyPUkLWCINjdRNfPrKqhA6tABA5J/UkXKKqCnLNxG8EUdxKc
         Bqi0LCzuHqqjE7pheEcZD95AE1WuIMQo9pQeCILoWTUnBouWc+L5Vc+MkRFiVdn93xdK
         1s8A==
X-Forwarded-Encrypted: i=1; AJvYcCVIpDnQiP/9fD4e34wGlnxXG3UfZQZ3eRMEbAiDcS9rSv36H0EJcA/RgF0K1tgDa6+zCIvc4gMyQ5Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YwajPmQ2BGHLi7S0jop54RrlenNiFdRbPoYjFlryrxbw0OpFiur
	0BoKMCOFF1bgmvisC5XSxNAiUdJY0eAzWMvIeTdBFRbpriLXLjOcFTg6lPMbyqv9tuELZuuBx0H
	2X4sQDW877IwCwgMTe+US1SXb0HS3flBL
X-Gm-Gg: ASbGnctDZ5Y7UfHwG3s/C2tBURQmtQlfH12p9zU8YA4hp4IWEQz01utabhdbwxr4Bu9
	Ps9fhDh2AKlaK0v+klq2WNurBq/OojhZjEwzZTqqMSSqZLkFpuTWOOIywCk8CaG+sPHPMwfQPgn
	nVpKmWYWB2jw33Rn+JI1+ng96aUGPStK0h22QcKxRdR298jXOI4NcHcFg=
X-Google-Smtp-Source: AGHT+IETjecjzVnvadBYjwmWixpUnfb/F7xiEGuxsW17ElaZNjEcgdGuUSRHEcq7Si4m5JfkqrurgMcBvTS3eMngTo0=
X-Received: by 2002:a05:6402:3513:b0:5e4:99af:b7c with SMTP id
 4fb4d7f45d1cf-5f83884a96cmr2119205a12.9.1745914739430; Tue, 29 Apr 2025
 01:18:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
 <CALeDE9MGXiSN=8E+T_ZGOLHsk8DB4iL=hV7ircqqb9=q1xTUYw@mail.gmail.com> <1967fbdeea0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <1967fbdeea0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 29 Apr 2025 09:18:47 +0100
X-Gm-Features: ATxdqUEJ0d1PPV6nWd6qlInI1IYFadSUjgxjpfVfwgK-s7SH_A3ESsBFyzAcJC0
Message-ID: <CALeDE9ONCUH0pQ4Yux=30Lim_SZMcbQsnWx0R+aPhF0E7tf9=g@mail.gmail.com>
Subject: Re: [PATCH wireless-next v3 0/4] wifi: brcmfmac: external auth
 support for Infineon devices
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > I will try and find a couple of other devices with an appropriate
> > cypress/infineon.
>
> Thanks for giving the patches a spin. The firmware should have a feature
> named sae_ext. I think the one you with iw are indicating same support in
> general.

I am not so sure.

RPi4 (BCM4345/6 - 7.45.234 (4ca95bb CY) FWID 01-996384e2)
        Supported extended features:
                * [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
                * [ 4WAY_HANDSHAKE_STA_PSK ]: 4-way handshake with PSK
in station mode
                * [ 4WAY_HANDSHAKE_STA_1X ]: 4-way handshake with
802.1X in station mode
                * [ DFS_OFFLOAD ]: DFS offload
                * [ SAE_OFFLOAD ]: SAE offload support
                * [ 4WAY_HANDSHAKE_AP_PSK ]: AP mode PSK offload support
                * [ SAE_OFFLOAD_AP ]: AP mode SAE authentication offload support

Jetson TX1 (BCM4354/1 - fw 7.35.349.104 (775a9ab CY) FWID 01-d55901b0):
        Supported extended features:
                * [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
                * [ DFS_OFFLOAD ]: DFS offload

So I have different brcmfmac HW reporting different features.

> You can check the firmware features in debugfs under
> <mount>/ieee80211/phyX/fwcap.

I don't get fwcap on either of the above devices:

ls /sys/kernel/debug/ieee80211/phy0/
fragmentation_threshold  ht40allow_map  long_retry_limit
rts_threshold  short_retry_limit

Peter

Peter
