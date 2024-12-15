Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443738384
	for <brcm80211@lists.linux.dev>; Sun, 15 Dec 2024 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734264261; cv=none; b=vAXVOtlyfI7nTG2E+J5M32PL1ifoWB4CohemJa6HMeTsf1YGQJQm8z1B2BSVktaCdor2KJhF5Grc5KgmeJHNUo1T6mY73Tgngmq+TbpABvvyJ54HGK39AH7k9DGd7+bVB6lUAdr6xA4SSIOiXW5obpGUKeu1Qonmo4UZFZ8tMNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734264261; c=relaxed/simple;
	bh=+b6iKvlLuqWtfywn7QvZzgRUU22rSBSFV2jgP5NtGrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BFNGVUflSKLD+wj5K+vkpUDgTIrZPA93A/HworTeu5tebzqHoEO0XEHeq14Nf/BWtHLyzQ0OsFDo+MFg6XXOnezeh4FmhAoQQbFlbdQHiUeqy62mf2CCsGBdIJXRAwVzSfvst3+XJvhNztmcWLcaqOpnHvqn/UowPFZiFFqMORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eUjqf2RZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eUjqf2RZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21145812538so30566505ad.0
        for <brcm80211@lists.linux.dev>; Sun, 15 Dec 2024 04:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734264258; x=1734869058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAwed1M2/1NaIoNDU19W3YXa72LDxlMeTobwsuQvXIs=;
        b=eUjqf2RZWFXr7rZ6yhfCk1XtZfqrjOLLWrbDohco3XQy5hHM1iCWBglOEZUAystIY1
         0iYBKxgG0ZDcqstOT7W+nsbjTdJGawNioE1uXwBNiFvXB52zPQ/JhlP7bgU0JTUbvqOl
         DBj6nIGqglsUGQnMutVSZdykngR5BwQ/0Sjgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734264258; x=1734869058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAwed1M2/1NaIoNDU19W3YXa72LDxlMeTobwsuQvXIs=;
        b=ISFU1Bk4b27GbW+BuvUQX+HFH4X/QwjnpaYLMIKObH1JahpmMgbdViL6yB1WomfkYj
         YhAhbfcN5F/wiCLxhH20Vk82kgy10WlT8MFpopsaGWiXGjDZ4cVUgC0Z5tGOoivCYWvW
         5ifeSFp7qrupgdsaM5dN3tQ1LOCXDEyq66sTR412e22UX4Afr4hCVaXtDxB+GByozYGb
         xzY6khgD8d1kvm0A+dKily8kYTfYZsXbDGkUDTxfFs8xRuL9qnk/Ly5YDNuSOJXAAhFt
         wuOtFNcJmfSjqaveKVsqyVfk7a0JW1q9/R6LSwaX3itgQChkGquWcfWyPUPaN/WzmKOc
         CFfw==
X-Forwarded-Encrypted: i=1; AJvYcCVuU1rMCa6HMHkeTeIslEcxka4msMiW2OySjpmQ7ON9F2a/ga0QGmq9XM+kUNAZk55Y8wMHMGCyUFE=@lists.linux.dev
X-Gm-Message-State: AOJu0YydeQSaQ5I7ZeqrOyk3+j21D5H7n8Wo/OxwUONWDc/otD1iqrcv
	8E+xMwV0J+bEK8BpL8dcecLITotmDT+0R/llDTf100EZLGEYpzMVDL0gkvcC3Q==
X-Gm-Gg: ASbGncuq27pb1g+G3ZnHX79bpzGEIH/ImijuLGrBpX7WkbEO2t+fMSnvRIwvLn1PFLc
	3xuZDisZ1r8WOjXj3HtXFstIgZzHyzeZv+fvAsLBMu62Voh1Gg/o6MekKV3RkQsceaH9++fFvIc
	1lOGTGkojMXXmcla6xOvFpvpx817EZkt/eV8Ys5T2v0eGYRNJAFBfMcXH/K4wzaMBws7v5PMnWt
	xdVZoRg+BogWOWhp85zTqcMbwIhYDH4H/KBv6yNAjN/kycOqgWG5fTQFyaNoiadXpp96L1f0Lau
	UEHA1lUasF0Sg/BZ+Nt5yw7ht1cELQVQfEkB
X-Google-Smtp-Source: AGHT+IHGFAXGUOth+H0w/0Z1s8mmAldX66+A6ykESzk8pWlRaq0eI7XNVRSVNGgjg9ykCHjuvQ4HUA==
X-Received: by 2002:a17:902:e5d0:b0:216:7d7e:c010 with SMTP id d9443c01a7336-21892a5d708mr120392675ad.37.1734264258667;
        Sun, 15 Dec 2024 04:04:18 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e720fbsm25257095ad.269.2024.12.15.04.04.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Dec 2024 04:04:18 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: KeithG <ys3al35l@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Ting-Ying Li <tingying.li@cypress.com>,
	Ting-Ying Li <tingying.li@infineon.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFT] brcmfmac: Fix structure size for WPA3 external SAE
Date: Sun, 15 Dec 2024 13:04:01 +0100
Message-Id: <20241215120401.238320-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <CAG17S_NqbLogvTWyoYobZ6kOpfXHnScfm4-dB1EqsmpB+q+zxA@mail.gmail.com>
References: <CAG17S_NqbLogvTWyoYobZ6kOpfXHnScfm4-dB1EqsmpB+q+zxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ting-Ying Li <tingying.li@cypress.com>

Add pmkid parameter in "brcmf_auth_req_status_le" structure to
align the buffer size defined in firmware "wl_auth_req_status"
structure.

Signed-off-by: Ting-Ying Li <tingying.li@infineon.com>
[arend: adapted path to apply to per-vendor variant]
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
index 18129adb5dc2..1cbe66526d82 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/fwil_types.h
@@ -54,6 +54,7 @@ struct brcmf_auth_req_status_le {
 	u8 peer_mac[ETH_ALEN];
 	__le32 ssid_len;
 	u8 ssid[IEEE80211_MAX_SSID_LEN];
+	u8 pmkid[WLAN_PMKID_LEN];
 };
 
 /**

base-commit: 1cac3bd863bef434d43e6b0554ac5d7f7f6350fe
prerequisite-patch-id: d5b3eb93d54bd6a0508a91f4627ec3e59a810928
prerequisite-patch-id: 653281e1349a038c7f48b3513243f3211fffab9e
prerequisite-patch-id: 0e47ab711ef159237e20c860834d3ac269b05eb2
-- 
2.32.0

