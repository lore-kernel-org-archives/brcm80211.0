Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063698;
	b=Kr03Wj6uNH39/mvaO4aLZQT0g3vPkeB+TUiBLl0Svj/UoH2tYVgyx+7YC1NKIrmz+HeO
	 MyDblTKaZ3qM12sF0ZSWyGWuiLpz7oZhsojDjWpU8sGXMKMmkg1hA3IK1umvqn1sy+oP6
	 GkZ4/dWTYLJZ34cN/sPncAxvZ/MEWemnJLqRcSU6ixgYfkG9ohxyI5OmAuT/de7ZXyiSz
	 jM63YcaCBJCWZB+WQ/6pg1YBqsC1CoktR9hp+FQiRNBysTAqDIkVD2MTfxY2sNSMsHimc
	 eYCBMGJctIWin2IfOTR2WhMAIEbCkbyxAV7KYFF2vyQrC1mj2pppBnGOGOxx0pWkZSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UJIT6szgZ3iHxWbb4OfUYZIiW48z49jGazGBAmmxbcw=;
	b=zpIpYrp5JcVxv6aYF1Y/vsmnJIojeF4WWe4xIQNV8aoO05mj5hDF8M08wU/f2ky4kdAV
	 GlkhOfASXJMKyPFP67bSgUXZ7CfvNaqeLDsTvxZ109DZESWiHn0TT8GUR8xPdu51niqEa
	 gPxunqSHLwG/vQbjf+vv3NjuNQMKp8FPnYJhgj9/svpAxWyuzhXHbqNfMlcehoKYaoJ0v
	 WekrKD/wseE8UXBuMdAIqWy+W61d0koQHollyrd5+5Hoq0W2sDyjOnWTPec8hWzV4z6e2
	 bLy3Dxt118TI06Am4GxlNxiWwXGJtMoR1DKZAH9wxCXj7lSGgJSDGtqFWhW/+Wm6SOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GUeXQlhB;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B7606B89E
	for <brcm80211@lists.linux.dev>; Sat,  7 Nov 2026 15:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 666B7606B89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GUeXQlhB
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2717003eec.0
        for <brcm80211@lists.linux.dev>; Sat, 07 Nov 2026 07:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794063696; x=1794668496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJIT6szgZ3iHxWbb4OfUYZIiW48z49jGazGBAmmxbcw=;
        b=GUeXQlhBQ3IFT0BVnQSik6UTGDnjLIRLejultooywX83VAv4hVb5iO68irBz4fuoB8
         0F0/ugjg98Y0dHPp+bAy0dHxl6MCRLoK0GPU5Itomvd8ClGyb5XdSQQk6Btf5RMV04M4
         C4BQw00f1l4Kon3gWh4IBKz+mTnKmEqkO+QcpiCaUo5ypvAfLUk+8Jy/eI+1rn5Ubfp9
         +j+SXYEZIkPuFdk3SvIDI03EkP/x7DinUDIccuAKS5hPF2oZyrVygrAg/BcNKY8qI8ue
         RuzKbe8aH184mB1Q0N1IZdBjA6V1irFuYGOCNtoRD7sNVVg7bMNKLnZlxCIoLwgEfm9Y
         LVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794063696; x=1794668496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJIT6szgZ3iHxWbb4OfUYZIiW48z49jGazGBAmmxbcw=;
        b=oxY8bBfOrmd3C4y386lvTj92Xg9LQYtYmPw6HcBLF09TDvVO2pGp4XEhNQgOblqflA
         hJ+ST5SOsD3C3q6w0Qd/HbDdz4yKNVGjh0lwx4lDo7pjF3O5cTHtBxGMLN+cJA6GPHby
         xJCMK5hXSNb2txsJO/yBfMWFgKm9w5eif1zut9w5bTUG+H1qiAoLiAZmwsBNFCAGeo/V
         4N7qggRUH8dB6Ff36GERoPIVWKxzWFEkZAuAqjrLEKshv2DhfhYIbKPYXIGNINIm191T
         NnqlKNWiAqH+kxzCpncJ39cM105pN2sCWWVdHowNyWmZkNqK8kFiRP7GcwXr/jeWUj3b
         lOzQ==
X-Forwarded-Encrypted: i=1; AL+hErHsn2unlA/pQbZbWBWuCaFH6T70NsHW7GPWHTByMk5Z0xEIB4rhBxim1PKufMfBm2K5HYw5+qktblo=@lists.linux.dev
X-Gm-Message-State: APuU4Z9gDxJ/k8jFBuuqEF1LNpiiklvsfrnCKaoSl9bGZcFoIqNvqMQD
	D1sp0zkky1HWwDD4EFBdqNR5arEHz2mAyaNSKEgustcXjRcYthq4pbKC
