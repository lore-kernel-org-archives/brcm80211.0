Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624492EC0A2
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 14:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249970; cv=none; b=ifANOepJs5qtOYVF2k8W1/bwvSEVlUg9Xf2thC05XswodG9pIS6ficiQ8Rgeo/ojwrdDEij1dHD6r3KEqzwC54yN5dSE8x3/6vaJASkvD6hljULu2DrKSV3k5vpfVo674OfWaLz01M5sPUzYgygco3mt9Ljb5ds6DPs/6w/MNJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249970; c=relaxed/simple;
	bh=jMgvxiK9lmLnOAee+XZtVagqR2BdhpjxqxhBR68zT+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWR6Ruze5o0tjedHFHMJwCXsqAqgxyX9ljbA1ozifpzjGnmoQfiIGsQx5cOrsGIVR/6ZzSLg/JuN9NspzQaWw3hthN2+5D7tVbDkahsZM4d+ioxVzpNU8NaTCjC347hQko5p6i3NDGead5Pn/kai4cy8Y1jigrJf5W3PDvYw/Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OVsy2pZ/; arc=none smtp.client-ip=74.125.224.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OVsy2pZ/"
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-6685001353fso3473278d50.1
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249968; x=1785854768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ar0WQnIHDpGHXJ9rIXyWU0tvEfBnqrXceAiqGiwHa6c=;
        b=D6iEWQXg3VXeu278i80wkilSYhM9JrQwPGM0SuYQKvceJJun9Be7AGyGiTcdU+Q20z
         dMsv50z/xnQ7a/asxfMpwUuhaYZRwlz3PMTIzhZv+X9RpbLfW10H1G62k7yU0JA4g41z
         LHqxvNiNPc1PsAMP9zOp3ocftk7arR9lfNYGukJgFPy+zSjAHwjC1cwD3ETiz0lgoDEu
         6rewS/Gixw0HJ2XNp/BPZ9HV5cKpfLkACgxfW5Jik3X8kXt2U6xbtMEb9svNE2YwFZLE
         RYyH6rXi0b5nt2CXtwVk3uNB5y4tEUwBIX0mWeEW0M8RB3ZL8N+aowhvt2fzJBnWZKXK
         Aymw==
X-Forwarded-Encrypted: i=1; AHgh+RpXc6PlDZE0myIFTyu2tLRCIoKZZbIZNTpoDiQUSfHp4VuBsj+xU1+6yJk/jhqTXNPw2iKFmwzdf7c=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh8pIehk2Q5D0gWrXXyaNBNPFwnTMh25EyxI2soRHOSQsFeLYq
	fChu9Nmg93AKNChMDn9hzxUCApKgiAVpGRiETOet15Wn8V8/32c41rHlPGvlDzJeQL1FmPoVcxk
	SlzsUKLVJl3jsN/kipWcm8gHQq2tANQNcnkeWDeixBfRCwaueZfEdWjzW7j9Y+yccUR/0n0wSEn
	bp+H8+nuai2tbH7m5udKdzg5qmCS7ks76pl7qjWoa4+oU89ljaAA91IRyn5g8kZRQM4XweHx0zR
	Mtlpe5xk5I941iix5RgBQ==
X-Gm-Gg: AR+sD12Q37HberKXYPOY44pWDuvBExyJmQmTOy74tOdEYUyMSz/4dPaz7dS616jK+BB
	36MWHnMFM3PgOhFpBB+2qm9Vy44JPJviVATcbBelbmIDESqwi74ZXqvMxQq38bSYdMv26aeAnyO
	dCzyrgU6zjTw7u7sOWMfORJaQLNUQDDH4swGbMeHgaza+yXEX1K6XQ/6N/Ji9doMz3vwRA2/EQw
	4kbgrkBy9q4YeE8SNvsH/wNjG2DpAXDCl/GszB3c52sf5tfWx0LndJNCvVKH9AAuETf222RS/V8
	7M9tGbN+NnscnuvkCOf8l14Nvt0E0p3OOM9KkaDL40EhO01skvw7h+wOwlgm6Jx3mfH8SDPhAdU
	Uc1cr4OyGfGPcvQKad3OlbWpI0sr19Jxl4nTZ2IrtrMb6xniWYBazyvkwY/0iRFXYhPq4ibAe+Y
	/bpqCpLkkncDJapYMvuuOCIYB86bcsAlowTKGqVo0=
