Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793550538;
	b=qXr21p5xeeHMDLD0LQJZYgn9TcBJ0lBCNHI+k1CPXjPS6+FWwVcNhjUbLOOLZeLv+T7e
	 N2mg4mcAp74ItDmLxfK5S0U1cjmhT3Zvi9dMS2Gk6YB7IewOYZWMo+hbBfSW4LgNjTr04
	 lzqEE29QF/XZXOEoQ8w3q2xLR2bnSujZxxktOS5NjMSjGGZr3bJ2lkQ1a8h6ZSemAte/E
	 yi9sR6+VsgsfoJ7sG173/6bz9WlVhsyX5Omr6OK1R8MHK1ZMHKqlUCl6zSDac8IPZ2lgo
	 GnEq6zvCSgedVVhtOGxU7O2lEtfxBoUB4572wSX4dSZvBrCZB8ELAB0t1KcoLsfjkNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793550538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2JLpxCeKgZysAKba9RBz4wH5E04iZ2pCGsqB3gTXKkE=;
	b=gtSUK45+VMFd/8xedl+2qMS1MYqGRbsC19f/29/lvPoxn34JuAyrKnIEZkrdz4QmPyEr
	 Cc6t+bhQJ8s/LlZnuV2M4bnvEG6lWJmAIEsJaRFU9SKnUu3JaMFWarOW98tQZ06vHFcoE
	 /YC4cuNu4972OEHxZIB9WweueXsyp3iKy+6lTkI3hy66hsDw4P/vcjtgmToUvWknEAKkp
	 ZlBxTJ8//lqqFzBbe6SHoppH94vb8JB5g+M9wAbD7Utk493MixK+TvafAHNnE9yCSN73h
	 XOy/2rG6AeIMNEV5yfX5YQV6FkI58+rLQk8GZJD6ra35k98EHDehuXHckDjHbsjAxMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vb7Q8aES;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC16A606A324
	for <brcm80211@lists.linux.dev>; Sun,  1 Nov 2026 16:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC16A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vb7Q8aES
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99075306daaso1451610241.3
        for <brcm80211@lists.linux.dev>; Sun, 01 Nov 2026 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793550536; x=1794155336; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JLpxCeKgZysAKba9RBz4wH5E04iZ2pCGsqB3gTXKkE=;
        b=Vb7Q8aESwPtoOUYl6LCRyw4XzTnPaU2q072nOl8AiVjU5/XlSkEtVTiWrvR8DaZrvZ
         rO4DLoGKM/7cwegqFRRUR7dPjD2dtA5QYw8sAuEE7l3NRRzCy0g4xPD3Zg4tC9o2UWH1
         8IHJNu09VsRGtoKOyBUsvKvRqIN6f1crxxDKfJbVFJwsMg4utU9B4Yk7IB/ODQ3qXLBh
         gGMQUDXQa//hpnKt5CXD3Q1IQngM4wfzLrhuvH/IficN6TPBgEJkMDuRspZuN6VumtuN
         KwD489nOTTcH4EFlS6tw9fPpAMJLIX5c9qFQRt96u6R/PoLvdP96DJVihi93VTW/IvEs
         NLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550536; x=1794155336;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JLpxCeKgZysAKba9RBz4wH5E04iZ2pCGsqB3gTXKkE=;
        b=R1IW8GeJeOHLJI5Dbh333WdRnE0ysHCEakARniZDnQwIpFN536ftvpSKJMDTejGUgy
         Js5cgCIXLf0KP80xVU9UT4as0XTmvqPkqkW/z6HE0gP8omExu1pGvuxyOxzzEcWLs+ap
         3tos0k/Ok4wEKn4eeLmWc+njxtDUAqp/rmBIWgNkJLhbIDQ1VdCiKKZqaguH//I2BLBF
         /wZSw3p1lUNK+H8WIpP+dkkXEsr9pMP/TGi1oZ+slENNHowyaISIYsDQqkXwTvY2S9Uq
         sxU39q+V3xdAWcFdPcGg8AH2T9BtnWycOzz3py1aNNDhxueJWr0Rrn7DTCdRqH7QagW7
         +1AQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9cEeTQX2cWH7sCOj9tzA90fEmOPrB1TYANLGQKtcc7cHiFzh2oPfG8TDjAvTir6H2Z45fAsyQWEM=@lists.linux.dev