X-Gm-Gg: AYBFou3uxOZiDhoLOsZXAL8KexfNsDqSf44YzfOWBqZmc3VW/JVWr0zSZ6ncpo3mbX9
	4eIOntRfMnCQLsWcLeOQyE8hfTAWfTQYLbrhcbUlIJuB3HC1HYOR1qurpTdedII6Lyc9tz54mFz
	zTXeMU56z6s/ZW+8mE0HS7YxdF3+dq9N3FutkeI31EMvRxZccVi8CHooHQgzF1xyWkDkIL/bCQS
	NYUkqZq8oDaVK6r1loiCyAi8gKZBdGJJgQOM9nuMrFl11L5gooaOKSpvdlgE6V/xEIiamaR+eX6
	rBJx+HKvG76/AJ9z+uj5RafakH1A4xEkXxIRnPsVD6Dw7zHznqebOqvh6RsFNdj1/ir3F7F89kv
	sxfZicl+5QWQskaiVp+kIYxHWQZ5kpBQDa36/wrYc+5XRJGOfB6RetIoWxKqEc/sV77VNjRY+cz
	LCkSE3cDTfma9E2Oj29RRQ2crly52Xs2AHL7EOSGR3sCLoqDNoDnNz2KfglhzFyqfsWJivcguU6
	UliLp8ZALMVT9jE1FVVEyW8QUKgl7v1qJAwXcUGFOULTbZyz3QGRdqBy6zPCXj+S1wMtESJ5W3h
	xR52pch0eNekQQQk2SkvrQ8uiPDnz2R6ichS8j8IOFdZSY3yT3I=
X-Received: by 2002:a05:7300:c7c3:b0:36c:bf78:967e with SMTP id 5a478bee46e88-36f75a2b06bmr8006122eec.10.1794063695913;
        Sat, 07 Nov 2026 07:01:35 -0800 (PST)
Received: from KRHW1CJW23 ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44a5fsm15540799eec.7.2026.11.07.07.01.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 07:01:35 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Jason Huang <jason.huang2@infineon.com>,
	Shelley Yang <shelley.yang@infineon.com>,
	Avraham Stern <avraham.stern@intel.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Girish Rudrappa <girishbukkasagara.rudrappa@infineon.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	kurt.lee@cypress.com,
	Carella Chen <carella.chen@infineon.com>,
	Chi-hsien Lin <chi-hsien.lin@cypress.com>,
	Darren Li <hsin-hung.li@cypress.com>,
	Ryohei Hashimoto <laurel.medalist12@gmail.com>
Subject: [PATCH wireless] wifi: brcmfmac: skip beacon fixed fields when parsing SAE PWE rates
Date: Sat,  7 Nov 2026 23:01:11 +0800
Message-ID: <20261107150111.12424-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_parse_configure_sae_pwe() passes settings->beacon.head directly to
brcmf_parse_tlvs() when searching for WLAN_EID_SUPP_RATES, so the 802.11
management header and fixed beacon fields are parsed as elements and
Supported Rates is missed. When BSS_MEMBERSHIP_SELECTOR_SAE_H2E is in
Supported Rates rather than Extended Supported Rates, an H2E-only AP is
configured to accept Hunting-and-Pecking as well.

Skip DOT11_MGMT_HDR_LEN + DOT11_BCN_PRB_FIXED_LEN first, as the SSID
lookup in brcmf_cfg80211_start_ap() already does.

AI assistance was used.

Fixes: f3d9c56e6eb2 ("wifi: brcmfmac: Set extsae_pwe parameter to Infineon firmware in SAP mode")
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Compile-tested only; no new W=1 GCC/Clang, sparse or smatch warnings.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d871260..0c91fdc406bd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5144,6 +5144,7 @@ brcmf_parse_configure_sae_pwe(struct brcmf_if *ifp,
 	u8 ie_len, i;
 	u32 wpa_auth = 0;
 	u32 sae_pwe = 0; /* 0 = Hunting-and-Pecking only, 1 = H2E only, 2 = both */
+	u32 ie_offset = DOT11_MGMT_HDR_LEN + DOT11_BCN_PRB_FIXED_LEN;
 	s32 err = 0;
 
 	if (!brcmf_feat_is_enabled(ifp, BRCMF_FEAT_SAE_EXT))
@@ -5167,8 +5168,8 @@ brcmf_parse_configure_sae_pwe(struct brcmf_if *ifp,
 	 */
 
 	if (sae_pwe == 2) {
-		supp_rate_ie = brcmf_parse_tlvs((u8 *)settings->beacon.head,
-						settings->beacon.head_len,
+		supp_rate_ie = brcmf_parse_tlvs(settings->beacon.head + ie_offset,
+						settings->beacon.head_len - ie_offset,
 						WLAN_EID_SUPP_RATES);
 		ext_rate_ie = brcmf_parse_tlvs((u8 *)settings->beacon.tail,
 					       settings->beacon.tail_len,

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0

