Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916055;
	b=wVckrBcUl1fiTOA39HmlmtWH6qZD9T7OfP35XyOgri9ebwxY/5tKrOr/irjXR39U0RTo
	 Flx2NhooxG7sRXJxAXCQttN1s6i86EyE0ZUeWU1CX5zxNpOk9PfUuV7XJkfsAYtusDWEA
	 cF72UYNDLswXsbAmlN2F9235RojV+6kEqTASROncV/2xgwrNdb9KbILXdNLE0XlBgu6La
	 VqPgMRtYcA6xJUicARaKqE1P97iqUnNeQWCizvpyf4z5koKIy4A57tPNuLCskGySbdZXF
	 HA8ZYdbpntkGvMV696jjDQBNiP7mz5VisaYgvB7IPlrBLuETYxeJ6WnBPkIDda5PFYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MKfWIAkpQQcvlzsGiHXUHQerg55g/nZSDN/398RwIAM=;
	b=Ig9RoXlXCbLiqNGANU7ALKf3oYBsCbWGD7qxurud9Y848vkDdOi5njMuXfY3qA+AOPkk
	 gGMQbDbFL0CWP4mKBlqIdeCrMd5GTcaVWV8GTyxOOzV2BVUVr9mWx2fgH9bA6E/HOiJQa
	 2uds3F/mxErSrefTcr4wsCz2zb7YUBs7qcGbfoyskaF2Y2sHLGucf7uzGluD/uz4vRJPi
	 kG2jQiG6qzO2eS/4lDf+hqdcbl4fs+kvZneTM7/u0p5B+nukCxYawSXEiAsD4laFo9IaC
	 yvol5T0iGF44991IYWQNsq8o548eRRLiO08omRZY+JiSbRkKG5xeLF9xFw08KAJeYZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hj8JpfYi;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DD5606A32D
	for <brcm80211@lists.linux.dev>; Thu,  5 Nov 2026 22:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DD5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hj8JpfYi
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so33429f8f.3
        for <brcm80211@lists.linux.dev>; Thu, 05 Nov 2026 14:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793916054; x=1794520854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKfWIAkpQQcvlzsGiHXUHQerg55g/nZSDN/398RwIAM=;
        b=Hj8JpfYiNFZm8gDx9rqAjoE59kHievYBn4LlMWytid5GR4Wwy8EHejU4tbjnp098XH
         bdXgGymsRO1ACLQ0DhJY3kGGXhHax/6ASqazQ2iTkprUrmmaSZMyNc83B10rRjO50t6s
         Bi0YitImpRBduGHVH30EYl2X85dhjxbqxvlMC1nilmGMW6rQ2BFETYSDJnTeJvLAoJTw
         X13juax1eWMTgrdcSipHdw2Xxns5ZAGZJLUQV/Vy0j4kuYfXXaAOJrMuRNBXmhAQ3457
         01iJJodChweUrKvZf1rGnp1xbN4vrdIeUSTqQVCVSeE6tHu3JtwEWXZ3DvORKSCswqOe
         D+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793916054; x=1794520854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKfWIAkpQQcvlzsGiHXUHQerg55g/nZSDN/398RwIAM=;
        b=IWEYnIa0+KTAprg0ZtvmCXWkFO55gygsipdmUX7dH9Dau8A3CsoK8f1A9jrdAOlapt
         0qYQg/i0F7MU3fa+JAma8hZ0eyQtBklIHwyUQBH5cDx36lGJcuCF3v+8ewDXj4exF4J9
         q3MTJNXa3b/bXJunQHoApAFvY0l4HYXLiumGrqR7wuF79wqGngu1BcS5tHHU9XSYwsji
         IjfJedoyzRVhnI5fRtU+kxnJ1TGrJVFBKg2/kUDVrbVZ7YBuuGtODHAAgEjaGNohRrJw
         rcFFKI/O3/RW8XSjGc1MiS0R20L4cQ/9L/nA/OBRzez4uDPm/fO8dBUR/4fkuIBZW/Ys
         n73g==
X-Forwarded-Encrypted: i=1; AKwUvBw41v7vz0CK07Idt3i8AQlR4OXomErdRY63Qpk36N6brvEH9wZlk3rK4Ddrq/OFzzm83pdRiW7qayM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ozAmgkAwyUVtnsXOS+yZbwmvGUEeVOQ4sMRBlrkrfHr3cI341
	ygoc75rEMKOzFN47JQiRBt5STskCFqLmVNhzRw9YJFqpji8q8ggazidF
