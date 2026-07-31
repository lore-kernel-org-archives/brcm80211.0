Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7F410D36
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501338; cv=none; b=Q/FVapuCTkaIcnGl1RffNhIEtzDwsGDGo5mbu1Xni95fFDqujwRvWxDWKXJL8b23sCUd8yZEunoKUxP8B73Mgu4jz0+suJC1C+Y6Nm5000su0+kJiEWAbJv7R1Dc8waKP2MnaF74zW0v7M790cNYrfuRAfbwPTpZZhlhimQ+v4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501338; c=relaxed/simple;
	bh=1LOZSaWG2uzh/DCffSMH3rPaWMoMWYdMtKwtKAk9vLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F2JfbNNHgHgeo7tzBCa9YxgKbSu3SpC9PG/hX3bGuEr04P1a3QLdIOKD/eX5JfETessb/wizARzt0XqnGPzN5QvDtxeHGteFsiVCakok6M9yjNBdvXIETIUzcN4EIAxiqTjBFjzHIQhFiHPHFSaxwfNmfIJs7GnVE4MLkjNHvFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hccWLR1S; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hccWLR1S"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-8ee88fce572so9000546d6.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501335; x=1786106135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vw8UsAkLTYYubS2GArrnvTGyTO7xTPOjCEXxf9oqMpo=;
        b=h/RE5EU0HFuHHzRnVgvwZMgdDihfwGZDp/wn1pjoaz0Q0j7flc1vg1PsmYooQFzpM4
         eFVnHnMTAQv3/HkwJBhk2tdBAgq4A4NBV3b6PQIbsf7UlylD5lK1ysFg6jxjUjOIQfge
         J/R62de+cCKoINdQGZXg2mx4naYxhj/LOOYKNBS1juL18muFYoKwlRINvsNRsgmQF7Iu
         UfRJ9RQUhP6ABOI2RCl66q773nEPivKs3nH3CNOKQLQqIntv6zYspcl39jl3P9iHXRBP
         fM/y3xstvIwG8A+817mtEmDhN92ONDqLuHnkzLmY3YPPqIBY87K0jHREe/K9U87jztGF
         HmGA==
X-Forwarded-Encrypted: i=1; AHgh+RrtiJXa2VWXYQ0OeIyrey4lW9LnqBDjMWQ/9AktmPqVFYDB8cdvsyUXNvO6Wa7DJ3ccU70/Fq+m2EQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQTBpQNA51EyBlUeKHqBh4Y2Uz5Fr8XQh69lxZiWuBx7Cpgl3c
	o0i5UDidOi2mQiRvoOsWFp8DrKXrM0r2VZKZY0XHu2iJWWqug10nvDgCpc6F236s/yqYgSzooB0
	jHMEY6vteQqsgEAEibg+zRGLLaW2Lxu8HDa/d3rydgKsPlTIXYtBwtNCVYVHqE6Hdmba419TfHC
	QlSrw7UUma3ZETwz+CY5XYlJygGrViNTSGXgu0LaXIpvUo1M62RBI53ZNOeBZYDlZxCxUqBOMHf
	lTcfYd806XI6wtj79Jpww==
X-Gm-Gg: AR+sD12Y8YZl8yOrp+leFqTxvBXP2p4FSirFbYHOxUbSjDBlLx9hc+TeUT0ZbSr4s33
	H9S2KRdGpEZzUyG0/qijXJi3nV8m0e3U+l6JNrIo96m2uRYF6k0fxsRtQ+R9JerURCWNGtfsauD
	P4GJNjbGopZsS3RhEYYd0/qNv7AFf+mIJndKZ9+MWwPj4TlelFdBtFsA4i0kNeZwUyDT8MDnaFd
	nuWyG8uDOPEQaqNIlZCyWqiD8dkhQrxvR7uJV8EMdFAPZqJW2FPEDeP96XZr7T7JbjRneTmG2X7
	hMRC86NTFqYe1q6kTB+OC4ciD/r6BXH0CCjER28DTLWwHoGJ/C21ajazyEjQ5ymilnCtomS67+m
	ub8a3u6Rus/buTc8RqxTdbAF8UVw3RN8anYnZAkEy48YeXaQTn0g3TiNkvBiFRaZJC821DU1hi8
	obc6h9CJIi4S1DLQQauKBGHvQXLHwCYWEJ2IrdglU=
