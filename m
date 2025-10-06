Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C7715667D
	for <brcm80211@lists.linux.dev>; Mon,  6 Oct 2025 23:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759792393; cv=none; b=jgXb76acplxNJF4AYHeI6YhJN25sDVNGgqwjSKD37jBZOPrzhpsepYCDTPP8UouIZwLr6zEFDMlbIAb8dQT5Q95mQmMj+xDUO6jg7ViAdLTjX3z0K4XW4vJNXi5RcqZ1+g5102YadaZJDEChaVtnlV9OTcxLY8tA17dBsJnVtOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759792393; c=relaxed/simple;
	bh=19GMLGf8m5a0CRzgB5oDAv+GaLJ/mJexuxc4h93Fq6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KAHlh6Z3PFnKkmyIMwGzPIftOAxo5P9WMZjSy7gu+WvSRZ1KV77QGVwNcL8drAJo4arqmjSOX7ftEuKOiAV7K2mLct7ysDNF/JCAhJnVWcPfKbg1t1+bpqXXJvViiL0GkF1T3647FfujRrosXVLravlBxTKunlaP7bs4qM6ej8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=govivid.ai; spf=pass smtp.mailfrom=govivid.ai; dkim=pass (2048-bit key) header.d=govivid-ai.20230601.gappssmtp.com header.i=@govivid-ai.20230601.gappssmtp.com header.b=sv0nED9z; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=govivid.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=govivid.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=govivid-ai.20230601.gappssmtp.com header.i=@govivid-ai.20230601.gappssmtp.com header.b="sv0nED9z"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-72ce9790ab3so62747397b3.1
        for <brcm80211@lists.linux.dev>; Mon, 06 Oct 2025 16:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=govivid-ai.20230601.gappssmtp.com; s=20230601; t=1759792390; x=1760397190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plG/WwEQw6V2dNdegoY/PD4rJgv2/HUngWDkL7W4ugk=;
        b=sv0nED9zvsMvoVSoCSo26meR63pXhJGDmGAp93Se8nV7PHQcIDtM2DE3o3Wlp39SKE
         Znfpy5NOCkr1CkXsnsTOJJmvC8iKkadheMKt9Z5W+Rxv2T7IQr7fArGXGMEa4ReodMZ3
         604m+DADiXVYJp33dbTFogwLRElvSc1asmxidyYPq7m+oGR3G2jRIvfdhS17xWX8Rt4Q
         PqUQJUzpDldviXXFVcusG1YmAKrc8lxl4IJAKERnSA1CUz14BOYC+P+e0R9QHUXb1DRf
         pODUY1xOuzBz1S0euhjU33X7R/tXG0DZqIxq8PuTBYSsPOd/T8ITjYTEeD8s+zPKkFJv
         Xw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759792390; x=1760397190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plG/WwEQw6V2dNdegoY/PD4rJgv2/HUngWDkL7W4ugk=;
        b=kJwgqAEsBosq+6BmmNaEYAYtGYgRVi0ueSh+Tg0OXkmLrZs29SRfmgVDUKWK3kzezy
         4P30I79jSYeXl/kCv2GOZnGNxoNXZqCvwBnCMy9y7SELVoWXY27uDkHRWUHNp57obk+X
         XS894CKulRSqYBPm1psVo2uZ0KSvmenHklKCVRWTKjbpu4Bw57sCDvzVVgwV7rLPeQxB
         BlLfpAPtJvDiiTyV9ZI49TgD7SP0Ew/1e0NDgqG/pmHHjnSgLRFTYT5Rs9VVuD58thTu
         SN9hjuxbsKmatlrjaLLgoJqyFM5NTLBxE6rLaSX+xavR2kBC0bBa5FTpVzmbk46NLpqJ
         kfXw==
X-Forwarded-Encrypted: i=1; AJvYcCXpc3rPa069OmykgRIEhVoPrTaA5usd5EORSP3GGreMTw4V4emeiqkMGBE0rcXCvgbIx0EhpMt4Vkc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiEXEZhGKBxRauVdQ8LSyhBRuqJGCzheRiSFvJPBsZQbWOPjIj
	YLRdGBE6uFlDfmJk6eGkDVeGDCoIPO095/Kha/mlhWBo/vvW8s1btdOC4CTEyK/ad5o=
