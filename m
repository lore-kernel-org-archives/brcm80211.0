Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8571614E2F2
	for <brcm80211@lists.linux.dev>; Tue, 17 Feb 2026 02:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771295463; cv=none; b=HPgSrKcTPJXl5Ggbe7Lu6OohEgG4vaTowPMENCxnXo0/SvYwTaKptRHuX8N28F9ycvenjsax0AFlWaRhrVa4eyaMxggM31scfpDUhfWn+7vrwJfG1ZvWgZ4ZENKRRWxnkVh3sK3hVB3HLlzy0Nis4UP0SN3gxTuB/72NN+NOTCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771295463; c=relaxed/simple;
	bh=kObS168gQBNE3xpbI2vaprxcEmPUWL2LSLVxVbKppr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HGexVWJ83r87cd9y1f7tf7HY7Sfub9gs395DN3+TpRhbdH30opKgEFCGrEvpWAjVMbXYlYRg8JLp64apI05R4QX+u+JSyaaYq9HDcZQrAeaYtBv00MCWuRD29BwVmdCD817rCNfKVwNm0sHOH/cGmvO02naKDxQCypAM2KS42rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk0kmACw; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk0kmACw"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7927b1620ddso45677947b3.0
        for <brcm80211@lists.linux.dev>; Mon, 16 Feb 2026 18:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771295461; x=1771900261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fworB1P/Jzlnt8opUorAnuBCM+SRM92++aaBkD5qF0=;
        b=Tk0kmACwdgXHOXjhDfoALXKvfO0QJIE04ni+7IsIaZp5C5aoOO7dTKYRfLWswhe4SZ
         D4PgOosItusXMIhFG3j6zscj2I7co0tVd4np6d+8lSdVyRfDFi4E1awdNfis1ZkDUZ3F
         yBMzajplBuYOCD4goDkUaLwzCwQgE50544nHDJ5HyEmoSwYJ9Wn9nX3AP0r3YkdqTp0W
         FUyLO01/RrxTHc5uJG6nzjMhKNdkxhKaTNMHvUefqzrFhhg05GyZgboCUGC3Pn4leM0O
         ub109QPlXemeJCnYeDnJKfM8jB1bgDtKeC9bKqLj1kCyJak2c5MR+kaa/2WmFGHkcuFK
         5hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771295461; x=1771900261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fworB1P/Jzlnt8opUorAnuBCM+SRM92++aaBkD5qF0=;
        b=TcW8KGIChk3ypJ/I4W9Z/oCMWcvPG7TCJKUSA/tDCxVqIH17jZKNoPYfZAL2GVIj/q
         Lax3u5n2ZtNh/d0x3ESK8+1Xx8QK8OgzXTESxpO5L12Xcmb6SqlI7fo7rpWEtmG0XezW
         Hf0PoI5zDBRJvMoSlRGETwVq2Lnk2kw+U4eOviB4dttdPJ9vaQLEF/punLyFiHmqA7O5
         7JnkRq71+DHXB2RSZM2RDuNV5caqq3iiVL54d5W2MI8u3GNlV2ogyA6gm1EtrXFSQg9u
         FhG2BTCSqAss/j1+ejEc8X/+3Wk9VATa2SrfGfzN/FrJj9OAfwOQ2AP+KPZv6IXOQr4E
         45NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKBRWd933crUfAnCSvJM24PHi+8jrzYuYYlnlVgFUAPOirVyffzBG3ot2lKBb9mqaLiEn599JQqZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFr14Byd1gs4AVqhr+JjupyHVfM6EXgDZCh4d7y1WkcRV5xavW
	J4ToeUATTOg7GLuuQbLYpoeegh8P8AFipyqtuy2NDw0DHa6fzoHnuN1v
