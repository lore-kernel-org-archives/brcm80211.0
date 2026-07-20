Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99895388868
	for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576950; cv=none; b=O5b/J4sYdazf1vdGA0fqwkWZ9aIF8EMhpvm7a5ECkSCwJrsMUT6gaM4YRvLoaTmAb3SKs5yRe4mekh72rgDlVa3JK/5OqvekqUPkfyZwvTVzA9q5gKDcpTcy4sqNWOzAwseJY9ic98UrDpJAoIQRvhX0t9wd4AUjS9ASVHIKAp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576950; c=relaxed/simple;
	bh=ztxmNjXfgKgZkt7b+JrhvxBJmCCQaF0BuoffXtWBugA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V97jkVE6zSO+JXliPnw68xwXlfRdVHMKxOGTnZeCNBY90j1x3yYwgMsfhNdkX9N3Sx8mBTyV6sTjmEM+eyi8LKYrShKLGDaaMhxUK6v3ekLS2UpRt5K+F0iqHMI6GU/kioisEhD33nWocPxGhTFGeiapQEHlXNTkvOhdTSA/AmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MnNW5wvi; arc=none smtp.client-ip=209.85.217.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MnNW5wvi"
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-7348dc69800so3632812137.0
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 12:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576947; x=1785181747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoyrZqE1Bvx1hfQa+4u0/DLW7aA7wFVgfenpGZVSMXQ=;
        b=TwwKhWXCKiGUYJp++BSs5WyqtjvDANAfFgmrjek12ogouW3CR1kJHQmt/W2kTT6iDU
         hxXP32wCkGkmvP/fEQB753qiiTwsNr2pKR8DsN10zoeBvrn9mzAubidG+CM6HMOl0fL4
         9Ii2J2rzOWFRHbU7mljxTdmKmaxyOSpdBs4pgv8JsL3Pjx7HCpWQ0KAO/aBIK7nWMrkP
         4LoKmuhVpP/L5GgrYmXgi0/tGcpdgHLMn1ngjoQUeXYmYrOrVe7HxbacMHvaofzUqDQ7
         n3x/1tcvSVNi1GdWkRfZ5MiNqxCaUnaEsXRrzf/GF0Gh/6wOUDmgCQJKv5FcBH1A23ZE
         CTaw==
X-Forwarded-Encrypted: i=1; AHgh+RoaCmiFNbdxbYzVTbrkZUsxMCb7X85ftmsSpt2/ZviY6w5LD2M+KiRYmmCHCNTRXeD0A+tPYCnwxxY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk7+ICDMrsKPVMyrL8xShdcSiSjgb3Zz+zkcIKtEYX3ToNyoZq
	5EVXpLi6td14AjAtv/8u9q+FxDnfddF/WYmxrlq7tPW6+vIiKU0v+pKamm3fqzJvXezvLJo+rwp
	21qPOC6pQybgYDU9zsm1iTM0JytVVI8WyNMKhmZdFmQP+7HxqWjaovYE7iet6gyn4oFBcchqEIr
	RffT9+zugZokG9aQp9AkHXh4mOCzFVMc5hew2qS6kuro7BACReklB/b+md5Baq8KrakRS+/RFLT
	vXfm0cIn1rc6hSU0JjD7w==
X-Gm-Gg: AfdE7cksULbFe0u8iTWBNjI0vcHRwznnFVU2R+41PPW7G8UrMpVzIFAexqfECET8c5w
	Pw7gnpn9Wd3hEi7zgd6u+J5uloyYmN2ilOGtK1MNnKRwinCfS5mY0UDa8FrPycZxlbMVXMx3p/S
	TQHe+iDKIoC1VkRX7WgSWbwwgqbfkdXDU8dy54VCVARqk8gjfQWUIa0+jaGNDuBYrxR3CZ4YdE7
	SoUstA85I/04+AX4hvEekbhJFAXGDwaa1yd4xRh0eYmMmCxOjsoTGM9BiV6UXK98d2qJy1hUB5n
	N9YY3JrO6Q8O9LF/uJIQ+YtojFllN3Wye7fuom9WeaeG/3jPaoHzjxKtLwWc4u9U97DFbzVhV/h
	BCHZoWzJJA/gAYA1UgayWOYS6HMaAI83jX/P/oKzHfhRYBxghsfp8cL66btIvUpW4BOm4jTvvj3
	l40RY2U6Ik5632VPm9X0gsYFdUf9tuj+o4c9nc5wg=
X-Received: by 2002:a05:6102:f82:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-747537737d6mr3751395137.29.1784576947372;
        Mon, 20 Jul 2026 12:49:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-74757ee203csm857743137.6.2026.07.20.12.49.06
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2026 12:49:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c15fff01a30so9032066b.1
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 12:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784576946; x=1785181746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hoyrZqE1Bvx1hfQa+4u0/DLW7aA7wFVgfenpGZVSMXQ=;
        b=MnNW5wviGb5tHLUZap7u5gSG7aiUqKufhfXUTbNiYgYZJmJYYx3k8S9I9RUtLiEKxe
         CHYGylV36dPqdepz97DR2jRPcZqEBue7gjafbkw2UJ5F7jbhD7LIgZcndQsHjsWDgDGZ
         KHwPQWkImyCuWPeZkmWhGRY7lcIEf9WDospy4=
X-Forwarded-Encrypted: i=1; AHgh+RptwMMF3FRcqS4Vw4671h1lBbOPRTDlrRsCSkzidDyhor6awLi0WKYgyKvniTcIPV68C7FjOIyzl/o=@lists.linux.dev
X-Received: by 2002:a17:907:3d45:b0:c16:5fc9:e832 with SMTP id a640c23a62f3a-c16b48807c8mr666147266b.50.1784576945877;
        Mon, 20 Jul 2026 12:49:05 -0700 (PDT)
X-Received: by 2002:a17:907:3d45:b0:c16:5fc9:e832 with SMTP id a640c23a62f3a-c16b48807c8mr666144866b.50.1784576945111;
        Mon, 20 Jul 2026 12:49:05 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm506543066b.14.2026.07.20.12.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:49:03 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kvalo@kernel.org,
	eddiephillips@google.com,
	franky.lin@broadcom.com,
	hante.meuleman@broadcom.com,
	wright.feng@infineon.com,
	SHA-cyfmac-dev-list@infineon.com
Subject: Re: [PATCH v2 1/2] wifi: brcmfmac: make release_scratchbuffers idempotent
Date: Mon, 20 Jul 2026 21:48:58 +0200
Message-ID: <20260720194900.2356442-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260718024353.3147201-2-fanwu01@zju.edu.cn>
References: <20260718024353.3147201-1-fanwu01@zju.edu.cn> <20260718024353.3147201-2-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sat, 18 Jul 2026, Fan Wu wrote:

> [PATCH v2 1/2] wifi: brcmfmac: make release_scratchbuffers idempotent
>
> brcmf_pcie_release_scratchbuffers() frees the shared.scratch and
> shared.ringupd DMA buffers with dma_free_coherent() but does not clear
> the pointers afterwards ...
>
>  1 file changed, 6 insertions(+), 2 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