X-Received: by 2002:a05:620a:90ca:20b0:930:cd2b:9535 with SMTP id af79cd13be357-9349680302emr211104785a.10.1785501334949;
        Fri, 31 Jul 2026 05:35:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-908435cc946sm812916d6.19.2026.07.31.05.35.33
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1065782a91.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501333; x=1786106133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vw8UsAkLTYYubS2GArrnvTGyTO7xTPOjCEXxf9oqMpo=;
        b=hccWLR1S6U8EqpjXzOZ8lO37i1SnCxs1SoQ8pNHIPXiJYNkC331oN5y1dOuHjh7cNL
         DN72vHIenolPvbWOPAoG7uTlPZou9s5xQSTAU4h3GQVZNzeEbcwpuFdGcPc6RO6j7D81
         vzbC+FByEJ3VnsANMnv9DentCcCzXreD0uer8=
X-Forwarded-Encrypted: i=1; AHgh+RraUpTfyKCosIo2r3jLAcxpDV5s9KxdXvd3/bGlojOj70BKN+nC611ti839BLBAQ4sbkDhtiYx//eE=@lists.linux.dev
X-Received: by 2002:a05:6a21:6b0f:b0:3c3:8b83:f19f with SMTP id adf61e73a8af0-3c91b3a9af8mr1840295637.60.1785501332765;
        Fri, 31 Jul 2026 05:35:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b0f:b0:3c3:8b83:f19f with SMTP id adf61e73a8af0-3c91b3a9af8mr1840273637.60.1785501332337;
        Fri, 31 Jul 2026 05:35:32 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:31 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 07/13] wifi: wilc1000: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Fri, 31 Jul 2026 14:35:03 +0200
Message-ID: <20260731123509.1975281-8-arend.vanspriel@broadcom.com>
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

Stop generating cookies by incrementing inc_roc_cookie in
remain_on_channel() and via get_random_u32() in mgmt_tx(). Use the
pre-assigned cookie from cfg80211 instead. Remove the now-unused id
local variable from remain_on_channel().

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/microchip/wilc1000/cfg80211.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index 6654fce4ded8..7c19ad34fda5 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -1106,18 +1106,13 @@ static int remain_on_channel(struct wiphy *wiphy,
 	int ret = 0;
 	struct wilc_vif *vif = netdev_priv(wdev->netdev);
 	struct wilc_priv *priv = &vif->priv;
-	u64 id;
 
 	if (wdev->iftype == NL80211_IFTYPE_AP) {
 		netdev_dbg(vif->ndev, "Required while in AP mode\n");
 		return ret;
 	}
 
-	id = ++priv->inc_roc_cookie;
-	if (id == 0)
-		id = ++priv->inc_roc_cookie;
-
-	ret = wilc_remain_on_channel(vif, id, chan->hw_value,
+	ret = wilc_remain_on_channel(vif, *cookie, chan->hw_value,
 				     wilc_wfi_remain_on_channel_expired);
 	if (ret)
 		return ret;
@@ -1125,8 +1120,7 @@ static int remain_on_channel(struct wiphy *wiphy,
 	vif->wilc->op_ch = chan->hw_value;
 
 	priv->remain_on_ch_params.listen_ch = chan;
-	priv->remain_on_ch_params.listen_cookie = id;
-	*cookie = id;
+	priv->remain_on_ch_params.listen_cookie = *cookie;
 	priv->p2p_listen_state = true;
 	priv->remain_on_ch_params.listen_duration = duration;
 
@@ -1170,7 +1164,6 @@ static int mgmt_tx(struct wiphy *wiphy,
 	const u8 *vendor_ie;
 	int ret = 0;
 
-	*cookie = get_random_u32();
 	priv->tx_cookie = *cookie;
 	mgmt = (const struct ieee80211_mgmt *)buf;
 
-- 
2.54.0

