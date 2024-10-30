Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B819215007
	for <brcm80211@lists.linux.dev>; Wed, 30 Oct 2024 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730309695; cv=none; b=Hq0zkyLTaONCRuA86gx16HfAAxL9yPN6Gz03lBJzGYCmlmp6/Z5r0ipqREfuG2qmzHG4R3RocJOrORCArjQfSVD9GGSmZyhyEHh08jRp55iGXnVtgmd9TxsGyLUB7fQukfQ6v4dsiANSUPUe+S0CDXCSb3okSdCCSpAiXhynSP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730309695; c=relaxed/simple;
	bh=U+3Wgt1if/u0aXBUytY2a+1FtlEk1JoYz05UyPfz/Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PlcBGlzrWqBwhTdooMg9i1XxveOlkWKL90JZNhD1EHDKSQ9YYKpQKj3QF6tdXjdJHyScRz+2tCvPFL+U73pgTyMZ3K7kKfa05voowJDDOy8EQR6kDPkbtUrs+CT+lq723y/ETbqJ6/ZJVVTJGI2wv7EA5tfL+gWrvP5PHEIjMiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGsKF35K; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGsKF35K"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539fe76e802so105424e87.1
        for <brcm80211@lists.linux.dev>; Wed, 30 Oct 2024 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730309691; x=1730914491; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Juisjn4hdg5t7CbimbozNWZ7Zs4lqTjFGMYg1J1CssY=;
        b=gGsKF35KwDpily6cevojZ/GnROtaIcRhoVvOBSV+CRalC7hNWDbsGIL2WAqbS6xkCP
         c8pqE48HJGsQ0OqQtGNC0f79/GO+6sBIbHEjC4oHcCEri8H9kSraheJ5VgOuqdpre3k3
         EKEtMGttGS4ZdU/agE2ch6OCTCCCOGZZj7clfKunBLYRKCR6siQ8g/SpaNo3kjZOIDB4
         KT7JlNCogy3uHoVrDvQaXtDqWzkzwI3REHzrhm9zzPHQJkxA7ZWRG3aMHFdzapzs3arq
         tZRHuo4pG4KlF+8B6Ie9T3lGQHHi4mdllLtu8ovjHt54H5OYY24EjgM+IwVb0AOaB5sO
         /HfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730309691; x=1730914491;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Juisjn4hdg5t7CbimbozNWZ7Zs4lqTjFGMYg1J1CssY=;
        b=fD6GqxcHeT/fEchs3ZQ1zrllI2HIyIIciY8VRDIKmElZ+5AyEeOpjss4Z0jeivDp8n
         KgK1Z4R3/+7ViM0A1x06MOU9aKiUsJyzTdPwayLg9vtttVGlB1XSf/clvN3yNRM+175F
         xtVN0o1u6yniDu5WEQKzm0R0Yu7lYBSBxkbyhGyU4FyASdR0XfdSML26kEuop+4dHhDx
         c/TwXRABe/Iw+b0GMACK4UCz+esLi+ITa7Zxej8yZ1T/yO4k7h+/75laWxOC9mGAi+Uh
         s6F9BYdmc5D1d9Q5bPsxz4kKrOHAdDGBpM4B9+22MDsy9dmLwElAWzd7hFqW4RAsBPvE
         +eSw==
X-Forwarded-Encrypted: i=1; AJvYcCUIYzgIIWcYbhm4sWCxSlOCed1Q3ZA+7yGMMLqKOCHoNx/hCk3/zW7+x2sMbf4PjD54Zgtwbmm+RPE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7rav153Uvndh1M1X2vxp5Uj0I74/G5+7ztMGwLtlc2+TxhChU
	MBRBnEw8Nc60+1IfUZog1sspE8XIEqbOdiCdsJyYTWcA5rbMHFAo
X-Google-Smtp-Source: AGHT+IGZkiA4a/Ypkf0OY1ZbPq+XcHKy5We3bZ+vHCVaMRhq7cotMHd1H8WYoRYbeNygdCs1IVPxSA==
X-Received: by 2002:a05:6512:68f:b0:539:dca9:19cc with SMTP id 2adb3069b0e04-53b348c1719mr8674104e87.4.1730309691216;
        Wed, 30 Oct 2024 10:34:51 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-fbf3-0656-23c1-5ba1.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:fbf3:656:23c1:5ba1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9cab13sm27566765e9.48.2024.10.30.10.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:34:50 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 30 Oct 2024 18:34:45 +0100
Subject: [PATCH net] wifi: brcmfmac: release 'root' node in all execution
 paths
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-brcmfmac-of-cleanup-v1-1-0b90eefb4279@gmail.com>
X-B4-Tracking: v=1; b=H4sIADRuImcC/x3MQQqDMBBA0avIrB2YpF3YXkVcxDjTDjSJJCqF4
 N0NLt/i/wqFs3KBd1ch86FFU2wwfQf+6+KHUZdmsGSfhh6Ec/ZBgvOYBP2PXdxXJCLh1zBYswi
 0cs0s+r+vI0TeYDrPC/mzUEJqAAAA
To: Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Kalle Valo <kvalo@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730309689; l=1632;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=U+3Wgt1if/u0aXBUytY2a+1FtlEk1JoYz05UyPfz/Y4=;
 b=K24pC7iwnYW7V7S9srCCEP2xQc23aicQ1kjH6fe/uHGFY3ar++CWb5cVFD6U2FL03WZxNUdIv
 8hVzg37hf2iAMROCaETj6izTXZqXmrBSoQZVto/T+sWumcuFgCIQpnS
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The fixed patch introduced an additional condition to enter the scope
where the 'root' device_node is released (!settings->board_type,
currently 'err'), which avoid decrementing the refcount with a call to
of_node_put() if that second condition is not satisfied.

Move the call to of_node_put() to the point where 'root' is no longer
required to avoid leaking the resource if err is not zero.

Cc: stable@vger.kernel.org
Fixes: 7682de8b3351 ("wifi: brcmfmac: of: Fetch Apple properties")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Note that a call to of_node_put() on a NULL device_node has no effect,
which simplifies this patch as there is no need to refactor the or
add more conditions.
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index fe4f65756105..af930e34c21f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -110,9 +110,8 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 		}
 		strreplace(board_type, '/', '-');
 		settings->board_type = board_type;
-
-		of_node_put(root);
 	}
+	of_node_put(root);
 
 	if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
 		return;

---
base-commit: c05c62850a8f035a267151dd86ea3daf887e28b8
change-id: 20241030-brcmfmac-of-cleanup-000fe98821df

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

