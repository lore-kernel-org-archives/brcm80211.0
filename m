Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A141F3624D4
	for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576947; cv=none; b=XdG+Q+2FtyLSwaJa7fiTthar5iMvhP5ZcdYHF/Tn0fVl6GkoFz93IznNOfuxzESrpTZhEW9WnPJ0HwfLh2rljZcgEvY6ipB+S4VlEDM6JnqScTeQv8PEXaGrQl5D6dzNSI5oAt0NYFa/rZ8TwDGJtVFxeHrdagv+OW1qWLhO5Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576947; c=relaxed/simple;
	bh=ILZ1OXSqpg0YJAMnH1L7KR62EaBTj6ncEaDP3DDL3YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S/GBWxLuOrBaCGA3tCGJfxgUHN51IEeQzai/ujkDMrEX6h1OKbfYvq6BaYb2zoKAdi2a714zicO4H+ZmmoG3zvCGPl+uiO1sloZCYM6SGGxQuZfvmmY3e5oLlwgQMBOOr7hbadTJQUK7sUYiO7BRDY+/ntlAAz4cjKIQ5lZtuMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=a8pw8yUQ; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="a8pw8yUQ"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2cae1a3a744so79721085ad.3
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 12:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576946; x=1785181746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRt6BPmnSIJVDlX+Tp6C58k9HWDHbAncJG4jnoURZe8=;
        b=ijvprCCZpRpu/Gug8DNhqKNnQEkdQ2QTHHrO2875NQgH+ysgXVfdxcbuSrXUO1EkjJ
         qDGcJnKWzUQ6l+TqMzcaY+dQxu76jiHF8TIMJShMN+T0pn7zuMJLNeXU/Qhq8lER2uEg
         YsovJWiKsytML1RXwA44bHOZwEKylZM0YtTaJk9HJ7uO6zUesxa9qQAIPLq5UGzJenBq
         yQ7p6PlLfUcGo/osys0YpSfZDZNAEhkcEc4mrKiKyH+DHwdNa+ZFhdGDa7qcb7ttZSjc
         HGutoVdM3q0cB9+0HZCunea2wMXFiNBVJLwvn2xTxbHwZdq+9VVRG3eHLXqWPRyTcGjR
         MeIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8uBCL49cwddacCf0iaIafP7KM/VT/qgVlLqIhmrXQvoT2p3cxMAMfsUSBvsM3y23hH9BmO2ya7DA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwND0ke9EuUc6+ekNa5DqdkWqWLVPGAx1d1BR49j2Ql2WEY+XH
	vmtJsIG4U+7CpcBG+8rBK94uiCHtWofvXqxBzl8uvZBhC9B6r0SVIlVB5gin9a0qAMS7lcTXimk
	i2bQ7btp31xSt7mC4W7EG30n+l+U1ya/Y7st1+aVOLqX7vx2TjZk4EVA2ImzZWjs25FlaNNSv4j
	s5v1atZ5lq0Kx5jFC5ozeqFeJqlQ4VLp2h0v7MgFzsAv+4Ue/cSFjM0cIENKw9hxupoXLfRfOt2
	zRqrkvjPlHz5M70bX1VWQ==
X-Gm-Gg: AR+sD10gCY0FkxLIOrgNQfG22a0Yjy1K+12IYXRN/vvm8N0Hrw6Hm/VdySrZ8nI36fn
	VZXrbuIzG4PL0coA0yVIG64NUQTMcf7wdFTqe7XiNDF/tZI9sK5PDaXWz/yypjv2oRn8uytMXyX
	FxyLkDbaHQK7rvmOkUoaAIEiai1vTCfUC6IZx/j582Emp2XQI2WJNz7k+E4UK8ACDuewC277pKh
	6G+1iYEsEPcvi5C6FYWsTkPENEU5JzPCYKKq9Xb5A6aW2gbwK1qtwRcu6A+DeAvHcTt9Gwgoek+
	hlrHitti0gxVtddWY7Dq1zhp6GXwjPpxdNKcwwtzBXZiIz7gusODrtVzvk/gz2aOnTpia+IIdQ/
	4BW3e4pTG1zy9doRMs9OwW0I0m1OSP2RHA+Sv3SdHWAjW2Ktoj3iHY8rBUY4vCSt9lewZZvng0B
	9L/hUB5vgHbLM1Yx3wps5U6BJKLPSIQrfqTHYCqYM=
