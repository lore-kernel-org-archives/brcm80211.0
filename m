Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5462F411A01
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501332; cv=none; b=Jurgpo6boelvefSXaG+tUmGhWlpkKFR/XOFK/4tBZ0RC3YqYfVrtqdONvliftyicz8G+2uGxRi/gytcIvBH0RtV7iewnCRirJR0msaZGvcYmO/uAPSuYh2eEtoXup2cl8K09kMcxOfLdYV5r5F0hkY2h4HreeXwGgXAFcRrXfo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501332; c=relaxed/simple;
	bh=hlngVgbt/fHlmZwu9T2OL2Blvz2Y9ykDu2Gnv4uEwhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tv6Ghal91Dk2EcahY3W1vG6nKmT3aXt7agAQLCrXEOyVj1lOtu1A9MvS0u6UFqsbGIxcKxb9A3JGB1rgl0tmwltss4oeyFuGhXBjwUzzd+O7eYXGFcVKuTpq0X8R/wuCAvU86QP3jut93mZYotwRM4+SkYR1ibqr1wMaS5Dn/NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fF6SAsET; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fF6SAsET"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-8ee88fce572so8999886d6.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501330; x=1786106130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j1yh/gFRlu1QTfred31uo8L9p5p5dW7iY3cQ+OXl0a8=;
        b=iUyMq8PVS0jLoo5G1pUKoWl7L83wzXC1czyMg9HZcs5AImwQrqj/Rc+miSQODK5HMF
         LTwtquLGNaPtriUUlJi4OGuLjq7C3rk8t+g4nE/b2FPKYNbTVEpNIsSvUXVYctDr2Aw9
         TbkSiotTQ8D0j3e3yIhvHl2yQ8QmOg88klfeLKgghubOtK4u91MiCNO8kz6zVhs0j9bk
         NQR8CBZ6QFXxTOu+Kz8jI6qSr5bMbo64JHaKGaTcxSKnxPZLmXww9jRHZKdR3s0AK4+t
         hoyFb10Hpb3sZt18hyNTQz3xcG6p1w5D+SAR06szPLzmooc8ZuJj53wkffqa5J2Ny5tI
         9wtA==
X-Forwarded-Encrypted: i=1; AHgh+RoI7SIr0MB3rqoZ6jZ0GMJ7ny3kcQsXCLBrk+LJE6lRbLvRmP2iaZLdTiaLQdWRN502qCl+3oAQivM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEHgHMBrkWhZWt+apE0RSH+23Dhls+QEHPBc0u5kOdNJrb1QTG
	hH2jqqevZapl66M862hNApUPWWUtl134OSbd0IET2Z38osWM+pJ1rdst6dknXMn0YWJ3g3oZLzt
	WYiV9QD6ykzd5gj863Gd11tik+48HFhTqlY29c5SG5Fqswlsudv0TR54NYK7B1f2PMAU9qOFheP
	eH0UDXN1ZCKJEbko3wucJ2+yvQvlHwj14200RnKqUDlNbNvOyMqDL+iL7259zE/e/CAzDK7zofV
	Mp+rqDBX5u22jbMXnzYvg==
X-Gm-Gg: AR+sD12hndc2t0suHFxf0b1F9AnZOj3Y6sh80kWeBZxlNZTQfMhKyNltQ5xaiNuxX1/
	XdC6/NXoLLvoE1sa+OaghospvjWcv1NiJrE5n3BUMLK9n9xQvwQakoTvH4bWqaRNzzCH0XEASle
	QfKsnppl2OBO6fbSrPHfZAoTu5/8tbMqJA4dHqQb52pSD+BY0hpwMOr4hJdWC1a9sk9CJiFaEp/
	7KlJFDVJjuQNmXD4dmmUpsYYpgfaINOM+ciYEm81DRePjUS5FYYTrWZSu7bYMb+xK5rMe0OpddF
	axRPb6ADWd1Q9174SAFRFxKZmVeoBPIj+10nQ29SG3pN5QcweNM1A+4U3XAPlnsOraJg9+TnOkd
	tdqsILpYIqK2RrFqHHvLXnfVHN5VMUkTbXHwWPjSR/WFNY1bTx0yOnOqXYmcf24ktLQARE82vgD
	nJVMabeOkpybEbCcQ5cWLMFHHcPh3dtzouMStmLHE=
X-Received: by 2002:a05:6214:2429:b0:8ce:b2e9:a4bd with SMTP id 6a1803df08f44-908421bef71mr29407276d6.17.1785501330007;
        Fri, 31 Jul 2026 05:35:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-908434f1a11sm787476d6.12.2026.07.31.05.35.29
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so1065515a91.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501328; x=1786106128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j1yh/gFRlu1QTfred31uo8L9p5p5dW7iY3cQ+OXl0a8=;
        b=fF6SAsET2CyrBVxLmgMp343b4Qo6WcR3QMAY4KzNyL1EnTqPg+Xuk6WjdZp6JDjlJn
         fEWAEokbJtIg0e9P/9548Md6Ev/suRmYR232tFdXkBEh72rWhTL92u9B5d+Xqq7taGVv
         DiShJT1RaZg2fjTyY+vifi4wwQzh/G8+ZK+30=
X-Forwarded-Encrypted: i=1; AHgh+Rp7jSrZQjkMreJG9Sdwb2rQw41EeMaU6DPKq+gt/EZnTYurGg7fmjaS7iOuaRcgii9n2oGUgxhLnGo=@lists.linux.dev
X-Received: by 2002:a17:90b:2d90:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-38fb116d6a6mr1802475a91.10.1785501328381;
        Fri, 31 Jul 2026 05:35:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2d90:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-38fb116d6a6mr1802434a91.10.1785501327656;
        Fri, 31 Jul 2026 05:35:27 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:27 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 05/13] wifi: brcmfmac: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Fri, 31 Jul 2026 14:35:01 +0200
Message-ID: <20260731123509.1975281-6-arend.vanspriel@broadcom.com>
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
index 6b2c34e3a796..03a7a4c18279 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5573,8 +5573,6 @@ brcmf_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 
 	brcmf_dbg(TRACE, "Enter\n");
 
-	*cookie = 0;
-
 	mgmt = (const struct ieee80211_mgmt *)buf;
 
 	if (!ieee80211_is_mgmt(mgmt->frame_control)) {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index 873754be5174..5c7a475cb5e5 100644
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