X-Gm-Message-State: AFq9FYKAy8WdyVXPd0+H/dZIicQ8Ru/xUpraOL++U4SK6mLtUKft/5k4
	Ei0w9/QMDos0vlbLh1LMLgrL2V3JRio0TjCuGdfdlTYOzM7yZV8vua68
X-Gm-Gg: AYBFou1PLuekk312g4wOhZ/QjAusVWlPkCVe88BiIqPRYxm2yUV30NG2GZ2Akr1h5m7
	d572fXZ72rIIoBB0B+OCGwQH9Hoa3lE5hXyJGQxQtuhdopFpO9aduZdzVKBc/TzhM7F/uHcYaoM
	Q/fK9HYkEi0LSwbO7b59PbL0KoB+kXbmogkCLnX5huj4iTpbwKmrXRmn/zvrENHHx0VMntipt1J
	qluKNc4YqLO+seO/0PNcv8VMtY0psp3QBMlj1XuJhVyMhTI9pIavG/hWVxxdB0AedA7FHbA/Kqg
	hDthCQtpyqTbxovzhcuuDUbmOOp4jowvyN8T9VaDbERJkWZI7R9dWvpmxFpoST3P0lsLBZ24eAu
	5SBWnlgY5JchfLM+sXuUOlAymyyfalaYmrBEW5/A+BQnEXzPfogCMx+9D3jDgQM6O8knfTynkTg
	KIeNytfeaHQ9sEUL6nVc60MJJxD7wRn8vzOhAUWOBJhuUPaRZ468QR1+Y4p2CxTPRXPdNPRTn9j
	kEnD1w1ibilIre6GcDlcWGRgf10JhXmL0CV9pCtbVJVM57iHlIYDDg+2m5KTRXV0Bfno3UVrSnQ
	1X4Xaj75DB1JQYNyC2Jt438Floae/DK8S0xQy/BXHZcjErPLZ/Fvo2eZRByg3pQfG2x0s9aXxCJ
	WyituxsZrSfLYQriNdvlr6n+S1v72AOE=
X-Received: by 2002:a05:6102:290c:b0:7a8:10eb:96ce with SMTP id ada2fe7eead31-7d07277c1d1mr3201168137.4.1793550536617;
        Sun, 01 Nov 2026 08:28:56 -0800 (PST)
Received: from lore-tested-by-FINAL.eml ([2800:355:4:6e7:ef84:d89e:9472:15a1])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee1d2d98sm9762970241.2.2026.11.01.08.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:28:56 -0800 (PST)
From: Angel Lindo <angellindo@gmail.com>
To: Sergey Armodin <dolph-in@yandex.ru>
Cc: arend.vanspriel@broadcom.com, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: pcie: restore FEM control pin mode on Apple BCM43602
In-Reply-To: <20261023143003.1307752-1-dolph-in@yandex.ru>
References: <20261023143003.1307752-1-dolph-in@yandex.ru>
Date: Sun, 01 Nov 2026 11:28:54 -0500
Message-ID: <179355041987.15175.6295443283645120622@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Oct 23, 2026, Sergey Armodin wrote:
> restore FEM control pin mode on Apple BCM43602

I see the same failure on a MacBookPro14,3 (BCM43602 14e4:43ba,
subsystem 106b:0173, firmware 7.35.177.61), kernel 7.2.8 (Omarchy).

Without the patch, chipcontrol (ChipCommon+0x28) reads 0x01400010
after boot and 0x01000000 after S3: bit 4 is cleared, 5 GHz
association fails with status 16, and 2.4 GHz still works.

I applied v2 to brcmfmac and built it as an out-of-tree DKMS module.
That tree also carries two local patches of ours (one keeps the card
in D0 across suspend on this subsystem ID; one is in cfg80211.c), so
it is not a clean upstream build.

With the patch, 5 S3 (deep) cycles, from 3 min to ~2 h 41 min, on
battery and on AC: 5 GHz reassociated in 2-5 s with no status 16.
Bit 4 stayed set after every resume (chipcontrol 0x01000010).
After a cold boot with the patched module the register read
0x01400010 and 5 GHz associated normally.

Tested-by: Angel Lindo <angellindo@gmail.com>
