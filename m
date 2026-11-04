Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805354;
	b=0Z4IqHprPHG3+wCVHwmk1uMvtyFjb955im3rqoUWKUbVUd4UpJnsrOzWKVbNMpYz3Inr
	 HOIe3LIjYG90IeSh2abCRA2qg4tMBE7KMB9i/a2lfiy5c6az5ZhMHdBw3toNdvThE730M
	 fw+Ko+VjArdAULCRKVpiG+D1OilULlm0TfIO9xggbQzB1Pn/6cRlIleMpDF4R8Vahcs4o
	 vNE4Ak3CRiEscn23fbj+XioZMasTNxQb0WW7lu+7aqfqh2OUkd4UZRnGOQrsytgwEU+f2
	 szGd09bxo9lHYH/XLChTxtoz61PrXmDIIDZbDRtjI4Wjhwl+JAlBiA79iSs6TLVX2rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805354;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RZ5WPjZzaVY+6r6LLxwe7gwm/oymL3GAB8pDQ1hmcnw=;
	b=Sm6Ox5CbppKdnhEJ0CuhC6d5C2EnEfpxmlutfaFj+Zkkgrd/2A8xggQONtIQexCB1suG
	 eJztdttw/y0gAflxXwsN1NWBSlIDRYJfcBBHEFoU/KcBD8GVf2gX29nR8frco2O/3zqdv
	 rgDttWOHE9ru2jex9S4fRf/6A8juCNDda94mub8lwkCnm4yYm5DRogx/5zSVtExB9Wq/u
	 jSE6XDbspi8rpoMgqrSLDhgPH49GRciJe6ipyA+KceIkckQmSDuqc2EXl4Z/WVnCILC6a
	 MM6zkp5QbjAW95RfjzCMR9j4SHaQLVyuTUiuXj3KsHoq2gHDGwDoa0k26h2xmem69XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=lkw48PDD;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A13606A31B
	for <brcm80211@lists.linux.dev>; Wed,  4 Nov 2026 15:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A13606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=lkw48PDD
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793805351;
	bh=ast6NtBzcNECjQ3ZD4NI9+gmOmEnc/SeI8dAd+pKc1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lkw48PDDORemIGjUcdL9iF3mrtajVHWuFzcFokCDSeFZWd/1naHRO3RnwOafCkWyz
	 P7Z9dYqr+0e9JCr+ximOUzRXE4r1pPqwUUyQSBcKPFIHRXChlvG7gDxZrMMJpBw3Gk
	 0FaIiY8lhjyG4PVjOsjq2f31dSH7LWMAAbWwpVVLMDVtkhfQUjuqYoVHSlpZRwe3dw
	 OKMVsmrrxfaFI6z7oiFMKLsFwpQXmxmik3pUEo91W4GscVgSEyETGllSU963XVHTOG
	 9rvxDYy4kKsWmuIN894Ajq9ZufztYDrDVhinIceBeZMCZy+SH1fVVB8Ss4Vv9ckP9w
	 ZKjx4O2sNgMMQ==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH 1/7] wifi: brcmfmac: match firmware capabilities as whole words
Date: Wed,  4 Nov 2026 16:15:41 +0100
Message-ID: <20261104151547.70333-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104151547.70333-1-dev@deq.rocks>
References: <20261104151547.70333-1-dev@deq.rocks>
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

brcmf_feat_firmware_capabilities() looks for each capability with
strnstr() in the space separated reply of the "cap" iovar, so a
capability matches inside a longer one. The Apple firmware for the
BCM4364 lists "hp2p" but not "p2p":

  ... evt_ext lpr_scan bkoff_evt hp2p rng_reseed arpoe

The driver still sets BRCMF_FEAT_P2P and advertises the P2P interface
types. wpa_supplicant then creates a P2P device, which fails because
the firmware rejects p2p_disc and p2p_da_override with
BCME_UNSUPPORTED:

  brcmf_p2p_set_firmware: failed to update device address ret -52
  brcmf_p2p_create_p2pdev: set p2p_disc error
  brcmf_cfg80211_add_iface: add iface p2p-dev-wlp3s0 type 10 failed: err=-52

Split the reply at spaces and compare whole words. The trailing spaces
in "sae", which kept it from matching "sae-ap" and "sae_ext", and in
"fbt" can go.

Fixes: ec64241c9fd2 ("brcmfmac: obtain feature info using 'cap' firmware command")
Reported-by: Aditya Garg <aditya.garg@linux.dev>
Closes: https://lore.kernel.org/all/MA0P287MB021718EE92FC809CB2BB0F82B8BD2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM/
Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
index cc19e5e7ebf..b324eb53a69 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
@@ -42,10 +42,10 @@ static const struct brcmf_feat_fwcap brcmf_fwcap_map[] = {
 	{ BRCMF_FEAT_MONITOR_FLAG, "rtap" },
 	{ BRCMF_FEAT_MONITOR_FMT_RADIOTAP, "rtap" },
 	{ BRCMF_FEAT_DOT11H, "802.11h" },
-	{ BRCMF_FEAT_SAE, "sae " },
+	{ BRCMF_FEAT_SAE, "sae" },
 	{ BRCMF_FEAT_FWAUTH, "idauth" },
 	{ BRCMF_FEAT_SAE_EXT, "sae_ext" },
-	{ BRCMF_FEAT_FBT, "fbt " },
+	{ BRCMF_FEAT_FBT, "fbt" },
 	{ BRCMF_FEAT_OKC, "okc" },
 };
 
@@ -231,6 +231,7 @@ static void brcmf_feat_firmware_capabilities(struct brcmf_if *ifp)
 {
 	struct brcmf_pub *drvr = ifp->drvr;
 	char caps[MAX_CAPS_BUFFER_SIZE];
+	char *cap, *next;
 	enum brcmf_feat_id id;
 	int i, err;
 
@@ -240,10 +241,15 @@ static void brcmf_feat_firmware_capabilities(struct brcmf_if *ifp)
 		return;
 	}
 
+	caps[sizeof(caps) - 1] = '\0';
 	brcmf_dbg(INFO, "[ %s]\n", caps);
 
-	for (i = 0; i < ARRAY_SIZE(brcmf_fwcap_map); i++) {
-		if (strnstr(caps, brcmf_fwcap_map[i].fwcap_id, sizeof(caps))) {
+	/* Match whole words, "hp2p" must not enable P2P */
+	next = caps;
+	while ((cap = strsep(&next, "\n "))) {
+		for (i = 0; i < ARRAY_SIZE(brcmf_fwcap_map); i++) {
+			if (strcmp(cap, brcmf_fwcap_map[i].fwcap_id))
+				continue;
 			id = brcmf_fwcap_map[i].feature;
 			brcmf_dbg(INFO, "enabling feature: %s\n",
 				  brcmf_feat_names[id]);
