Received: from mail-yx1-f97.google.com (mail-yx1-f97.google.com [74.125.224.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A88352020
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093965; cv=none; b=DiFXA2P8u6eO/EcVvbdXyOXlFShK6t4FrV7hPpnmc/SC9JbC4TVcKm9FPjxBDOOqfDxatUPxKLil4hSiNI+7guCxF8p6OZk2IKrkBRFr26EHhEV6/Tkas69WugI3Krknw1a7K1PeZ/onH/a2hSxi8R394OObJgdlolNdQRLva+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093965; c=relaxed/simple;
	bh=jMgvxiK9lmLnOAee+XZtVagqR2BdhpjxqxhBR68zT+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t8uj23FOPEYZ/wiT09HezfngBkQQDsexNW2F2uAwtOg/mZepuhHOtAe+kSodPoIZFWUkEsAvv3LZ/ZlMz1ppHMYAZDfJZ4kREhjAglAnG25h+v9rvfAProftPYP+weEL3f16jbQeQQsAwkSc+thJwAfd3E6em3e0DIyeWh0oZ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KE/eWEEX; arc=none smtp.client-ip=74.125.224.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KE/eWEEX"
Received: by mail-yx1-f97.google.com with SMTP id 956f58d0204a3-66843304cbaso2800005d50.2
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093963; x=1785698763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ar0WQnIHDpGHXJ9rIXyWU0tvEfBnqrXceAiqGiwHa6c=;
        b=R/LspGAKZoPOuQMdT1EWUETgBneGOCp93rOj8w4+WYBzGng0dOr0u4Ej5j+bh/Xo7p
         r+ro92yT9Z9sZVYqtIeZoe6yf1I6TWPhtXODrf9BDxXhz6aA0eUPgO9CgWhx1h58qlTM
         MoKefDITUPByhddfsZReKDfPZfLWOLeRJwcxUMTyAnz+hBmz4CxDU0GYgJ9LimiLpfG1
         qGDSTZZ7CBgMHEwkACOmKGbcdVsyR0J6pxT5fK58STEAaQXes2f2ecibhL6sDxCGAwFX
         ZLqFX26K9Q43ZxM17RWg9rN+jnQrgUQOuLqt6D6Domo69E3qsUqtprDAVWR94q1r8LDe
         7Uwg==
X-Forwarded-Encrypted: i=1; AHgh+Rqtjz+HWZmcb/sDB44d4W6r3UQl24LodlS1/8AwjBb6E7XBxZh65d5FsP9YcFbubYGCaqxLV6qv9hk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJQ6mBuzgJ381okEzIaMxRsQDeyA+br2XmHlyMvme5qQ27l09x
	lp3G+EXb9d7RgSrEQZrm8sy8gcXhlqvAvLHv5wqCTAuwyjWgZo2RMY3H5cy6jqt4C2ppyHg9Be0
	oKqtNkrNbrHnR4kCkGzbr5W+pCL4LPti0Za2sjrhHtclu54Vw182uIE7xYuPCdI41g4151Qm0pC
	eZWDvEI8jVSt9GK9JBIT65Ku3FCcPivVy0G0QkuB25bvjiCU/nL4ITK8PIULpH7WSqvGHrz/FfB
	DvjikEOnWoCcpFipQtBTA==
X-Gm-Gg: AR+sD11SZQgLPuoMPneooYr7bYfWMk15LEnwko/QU90S+Rpf4xU3XhtJTopJvlv9PTz
	mzxWhO7LVZsSJjsLA3I8ladQ57zUrp6gKBrmcNmtmDCbpMS4gTEKnC0hDMCT2fuiDHcA2vQ4cbH
	t4Ih7i8KyCcD1fOR3mpCcYTyLI7pph4PqhHkXaoxcCvVHBXndUxcXyypM56tqAhZdrc8JyuVIyW
	rIaM8qVVvZYJKWbJRyQ4CltdAfdf+KbUObrpnzBWUWt6OluFYYZRSFySYzIWxOh3gf3fYtcUWow
	ArPX1oiWOTUnqRiPuqjmLvenrL5ZATD4C7R4XnxPm1GpXyWCGsLZPRCOIB4NgnB5YkCUcqB1Uiz
	J/C+ZLoTvkvcdwXVjtuEHXA4LbKvtxwndVMYq//DHtNoFzo2eouISrliQSLqxcFzPEpYBZ+iDpD
	Yvb5o12JYxXkZBsVdIdzWizaZJhCOd2b44Fq8HuyE=
X-Received: by 2002:a05:690e:1542:10b0:667:9196:4eda with SMTP id 956f58d0204a3-668c79dd7e3mr1292491d50.16.1785093963052;
        Sun, 26 Jul 2026 12:26:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-668c6f7e810sm486432d50.22.2026.07.26.12.26.01
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:26:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so3304251a91.1
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785093961; x=1785698761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ar0WQnIHDpGHXJ9rIXyWU0tvEfBnqrXceAiqGiwHa6c=;
        b=KE/eWEEXFJJ+C/Jk+nkHGK6fnY0ddvn7Ywo7w3GkH1fpGZk37WKJul+8MDKkFAwRN7
         MlzpLfyWPnnzOEFqIy17Md7bEu56wXZv1vVotUciYGWYv7NQeQWMChRapSGXtmfjgVfh
         Qy+sCTBVC38EKiHXNykLx6ssg1NenLFt4o++I=
X-Forwarded-Encrypted: i=1; AHgh+Rpj9roKGl2uZZjo4FvhLhesfcVvY9ZDOtwLCBKwrdGI/652WJZ3q7dWfetn/QXvErGnFccoM2dZ6NI=@lists.linux.dev
X-Received: by 2002:a17:90b:380a:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-38f293cd2f1mr5774175a91.5.1785093960892;
        Sun, 26 Jul 2026 12:26:00 -0700 (PDT)
X-Received: by 2002:a17:90b:380a:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-38f293cd2f1mr5774166a91.5.1785093960440;
        Sun, 26 Jul 2026 12:26:00 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm38355795eec.13.2026.07.26.12.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:25:59 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next 05/10] wifi: brcmfmac: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Sun, 26 Jul 2026 21:25:36 +0200
Message-ID: <20260726192541.2816743-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
References: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
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

