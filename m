Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341BC3D88EB
	for <brcm80211@lists.linux.dev>; Wed,  8 Jul 2026 06:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783492786; cv=none; b=SByAVTEMepO7TesgsvYQyrrMAoLhGh2mnMgqQBEzJDXxhGPiFgssjNaCeq5dEZ4dydB4rTt+yG6PRIZcVkgRlLdCB7EMUYerSHeVa4eFlGS2xaGBL+WnZGWyiPGdCHnRbyht2JLaDcVK7InXZnjwTkoIOg/vtcMuT2r3EMYffCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783492786; c=relaxed/simple;
	bh=LgC4gkyGCU91XJ9gLGCgyFwioRp8mRnj3KTl84mVb94=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=EXKdMaeTLN/fHnU60CUxtvNgOqYlafVpgjq8Ud4rgigsJJKvH4cpTtEdyy2g+rDo0tn66jZIIaRLStHsetX6739Ey5KJCxBq2ZmAXPt0DBGFOjUc6QE3Q7FmoV8Sr0rat4ieLy9P3ZD6U6qqaw4Bmdv8LdDTOvaNtC8NZ+rwW1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMyIcjKw; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMyIcjKw"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so203279a12.2
        for <brcm80211@lists.linux.dev>; Tue, 07 Jul 2026 23:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783492781; x=1784097581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUl5ihFLZ0ZNzBKHgZhdM4ygyPUK+vq4TwX6IU2C3RI=;
        b=pMyIcjKw/mFnHmORCIeaVQKXHVqDPR4S8KixaprAorjLxUgdRF179Fa4nZhSebcrSM
         Pk6BeIKyLwguNT2vgbEqjHJS2iugVqZzqNw6QuY/g8kuhS4EQ3cIPRSO42YfgFXiZmup
         oi1l1dqh8n/DYuQnWPhkWT3+9hcOOuk6YdvcIRn/GsoIxTnmTZENTL0G+MR7UVqONY1d
         Z9+pZdEB8uKDvv8JCB54vAQdYodMV1fetvJkQY9gAGH0CtL6e2a3kOezpLvoh5fMYvxA
         Rsof+6IC4TBaxTz57PA/dUpqIal8y1J61+Ud5D09s60lyuno4eK2D9dDw2Tx+7fNTlcV
         YOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783492781; x=1784097581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vUl5ihFLZ0ZNzBKHgZhdM4ygyPUK+vq4TwX6IU2C3RI=;
        b=DQeaUX8KgbLteH+dBCbkxJ4A4Ho7Z/ns63CETyjptJTVSy9ufgTOsnGY4cEqKr8hGX
         OmuAVBLjZvoorGS86Yb2s/Mgn9kLOll0sYW/b7+J3iHEuFy0B2RNGIfiPLM1CM4gD0T1
         Qu0wqPhkI8sHXWd48hI94z2APURLIakflI2n/dMoclCIMxH8TI5n09Hm5I/nSl72IUdz
         iJNSVNX7DsqtYA5g/960XkBXqGgQzbXRQGXUZLCVrl3c/8Z0xB/70MKb36JUKeOgnrVC
         PNcqmZXN/DjNXbi8fK5qkoDB98tY5PwwYImjGv7yRLp01pOHcjdmWELX/v7QAFXG2D6Z
         54jA==
X-Forwarded-Encrypted: i=1; AHgh+RpBhlN3JFkKJAEygSzRk66YCQdAGzPTkwlqQ2oZztEgt2NMW1Z+U340+russDnfBfqd+NmV0+dQNro=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp8yBv4iE81mB/ckxdn819mxwyDEMOgpV4mUFZqEHPbZVTsQZl
	tl5s5NmgC4MndfIyy8yK5m2rhgq2pkrcosTKmT7qpvbVibKEHa8pEXQ5
X-Gm-Gg: AfdE7cn75D02+C4e8ZlGYUaBZqYXlXdQ7lEhUkqav4td2lJhfXgKqapBiOEW7nYxDgO
	5uN3qYOct4uss/oJ5YZvuSbL+c25tUEqe3jIiuCxuFeIDq3fQUbmDnwJPa1O2uoP+bkwlL5w6O+
	DEEH5ti5J4nExO32cYR71er16jG8xpWzZYRrJ9OA1PnWQjCX6x3bfBZEPPTQVoowe98lWRdDuC9
	hgMZElZde6g8fZRIdyTxuD3JuN2oDTyhcPLCHImO5FAc48XZD7Y4XBUdm0NFDrrxF67DKHH6qVo
	fwppwJUHpWKrIeL/oJEa0k7Tqdjc+GbHZJMiwESRkeDEkUKPy7rFccOxaqd/3DDXLEnOnicDB0+
	/0yPD0UctIhFlAaF6S59sWoOdn2j/Sw7j/kKrdYmwJLb9P923OWmG0dr/kAO2YhiE9lzsOoHXoM
	xhdcSh7nNsbOnaSuDpBA6m
X-Received: by 2002:a05:6a20:d499:b0:3c0:9c18:d5a6 with SMTP id adf61e73a8af0-3c0bd1b22ffmr1499684637.67.1783492781304;
        Tue, 07 Jul 2026 23:39:41 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm1929874a12.28.2026.07.07.23.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 23:39:40 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Peddolla Harshavardhan Reddy <peddolla.reddy@oss.qualcomm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	Hante Meuleman <meuleman@broadcom.com>,
	"John W. Linville" <linville@tuxdriver.com>,
	Piotr Haber <phaber@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: brcmfmac: guard P2P device vif in action frame search
Date: Wed,  8 Jul 2026 14:39:29 +0800
Message-ID: <20260708063929.718152-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_p2p_send_action_frame() checks the P2P device vif saved probe
request IE when deciding whether to perform a peer channel search. The
P2P device vif is not guaranteed to exist, for example in standalone AP
mode where no P2P device interface has been created.

If a search-channel action frame is sent on a social channel in that
mode, the validation condition can dereference the NULL P2P device vif
before the frame is transmitted through the caller's vif.

Guard the P2P device vif before checking its saved probe request IE.

Fixes: 6eda4e2c5425 ("brcmfmac: Add tx p2p off-channel support.")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
index 92c16a317328..bbdebf4c2010 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
@@ -1819,6 +1819,7 @@ bool brcmf_p2p_send_action_frame(struct brcmf_if *ifp,
 	/* validate channel and p2p ies */
 	if (config_af_params.search_channel &&
 	    IS_P2P_SOCIAL_CHANNEL(le32_to_cpu(af_params->channel)) &&
+	    p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif &&
 	    p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif->saved_ie.probe_req_ie_len) {
 		afx_hdl = &p2p->afx_hdl;
 		afx_hdl->peer_listen_chan = le32_to_cpu(af_params->channel);
-- 
2.43.0