X-Received: by 2002:a17:903:8c8:b0:2cc:5f48:5764 with SMTP id d9443c01a7336-2cf349ebc1dmr152260535ad.44.1784576945676;
        Mon, 20 Jul 2026 12:49:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cf34468214sm10240425ad.9.2026.07.20.12.49.05
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2026 12:49:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15d113dd65so506640066b.0
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 12:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784576944; x=1785181744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRt6BPmnSIJVDlX+Tp6C58k9HWDHbAncJG4jnoURZe8=;
        b=a8pw8yUQcBbGTZW4AfkCZuMPqSPG5x4nxS+jB8RDzj/IHIABkXkLQ9x6EeBHfycR3I
         /M8k1gH5NGQecnIq7uBhIX0gSUNc1gleg4uDnSDFHez0MdbBv4E0sQ0/9lEjp/kbau8j
         jm5p9XNpvsgL7Q1LE9m2n1UOXTy8ExVwB9nG4=
X-Forwarded-Encrypted: i=1; AHgh+Rpzeoh1lYoDW3Y5PvtwkmsG2irIOHZLKBFtXxdT/QFnu0vo0oGJh9SyPmKb9iOhj2nFfPrSUu276iY=@lists.linux.dev
X-Received: by 2002:a17:907:9816:b0:c12:58c0:db2 with SMTP id a640c23a62f3a-c16922d74c7mr845559066b.18.1784576943717;
        Mon, 20 Jul 2026 12:49:03 -0700 (PDT)
X-Received: by 2002:a17:907:9816:b0:c12:58c0:db2 with SMTP id a640c23a62f3a-c16922d74c7mr845558666b.18.1784576943308;
        Mon, 20 Jul 2026 12:49:03 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm506543066b.14.2026.07.20.12.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:49:02 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: bogdan.nicolae@gmail.com
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Bogdan Nicolae <bogdan.nicolae@acm.org>
Subject: Re: [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code
Date: Mon, 20 Jul 2026 21:48:57 +0200
Message-ID: <20260720194900.2356442-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714150423.53960-1-bogdan.nicolae@gmail.com>
References: <20260714150423.53960-1-bogdan.nicolae@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 14 Jul 2026, bogdan.nicolae@gmail.com wrote:

> [PATCH] wifi: brcmfmac: cyw: clean up PMKID and cookie code

The code itself is correct, but there are process issues that need to be
fixed before I can accept this:

1. This is a resubmission of the patch sent on 2026-07-09 [1]. A
   resubmission must carry a version tag: the subject line should read
   "[PATCH v2] wifi: brcmfmac: ..." not "[PATCH] wifi: brcmfmac: ...".

2. A v2 submission must include a "Changes in v2:" section below the ---
   line documenting what changed from v1.

3. The From: address (bogdan.nicolae@gmail.com) does not match the
   Signed-off-by address (bogdan.nicolae@acm.org). Please use a
   consistent address or add a second Signed-off-by for the sending
   address.

4. The patch addresses two independent issues: fixing the packet_id in
   brcmf_cyw_mgmt_tx() (SAE auth frame TX) and fixing the zero-init and
   PMKID copy in brcmf_cyw_external_auth() (auth completion). Please
   split these into two separate patches.

Please send a v2 addressing these points.

[1] https://lore.kernel.org/linux-wireless/20260709122315.11400-1-bogdan.nicolae@gmail.com/

Regards,
Arend
