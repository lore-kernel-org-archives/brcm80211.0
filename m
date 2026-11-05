Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916053;
	b=eXWD839AUmrD5Hm8yO1AIZ31+UJYvq2qifgU5Wa/GCghmFIuRDSfYmJdCcjtVrnEb6wc
	 IUbl6H39K/l9ICkHaVlANjYvRY45oyl45UJEdwH13Os/2nfCp2Dz6UmQRakBfKZ3RWSok
	 wDIzaqulgQiqWlFzizZbW9Ts4Qhf6UbGqG8LVPop1HFx9oG6vFeEiLFLMyZcSvGF/Pe+o
	 wZ5FTe9qWokNJEp7rtxHpSyEKgj9YHXpXNx85lpqd5ja2pw8dGR+n9rcsymfX5YGwEZDH
	 QI5jmxZ4MtzdxOQHVU5EpuHqqPCYcFlXqwG77z1bGLyDvXv1FQPMe2pRuNGJ4QwllTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EfUxS4j8KiqdcDZ0OsuVJwqrTRdeU5cL78NKs2afAZ0=;
	b=vEigbXWI8Def98tug7IrCrej4c4MtqswYfu8d2VZq45sAoIj2zfwj2jyRHOLXReXNOdf
	 VlJmdoo6DLitoRwpN1ZcrpntzVCZSeXUms+PYgjVSsSInWSYxAsz7MdI4t2tpcZKO5Cjb
	 pM+vq0h4xaJzF9E49flxJ4YD06bJMJSEnSGlNawZYdD/UpQzmn7aJqSvxrkMi+cMITGWs
	 zmSRaOVFLvUzOPu486pcbYpsa2e4TWzSOjcCa2SlBnSG0HaoPkxDrDQ5ddMu4jSEPNmTD
	 CVtLGAyAp34HIxqHVIE1FJ1I19o3cFS7UgvO2AedaslfsmZ7U8T0TGaipMhPKrZXkqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkQr1ybm;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E836A606A329
	for <brcm80211@lists.linux.dev>; Thu,  5 Nov 2026 22:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E836A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PkQr1ybm
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso727349f8f.1
        for <brcm80211@lists.linux.dev>; Thu, 05 Nov 2026 14:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793916051; x=1794520851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfUxS4j8KiqdcDZ0OsuVJwqrTRdeU5cL78NKs2afAZ0=;
        b=PkQr1ybmN53e9JnBt8w/10ouQWrhtKYICUuDsSJ93wXm2gpPcUZlVRwhFVLdcSQO1r
         vrDRUVUqDp9ODMbx3e9Z12s0oWD4+aH1DwoGDbyGcErtHEAv5PRV5OZQG7jp4rzXz1wv
         rcSDCo8+UOq/ToWpgSDcQFe64f+mzPKjaN9jCBdb0m9VgH41ATnIhi8X2/oJ+sLDmIdW
         RtQFHNExvIYMdBD9HIhcHhJpbY9ICDL11QdvFNyDEiRMPv01edriV2XiSdJIM24mCvD0
         jNhp9fwWq/++lyEMbqAGRKnZev4FY+ukQHRdgmmFKH7DP2aYfx+Fsh4CRV2qtvAMaC9M
         vutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793916051; x=1794520851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EfUxS4j8KiqdcDZ0OsuVJwqrTRdeU5cL78NKs2afAZ0=;
        b=OxJsG6lbNPb/qqpZRcfBngGLUsakMg2TCZMPuJ/k5SyZ8zEFzE2hXTpgS5tg/H8nA2
         XOG+EguKn+WaD4r4sykyLbCDrxGuG8IuYOQ/OwZnGVNTT0pldYxFZXwXuDhe5y1wbGlk
         tBLTxqx9mjHCBYjEPWRyrURU/4IkiLyfT7nXOnbegvrpenlWetkGYsgEaWihazU5anZC
         FXmQM9WsOhtXXOAWmsKrVHBrPOSmFD1wfPMwd9oTtx39rihtnzSvXMQEuS418v1z3J2F
         F/GpozuQEcJLPUIPe9ZGliRu6CR6u9VzwHRygiD3raOl81UGYIcYg81cUf+dzQAtokWl
         1glw==