X-Gm-Gg: AZuq6aIvQB+GKK1oPSe+nH+JKghQi0XWuf8rFLcmzDgzYfozpQWtBpBpoaFLUrrVMyQ
	Emyd2LjsmKGFNXDDJN0i9z5EgZoJxGPW3H/Ni82WblexRtKCZMJOaR+lwCa9GfxKDTJenymZfe6
	4Ccp80ZvOoWCS7GbLin8fJTBFgLTlSDTgilXGYnOCNvxcbYcXaNmF10gbUP/Mj+LOwDYGW52P2q
	7Fk9d2Vv5PVoNimL2zvljFTzsTItMKJh5JKDXdpDLTnuClNQxDlcy5fkcjhDcbyCrQYHqumqGCu
	dl6M4vwtHMLBshvFJs9kMNxuD/QA+26ee3mfXoiISNYMsJDrFdMW7d7NcxgDT8aqztbj38UX2ci
	Bo5xW6F4xiItBCxvVmT5SnUBQsfOC1fI/SsX2sb4hLabqfOqD4XQn8XUkOYoGq7nP/7m1ZTREvG
	F3K4NxcUG1G0fX8e5YuEmhVHiGOgy3flCRYqZunVCCaeIgOGe2jN0QmelBKNbQ4HcUp/fXCTtNa
	Rn36Oo4GrQRgv5wpUKNy4hvn8a7OJx8xgXRHGPrGec=
X-Received: by 2002:a05:690c:67c8:b0:794:c04d:bcfc with SMTP id 00721157ae682-797aa851693mr89684017b3.13.1771295461531;
        Mon, 16 Feb 2026 18:31:01 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c254daasm106806247b3.44.2026.02.16.18.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 18:31:01 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	johannes.berg@intel.com,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] brcmfmac: Fix error pointer dereference
Date: Mon, 16 Feb 2026 20:30:43 -0600
Message-ID: <20260217023043.73631-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function brcmf_chip_add_core() can return an error pointer and is
not checked. Add checks for error pointer.

Detected by Smatch:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c:1010 brcmf_chip_recognition() error:
'core' dereferencing possible ERR_PTR()

drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c:1013 brcmf_chip_recognition() error:
'core' dereferencing possible ERR_PTR()

drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c:1016 brcmf_chip_recognition() error:
'core' dereferencing possible ERR_PTR()

drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c:1019 brcmf_chip_recognition() error:
'core' dereferencing possible ERR_PTR()

drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c:1022 brcmf_chip_recognition() error:
'core' dereferencing possible ERR_PTR()

Fixes: cb7cf7be9eba7 ("brcmfmac: make chip related functions host interface independent")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 .../wireless/broadcom/brcm80211/brcmfmac/chip.c   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c
index 4239f2b21e54..dcd8a296de10 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c
@@ -1007,18 +1007,33 @@ static int brcmf_chip_recognition(struct brcmf_chip_priv *ci)
 
 		core = brcmf_chip_add_core(ci, BCMA_CORE_CHIPCOMMON,
 					   SI_ENUM_BASE_DEFAULT, 0);
+		if (IS_ERR(core))
+			return PTR_ERR(core);
+
 		brcmf_chip_sb_corerev(ci, core);
 		core = brcmf_chip_add_core(ci, BCMA_CORE_SDIO_DEV,
 					   BCM4329_CORE_BUS_BASE, 0);
+		if (IS_ERR(core))
+			return PTR_ERR(core);
+
 		brcmf_chip_sb_corerev(ci, core);
 		core = brcmf_chip_add_core(ci, BCMA_CORE_INTERNAL_MEM,
 					   BCM4329_CORE_SOCRAM_BASE, 0);
+		if (IS_ERR(core))
+			return PTR_ERR(core);
+
 		brcmf_chip_sb_corerev(ci, core);
 		core = brcmf_chip_add_core(ci, BCMA_CORE_ARM_CM3,
 					   BCM4329_CORE_ARM_BASE, 0);
+		if (IS_ERR(core))
+			return PTR_ERR(core);
+
 		brcmf_chip_sb_corerev(ci, core);
 
 		core = brcmf_chip_add_core(ci, BCMA_CORE_80211, 0x18001000, 0);
+		if (IS_ERR(core))
+			return PTR_ERR(core);
+
 		brcmf_chip_sb_corerev(ci, core);
 	} else if (socitype == SOCI_AI) {
 		ci->iscoreup = brcmf_chip_ai_iscoreup;
-- 
2.53.0