X-Received: by 2002:a05:690e:2510:10b0:668:8e5c:ff9f with SMTP id 956f58d0204a3-66905822826mr768379d50.76.1785249967959;
        Tue, 28 Jul 2026 07:46:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-668c6f1197csm896482d50.18.2026.07.28.07.46.07
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:46:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e7ee64b25so585530785a.0
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785249967; x=1785854767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ar0WQnIHDpGHXJ9rIXyWU0tvEfBnqrXceAiqGiwHa6c=;
        b=OVsy2pZ/+gQphw+AJ4k1T/vsFSWSCeW86uWHd7NQjBOKEhnrFzFnS8sqkql6yASCFV
         j1oJ7nwduBGtVzo6RBbSPNvRV5XhqIFEIpDOYletRC8Umg+4XxKn53KrfFW7V1RdKvDE
         xaB77ygRowcMckSbNP5PCiXJ0fykk4Wmbixm0=
X-Forwarded-Encrypted: i=1; AHgh+Rog4tJpUzWktNGhUeCNH4LmKhoNtFg6za1ZdJDGWwdRJRtnWOXZxdshfze7F5DSk5VSnwaKGSd03jM=@lists.linux.dev
X-Received: by 2002:a05:620a:319a:b0:92e:dddc:6588 with SMTP id af79cd13be357-9330277eb01mr244915885a.42.1785249966666;
        Tue, 28 Jul 2026 07:46:06 -0700 (PDT)
X-Received: by 2002:a05:620a:319a:b0:92e:dddc:6588 with SMTP id af79cd13be357-9330277eb01mr244907885a.42.1785249965874;
        Tue, 28 Jul 2026 07:46:05 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm878659685a.5.2026.07.28.07.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:46:05 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v2 05/12] wifi: brcmfmac: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Tue, 28 Jul 2026 16:45:42 +0200
Message-ID: <20260728144549.2207061-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
References: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Stop generating cookies in brcmf_p2p_remain_on_channel() and
brcmf_cfg80211_mgmt_tx().

For remain_on_channel, remove the cookie increment from
brcmf_p2p_discover_listen() and store the pre-assigned cookie in
p2p->remain_on_channel_cookie. The expiry callback in
brcmf_p2p_notify_listen_complete() already reads from that field.

For mgmt_tx, remove the "*cookie = 0" assignments in
brcmf_cfg80211_mgmt_tx() and the cyw extension. The pre-assigned
cookie is then correctly passed to cfg80211_mgmt_tx_status() which
already uses *cookie.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 --
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 1 -
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c      | 6 ++----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 20f7fccd6121..7e0368f6860e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5573,8 +5573,6 @@ brcmf_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 
 	brcmf_dbg(TRACE, "Enter\n");
 
-	*cookie = 0;
-
 	mgmt = (const struct ieee80211_mgmt *)buf;
 
 	if (!ieee80211_is_mgmt(mgmt->frame_control)) {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index ce09d44fa73c..f0f3a45d7cde 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
@@ -123,7 +123,6 @@ int brcmf_cyw_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	if (!ieee80211_is_auth(mgmt->frame_control))
 		return brcmf_cfg80211_mgmt_tx(wiphy, wdev, params, cookie);
 
-	*cookie = 0;
 	vif = container_of(wdev, struct brcmf_cfg80211_vif, wdev);
 
 	reinit_completion(&vif->mgmt_tx);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
index c7d7b35ab125..3d7bf25f1985 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
@@ -979,10 +979,8 @@ brcmf_p2p_discover_listen(struct brcmf_p2p_info *p2p, u16 channel, u32 duration)
 	p2p->cfg->d11inf.encchspec(&ch);
 	err = brcmf_p2p_set_discover_state(vif->ifp, WL_P2P_DISC_ST_LISTEN,
 					   ch.chspec, (u16)duration);
-	if (!err) {
+	if (!err)
 		set_bit(BRCMF_P2P_STATUS_DISCOVER_LISTEN, &p2p->status);
-		p2p->remain_on_channel_cookie++;
-	}
 exit:
 	return err;
 }
@@ -1020,7 +1018,7 @@ int brcmf_p2p_remain_on_channel(struct wiphy *wiphy, struct wireless_dev *wdev,
 		goto exit;
 
 	memcpy(&p2p->remain_on_channel, channel, sizeof(*channel));
-	*cookie = p2p->remain_on_channel_cookie;
+	p2p->remain_on_channel_cookie = *cookie;
 	cfg80211_ready_on_channel(wdev, *cookie, channel, duration, GFP_KERNEL);
 
 exit:
-- 
2.54.0