X-Forwarded-Encrypted: i=1; AKwUvBzG0/zmPntm0ZGYLFZi4V95OXgqIPdiD5PKClsD5T06Crf6Eya/cz3/oq1SEH5zMuiN+rvIFbkP77M=@lists.linux.dev
X-Gm-Message-State: APuU4Z9vGbe8EVyi00pnioU0iZdmWUTfEwU2UGjd1R5N3r9uObTUPxXu
	MKPf3/4gHh3NfU7pngMcSxM0Ugll8awMv9jGoKXhRLfxcSR6k24tgK0u
X-Gm-Gg: AYBFou2/IeDGVJPyhQfKZjLSQzTIrG5B5ivupp2PvzNpCi+7/dvfQ2jum5oO/aqkPK/
	MPqf4/OZPL93LpFc1/RCISHUhNKhS3iOjlT7mKtsa6H+0WrzBNBNl103c4sdl9sOlkHa2BYpl48
	voWHSPMY9IVaLL/aaqwb08CdSn06MW1Qc0mFgrLv3O8kWZRhkwRKjRProZ3+YpSqvXhG5Ji5ORB
	bUfXpH6jpgC5NVudhwpiQp1boDufz9Ib2HEmb4/48n8dnDm4JGHvgjJFiNwrjQJcwDjrE3PeYiC
	xP6V6kl4qLU4p42UAnDzxbOj6Ihr5MguuRsUpdQKa9RiLiqvLZRspOAee3kXq6k6y7xS1cMlwWx
	3Di/NYVPKmlbRsnh6OGv/wmIxUx8I31kUMtTmaIZT6KhbVpld9V3t58FCFw0dYDEh56FTMdxlH3
	3f7PZ7CbAjd0op1KOQgyi4qe+pjUrY+XS569LPQpbsXbyaqhliSzXoBtyqgZ6HFZkkPiyuUNrEL
	fl7RrizhM+16Na6Ujm84168gZIarZShMwrDkNphfEVJxrkpV9NeD+0sKgyHhuXbnEroi2YfEJwc
	/zby7vRSXxRwJX6drM1ILVPNSsDTOFPAEMA3eShu/prhFVlmXWc5krjyNbk7p2XRNaPcj8Jq9LQ
	kNBCJ/DEz
X-Received: by 2002:a05:6000:40de:b0:491:1468:a504 with SMTP id ffacd0b85a97d-4927997a35emr1710921f8f.21.1793916051004;
        Thu, 05 Nov 2026 14:00:51 -0800 (PST)
Received: from soeren-MS-7A32.tail37253f.ts.net ([2001:a61:13ae:e301:329c:23ff:fea4:379])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda203b6sm11922212f8f.48.2026.11.05.14.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 14:00:50 -0800 (PST)
From: Soeren Coremans <sorencoremans@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Soeren Coremans <sorencoremans@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless-next 1/3] wifi: brcmfmac: pcie: stop console read on invalid write index
Date: Thu,  5 Nov 2026 22:59:52 +0100
Message-ID: <20261105215954.184290-2-sorencoremans@gmail.com>
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

When the device drops off the bus, MMIO reads return all ones. The
console write index then never matches read_idx, which wraps at
bufsize, so brcmf_pcie_bus_console_read() loops forever and floods the
kernel log with 0xff characters at several thousand lines per second.

Seen on a BCM4366 after a firmware trap followed by a fatal PCIe error
(FCP): the reset path and the failed dongle setup both entered the loop
and never reached device_release_driver().

Return early when the write index lies outside the console buffer.

Found and written with the help of an AI coding assistant (Claude Opus
5.5); the cover letter describes how.

Fixes: 9e37f045d5e7 ("brcmfmac: Adding PCIe bus layer support.")
Cc: stable@vger.kernel.org
Signed-off-by: Soeren Coremans <sorencoremans@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index eca5f5f63bce..02c58de67b82 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -992,6 +992,14 @@ static void brcmf_pcie_bus_console_read(struct brcmf_pciedev_info *devinfo,
 		return;
 	addr = console->base_addr + BRCMF_CONSOLE_WRITEIDX_OFFSET;
 	newidx = brcmf_pcie_read_tcm32(devinfo, addr);
+	/* A dead device reads back as all ones, an index read_idx never
+	 * reaches; without this check the loop below never terminates.
+	 */
+	if (newidx >= console->bufsize) {
+		brcmf_dbg(PCIE, "invalid console write index %u (bufsize %u)\n",
+			  newidx, console->bufsize);
+		return;
+	}
 	while (newidx != console->read_idx) {
 		addr = console->buf_addr + console->read_idx;
 		ch = brcmf_pcie_read_tcm8(devinfo, addr);
-- 
2.53.0

