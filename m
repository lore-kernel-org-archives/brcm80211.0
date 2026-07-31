Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D003418A36
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501338; cv=none; b=cSr8o4uE4lAd9SIyRyH8CNsfB7Juy91L25RQ5a/EiBPXS5gjokQhvCtJxYx7PZDHsVID9M2TDF3HCo4qWl20ygoh5IYAUb36Kpycgb16lUVha77bzBqYpFZSpuexYS+4/KdsLUHJc+KGo44KlWpskMqiVPLMFkxgoGnP+yjblmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501338; c=relaxed/simple;
	bh=wIz+3euQACHcMtzoe/1WVQoQpiunxZW+Fc/WKDXM5WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXWZOQgueUeLs3zAO0Hv9n68KadsQQ1Wegv/JdUn6z5+un01mqEM4vCHhIWyfWGYPpWjig6VvSyUaPAwrngsgwmOf57JUiKyxZf3kT7R9zPfLuQsLc+QlFh496EBxG23ngU0j/xLQwTEFUoNrpubca+CoasywUqRyfH4kwDxRBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=d6JscTaW; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="d6JscTaW"
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-97723f98735so513909241.3
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501336; x=1786106136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwmBr3II+Nl4yIpxO7BvkJDCioVvnXcf67GLy4y8934=;
        b=i8W1Ua13HJ6/jDnI9ovVxiYOJpZ5xynGIVZmkjCLgyF4uycrcc/f9wiCfqd4IN5Zmz
         WrER0Lpk8xB3eIOnVQYoTb34ECVBfCb6BjxP5YKfhB3G+NIvRa7nueczezEqZf6Cnybt
         3R6panQBV1L0yvtDxBB26eV2gTfHd/XJHHBsQ5km8mbBYMfem9eO60tR483Gji3W0F00
         JQ8eL+y5wpe8I+7/Lg+IVUHOJZNzADu9/4gaKHs/sEwKf2o8enXl5n2msiBziq+IFjeO
         4LMZKNJOkbCBDcnIyHp5Wq0MBlGKflszUoOEBoJ/Cb37cM4WNapsX5an8wTy/3nVZmW7
         1Atg==
X-Forwarded-Encrypted: i=1; AHgh+RpU6TvriIQuW/Cy2vG959yExX4x0sBoVBQg1orXp61GFetgNHnxT06Fitwa/LJFfXnoR97GcgYkAdY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzYuqnsjHjWFIP8Kwxdu6x4blERItNR5AlPDjabfc46UlUZScV
	Zra6ldosi9B7tBV4WlCfx/a6YXEhCB1RVVTWMhklZqCDD2ZOltb/62S0b2bUyu1tMD7snB5UTWt
	mJafnWAKcfQGur5YgAP9P5TfFm+9MvOqaXcRx0YuI7c0qWfRmhUqHdqTJOv2wGGdR6dp9tLDOrR
	nBcsNKkm9RBlelu2QuMMPfiE77C3KqSwBYNaF4H88Ruf0ulxCJldeNqmL0VVxclyhGpDNkOck2B
	R6I/6aMsogRMjRKpRrMkQ==
X-Gm-Gg: AR+sD11+O1TzdO9+22Q3qKDO/39q0WwsEOsKOqv9gdaNmWrfTAVK2Y6BgIjsFYB3UyQ
	M1sfJ6OHxvxt0KGTH/OgMqQ2UxBR1O8Fl6slw3IA8ZoTLOLM8NH1PxNjF1r2uu25xCMnuUKq9gs
	e/ehAuY9DqPsXD13+tkfLCoazgE5xw0d6gL3avMI7wU9JOcOBz+Qrk1FA5JT2QNt/AGA3cyG4lN
	MAe/MCx+/vLFFmKMSD7ITRKex/PuVpeyS39gRZzLiHUYh+dNSIqjJcACl8qYPnAfgwbsnNGNDCo
	mt8RMdsmvPzShEGZhh2SDxXbc/0CXAhlHSCfTQgBk6oR5nT3tR0dhDTaVUXeSd28jTLEAu4INKM
	gVL2J+FMGMsvJJkgsYVXSyKxV6NP8o/qK/Z8mlk5SzYx8DEXbAySlcNAEz61+Fa7vqvu1j88t0Y
	1C58BcoTAmPuQkQfGiS2zqpJzBD2VPbYmWc8Rp5IA=
X-Received: by 2002:a05:6102:290b:b0:739:4fa1:50aa with SMTP id ada2fe7eead31-758fd904d28mr833963137.14.1785501335975;
        Fri, 31 Jul 2026 05:35:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-759c9b50f79sm79191137.25.2026.07.31.05.35.35
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso948492a91.3
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501335; x=1786106135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwmBr3II+Nl4yIpxO7BvkJDCioVvnXcf67GLy4y8934=;
        b=d6JscTaWLHiTE6jm8Qq/xN1u8VTtz/TRsnuT2tEAHdzjyHf3XVEtlQLsZtD4sUIwDF
         GIibrPOUdIyUVJzHNofqoZqAmN9YNTiDQm889QckZWhQuabVdrKakw9vHmBiqUZfNJJz
         3zdHLfuZKHBOZS4XdfrXRt62XXzReEHSFeY4g=
X-Forwarded-Encrypted: i=1; AHgh+Rqua4UH8y9lvjI2GpQdzoxH3sDgFbGrD8EO2EsviPyksqSaahc/4vz64MnfQLIw01W5vJcaDbWoh5w=@lists.linux.dev
X-Received: by 2002:a05:6a21:398b:b0:3c4:147e:98f1 with SMTP id adf61e73a8af0-3c91b1b787amr1737811637.31.1785501334820;
        Fri, 31 Jul 2026 05:35:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:398b:b0:3c4:147e:98f1 with SMTP id adf61e73a8af0-3c91b1b787amr1737788637.31.1785501334371;
        Fri, 31 Jul 2026 05:35:34 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:33 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 08/13] wifi: nxpwifi: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Fri, 31 Jul 2026 14:35:04 +0200
Message-ID: <20260731123509.1975281-9-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
References: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Stop calling nxpwifi_roc_cookie() to generate cookies in
nxpwifi_cfg80211_remain_on_channel() and nxpwifi_cfg80211_mgmt_tx().
Use the pre-assigned cookie from cfg80211 instead.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/nxp/nxpwifi/cfg80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
index 4f9e20f72811..198174ac754e 100644
--- a/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
+++ b/drivers/net/wireless/nxp/nxpwifi/cfg80211.c
@@ -212,7 +212,6 @@ nxpwifi_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	tx_info->pkt_len = pkt_len;
 
 	nxpwifi_form_mgmt_frame(skb, buf, len);
-	*cookie = nxpwifi_roc_cookie(priv->adapter);
 
 	if (ieee80211_is_action(mgmt->frame_control))
 		skb = nxpwifi_clone_skb_for_tx_status(priv,
@@ -277,7 +276,6 @@ nxpwifi_cfg80211_remain_on_channel(struct wiphy *wiphy,
 					 duration);
 
 	if (!ret) {
-		*cookie = nxpwifi_roc_cookie(adapter);
 		priv->roc_cfg.cookie = *cookie;
 		priv->roc_cfg.chan = *chan;
 
-- 
2.54.0