X-Gm-Gg: ASbGncsvYcS503ei8aZUNljKJyCrfV39vVnIQB2UXILDf8v6ecsfAFAyoctNV2NlRC6
	0RWThtefvfQHxfO+FGmr/NqznxbFvhWztB6P9kQO55rokLkuQ+dnoEiKuc9XUx2+xc9AXopgtdc
	gwlSTcPFaxz9keLu+GP+BFFjaOUASk3gKmoulLTW8F/VIJNBWGD+beyhUyDJSNMJXjPuoqrV5tf
	iF1W9R9pjVbQFIuPX6mcWxP/Z/6dNcTF/RXgLO79karB16RPRQYMZSMl1989wlmYSBs9iyHl2tY
	/KaRP4nv4Sh5hGHQ9v6iG9SABWLJ1pB6ARyWKlaf5BjbA6GTpPZGZ0VKDBPl5G9Mh5cy+xp2Vdw
	OfKKC8qhrCPiLzWnL1s97hmPsjsweF9vikc5jrQ==
X-Google-Smtp-Source: AGHT+IFk6eSrZ5XzN3wvlsC9PmPuzF6JqZifmZhN9bZD3EfSYGRrCwu9TSu1fUUPzi8tVdN/mHZODg==
X-Received: by 2002:a05:690c:6604:b0:77f:90dd:af74 with SMTP id 00721157ae682-77f945bf0ddmr152543907b3.3.1759792390164;
        Mon, 06 Oct 2025 16:13:10 -0700 (PDT)
Received: from pop-os.. ([12.41.86.113])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c09387sm47712097b3.2.2025.10.06.16.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:13:09 -0700 (PDT)
From: Richard Reigh <richard@govivid.ai>
To: linux-wireless@vger.kernel.org
Cc: wahrenst@gmx.net,
	arend.vanspriel@broadcom.com,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	chris@streetlogic.pro,
	s311332@gmail.com,
	Richard Reigh <richard@govivid.ai>
Subject: [PATCH v2] brcmfmac: Fix NULL pointer dereference in P2P action frame handling
Date: Mon,  6 Oct 2025 18:13:06 -0500
Message-Id: <20251006231306.131967-1-richard@govivid.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9811a46c-70ab-4bf6-9e20-7882fe1d0c55@gmx.net>
References: <9811a46c-70ab-4bf6-9e20-7882fe1d0c55@gmx.net>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When iPhones query network information via the WiFi settings "i" button,
the brcmfmac driver crashes with a NULL pointer dereference. This occurs
because the P2P device vif is not initialized when handling certain action
frames.

Added an early check in brcmf_cfg80211_mgmt_tx() to verify P2P device vif
availability before attepting to send action frames. Also added a defensive
check in brcmf_p2p_tx_action_frame() as a safety net.

Tested on Raspberry Pi Zero 2 W with kernel 6.1.21-v8+

Fixes: 18e2f61db3b7 ("brcmfmac: P2P action frame tx")
Signed-off-by: Richard Reigh <richard@govivid.ai>

---
Changes in v2:
- Added early check in cfg80211.c before calling P2P functions (suggested by
  Stefan Wahren)
- Changed error message to debug level in p2p.c (suggested by Stefan Wahren)
- Added fixes tag
---
 .../wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 13 +++++++++++++
 .../net/wireless/broadcom/brcm80211/brcmfmac/p2p.c  |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index ea8409e0e..9983136a7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5137,6 +5137,19 @@ brcmf_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 
 	vif = container_of(wdev, struct brcmf_cfg80211_vif, wdev);
 
+	/* check if P2P device vif is available before attempting */
+	/* action frames */
+	if (ieee80211_is_action(mgmt->frame_control)) {
+		struct brcmf_p2p_info *p2p = &cfg->p2p;
+
+		if (!p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif) {
+			brcmf_dbg(TRACE, "P2P device vif not available\n");
+			cfg80211_mgmt_tx_status(wdev, *cookie, buf, len, false,
+						GFP_KERNEL);
+			return 0;
+		}
+	}
+
 	if (ieee80211_is_probe_resp(mgmt->frame_control)) {
 		/* Right now the only reason to get a probe response */
 		/* is for p2p listen response or for p2p GO from     */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
index 10d9d9c63..e62135cd4 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
@@ -1559,6 +1559,12 @@ static s32 brcmf_p2p_tx_action_frame(struct brcmf_p2p_info *p2p,
 	else
 		vif = p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif;
 
+	/* add NULL check */
+	if (!vif) {
+		brcmf_dbg(TRACE, "vif is NULL, cannot send action frame\n");
+		return -ENODEV;
+	}
+
 	err = brcmf_fil_bsscfg_data_set(vif->ifp, "actframe", af_params,
 					sizeof(*af_params));
 	if (err) {
-- 
2.34.1