X-Gm-Gg: AYBFou3J3rAvQXV92+mXVdCPMAGzEizszvsV/lvOi3xA1yxOzqAOrq3/l2M6vgyKXk7
	vdEkJYfhdbjTKlsJTijU6XB5FI9Y4UWPsRded2SOpntU2CtxxWaav9CpkgLyyfo+tOes5DvB0Uy
	/Z9lNtTzyCCseB7TB5AsIpzTepCRrviJxYcM4faR1rNtwKRPDHX5ZUNOYH8CKDRgIONY2DC4hia
	StNRcpUUouQ+0HSyvVJBD2Yf4E4X9ZLdhIGLknj+N0E2jVBbQP27TWNoPxkYb+Z3p2h4tYaPk6x
	aVUO9oVnpIkV13FGsX71Y1CtWoyX/4ZI3n/GqBGLSErr3crO0/JSdsZzVj42L0GYHfk2pMjBG7j
	2+bLcVoNMKKnKSkAsvkiRYa+Nhox/Q5jaSGzlNN9hOaMzFjSEJEB5n8Ec21sPAvmedtXx68pMBO
	zPhS1cvKuC8NY210K9IVrx3IgYgLaX+cjmPTXfs2bELHbj7LDyDW2AB2SvfMBD9jmFbOivMwiBb
	L82NA7vbC+jKThLZic8Oo9pdW0Donn+iiQF67rjL7fCBwezlue/t+MYER4C7Aan2ze4vGseEWvw
	lcxw85Qk+in/H6xA23TBnvEHrs0+r4FD6oH1rx4uhbk9vMA4BOvsCI0UGCDcPZlGO69+oGXln23
	fm/kTpSaB
X-Received: by 2002:a05:6000:2913:b0:48f:88ad:7b54 with SMTP id ffacd0b85a97d-492760da7a2mr1778649f8f.19.1793916053781;
        Thu, 05 Nov 2026 14:00:53 -0800 (PST)
Received: from soeren-MS-7A32.tail37253f.ts.net ([2001:a61:13ae:e301:329c:23ff:fea4:379])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm11922212f8f.48.2026.11.05.14.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:00:52 -0800 (PST)
From: Soeren Coremans <sorencoremans@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Soeren Coremans <sorencoremans@gmail.com>
Subject: [PATCH wireless-next 2/3] wifi: brcmfmac: pcie: bound memdump to the mapped TCM window
Date: Thu,  5 Nov 2026 22:59:53 +0100
Message-ID: <20261105215954.184290-3-sorencoremans@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105215954.184290-1-sorencoremans@gmail.com>
References: <20261105215954.184290-1-sorencoremans@gmail.com>
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

brcmf_chip_get_raminfo() reports "RAM size is incorrect" on a dead
device but leaves the bogus value in ci->ramsize. A following
brcmf_fw_crashed() then dumps that many bytes from the TCM mapping,
which is only as large as BAR2, and faults in ioread32():

  memdump 0x00200000+15728640 exceeds TCM window 0x800000

Remember the BAR2 size and refuse dumps that do not fit. Only builds
with CONFIG_BRCMDBG create the memdump, so only they are affected.

Found and written with the help of an AI coding assistant (Claude Opus
5.5); the cover letter describes how.

Fixes: ff4445a8502c ("brcmfmac: expose device memory to devcoredump subsystem")
Signed-off-by: Soeren Coremans <sorencoremans@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 02c58de67b82..5abc85013110 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -343,6 +343,7 @@ struct brcmf_otp_params {
 
 struct brcmf_pciedev_info {
 	enum brcmf_pcie_state state;
+	resource_size_t tcm_size;
 	bool in_irq;
 	struct pci_dev *pdev;
 	char fw_name[BRCMF_FW_NAME_LEN];
@@ -1669,6 +1670,12 @@ static int brcmf_pcie_get_memdump(struct device *dev, void *data, size_t len)
 	struct brcmf_pciedev_info *devinfo = buspub->devinfo;
 
 	brcmf_dbg(PCIE, "dump at 0x%08X: len=%zu\n", devinfo->ci->rambase, len);
+	if (devinfo->ci->rambase > devinfo->tcm_size ||
+	    len > devinfo->tcm_size - devinfo->ci->rambase) {
+		brcmf_err(bus_if, "memdump 0x%08X+%zu exceeds TCM window %pa\n",
+			  devinfo->ci->rambase, len, &devinfo->tcm_size);
+		return -EINVAL;
+	}
 	brcmf_pcie_copy_dev_tomem(devinfo, devinfo->ci->rambase, data, len);
 	return 0;
 }
@@ -2145,6 +2152,7 @@ static int brcmf_pcie_get_resource(struct brcmf_pciedev_info *devinfo)
 
 	devinfo->regs = ioremap(bar0_addr, BRCMF_PCIE_REG_MAP_SIZE);
 	devinfo->tcm = ioremap(bar1_addr, bar1_size);
+	devinfo->tcm_size = bar1_size;
 
 	if (!devinfo->regs || !devinfo->tcm) {
 		brcmf_err(bus, "ioremap() failed (%p,%p)\n", devinfo->regs,
-- 
2.53.0

