Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E4E43637C
	for <brcm80211@lists.linux.dev>; Mon, 21 Sep 2026 21:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025504; cv=none; b=dG56i5bqqInIjuPRB7PdfU1u7XSOKM8YARgaoHyyY3wSn+JxILbWdRm1FG1xy703UKjEAHPdwcVspdRTdsp8Lserlord2g2hcXWJ0+WEocEqnrZnU+lAPKqdPxErpYuKdfaNboAKkzhOcJw4Cgt+0/RXqWPZaoJjYHRrh4MbeiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025504; c=relaxed/simple;
	bh=72VPKGFgUFUjrL2n1VYKmbyNf3I0BnnQw/kQ9VbMmhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDcAZWZ7HKvwhGXsknufFXVvfTgzjFSga9vtzKYyxfOfhQtUm1DjgNzzQsPuGIsOM7KKyM9iHrv32Y7z2YkrwkWB/PJ2OIwuhrv+rsdK6lN13p/HuQdOUtyH0hUDNxm8vqiRy3mfKnbxhzhfqkEdeGS9J/3ld7dnyyv+Ym+3TQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=IGkfgkkX; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="IGkfgkkX"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530c602630bso42106601cf.3
        for <brcm80211@lists.linux.dev>; Mon, 21 Sep 2026 14:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790025501; x=1790630301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XC9Sb/ipf1691XqMArNePnNNYX36EhvRdBJwfuO0HU=;
        b=IGkfgkkXqldN1sKLrZZAFkGv2btLC+txuD20uU1HfAk9IZbULWiHjKRH0KFsPNvtuk
         YnPl15hwT765t4qyEw5vNPcG1hu/3+doMvsyn4xVXTJO+qW33P4/ckceaaQ7uJsHLx4H
         k+ynj6wwFbcvHHuDfi9PohtpGZflqivWTVLz6ikPeYQaXSj4nbje+Tfi3jbqNX2ETE4t
         SNDnLW3jmsTmbHFWt5OBLlGUDoKL1FLjW1Dp6QcN467mhS/05STq/G3tuJolTNf9yzjN
         K2iRhHWC99rnZ3xbOCrIoZfuKqgJTV+3xg28G2Wk22yfAz3l5pJ/exXO2UD/fF7GMkPu
         4TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790025501; x=1790630301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XC9Sb/ipf1691XqMArNePnNNYX36EhvRdBJwfuO0HU=;
        b=2Les6QT0MddH8KBkC4MsgGW4swnqPGdfbopMYUa650d77w9JsWdkBG0UyjkiPxFgvU
         cPEq8CUhdJDQoRKeNhlyh7xoxy5pVUaLxPKRnuN1BThinz1U9jw1QBhJcWaT8sixYh+2
         6NpPLuf5uEK5obMFPRXyaOU6PA+RwSrnoVUmEp8XoefagRmiX3RnkUoGI0jkeAB8SMxC
         4MH2uiiqr+1wc1pQ8ymYU1XPFkN7OKRlcNs20l7KYnAq45ElWZnQdL1kTgdER9NKrAE2
         VZ5yYq3x+90JDe/jU0Hks9VXk6EAV3hgwFs3BS2dWGVrxSbP8OIvvip4HyMN4lMmNVEN
         xK/w==
X-Forwarded-Encrypted: i=1; AKwUvByImqtSbuZRBaBmZWEyZKprJKy8XY6YnCiZDKpjzwvMt2Q7f54ns5usSI7/fFg/VDDfWa9wwfLnGNQ=@lists.linux.dev
X-Gm-Message-State: AFuF++ntBLJ/GKT0gd/dX/XYO+EEHSpcy/RMld3FD6tWQen7J/IM1NzP
	M9RjItMniq+GeBtWZSZKtX5SVeNm6wqoXx0yZIM3fSQv+OrckiCjEfq+EzufHMEjeT3MCwsPlpF
	TY9sJ159TPAT5fwvUfSGmiFV5kbvuwbwuTnR7bIS8+MbHRNKJqqW2tAU=
X-Gm-Gg: AYBFou1AVPQ6S7L2u+q8RrLBU1WG10tboSDraeZtuWrO9+yKVdZYWDK7n+qAssEwMD5
	/qvsLfISN90F2bbdKm/hHbq6S/0p5g79o519QOn3nd/sLrFw5FOOavnnxCoR/dhxwpOtm3U8cSa
	w8VMg+Wc3Q0YtUDeMV2qK/zJy+651eRGYiyzrRVVIDEVWa4byEl02nujNjzkimgCuaHqjgTnS9N
	hSoVVmNkJIeYKx32k5qcqh4iSRxzJe8rbqdNrq8IPEq4NT4DnA9xJG57ty7nvQebRPU2ZuCGboP
	2KXYwyuXmMU7evJVsicu3Cx8ZY/6KeY1D1T/IxmS3hIDUF2ahKttgvwtI8qK6IA62Eil7iV00GO
	E5WsgUGhsIqRHVbQG+gtNwn+qyUeC6vd/RiTqRt57UZnvDuolD+qRyKWQWN/2SowxSgrak8KohG
	HnSadbm/e2KiAaJnfafS5FKkMnaQGISxNXLGmoOi+WuJIhdhFlsNwG0YV9y0nLp5g=
X-Received: by 2002:a05:622a:449:b0:530:b2e4:d598 with SMTP id d75a77b69052e-532dd5508e3mr6762731cf.51.1790025500842;
        Mon, 21 Sep 2026 14:18:20 -0700 (PDT)
Received: from strozzi ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532df63ab0dsm267121cf.26.2026.09.21.14.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:18:20 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	Sean Anderson <sanderson@brivo.com>,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH 1/4] wifi: brcmfmac: Fix canceling uninitialized datawork
Date: Mon, 21 Sep 2026 17:18:11 -0400
Message-ID: <20260921211817.2432341-2-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921211817.2432341-1-sanderson@brivo.com>
References: <20260921211817.2432341-1-sanderson@brivo.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

datawork is currently initialized in brcmf_attach, but bus_if->drvr is
created before this in brcmf_alloc. Both of these functions are called
on firmware load, which may race with device removal. If this happens,
cancel_work_sync may be called on an uninitialized datawork. Fix this by
always initializing datawork before we set bus_if->drvr, as this matches
the condition in brcmf_bus_cancel_reset_work.

Fixes: 43b25879f004c ("wifi: brcmfmac: drain bus_reset work on device removal")
Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index dad6f4563d146..a3163120154dd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -1298,8 +1298,6 @@ static int brcmf_bus_started(struct brcmf_pub *drvr, struct cfg80211_ops *ops)
 #endif
 #endif /* CONFIG_INET */
 
-	INIT_WORK(&drvr->bus_reset, brcmf_core_bus_reset);
-
 	/* populate debugfs */
 	brcmf_debugfs_add_entry(drvr, "revinfo", brcmf_revinfo_read);
 	debugfs_create_file("reset", 0600, brcmf_debugfs_get_devdir(drvr), drvr,
@@ -1349,6 +1347,7 @@ int brcmf_alloc(struct device *dev, struct brcmf_mp_device *settings)
 	drvr = wiphy_priv(wiphy);
 	drvr->wiphy = wiphy;
 	drvr->ops = ops;
+	INIT_WORK(&drvr->bus_reset, brcmf_core_bus_reset);
 	drvr->bus_if = dev_get_drvdata(dev);
 	drvr->bus_if->drvr = drvr;
 	drvr->settings = settings;
-- 
2.53.0

