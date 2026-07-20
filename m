Received: from mail-qv1-f98.google.com (mail-qv1-f98.google.com [209.85.219.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69A3383C66
	for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 19:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576948; cv=none; b=HNvFOSKUKTpC6hA/yvt4/awCQDvR09kZtEHKUmEeC2Qs4iaaM6mhJ95DhXk92+xQSgIsghIlbtrB2yxfFwQyGXNUx9zqB55nsSxqQYzxjhG+wYla+DMxSo9wz2u1JPcI1JmQo7GvWrkmLKMEEMOsUnXooHi+YIKg5nn+a/hq2b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576948; c=relaxed/simple;
	bh=GpwzMcCRlrGCMNpB+RWtFToyJqACpU98Z/yPN70gqNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0HUGv7dPLdvJM4wj/tHFGSfxzgOE+++dAyL+l0mk/zoNbz2j++cLlv8VPKKHBWfjm+ejWiWSGDy9kqA8Wrl3jjsqJPjpKm+ISyHrYqpVQSH4+TDHToK/0gytgkFMd760RaOaCgaCOXmMxNWbLFJt/lI7OBN7lZJXkJarbTwwn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fX/pLuLy; arc=none smtp.client-ip=209.85.219.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fX/pLuLy"
Received: by mail-qv1-f98.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so46561476d6.3
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 12:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576945; x=1785181745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iU1p0NoD+yje6AFqPCJghg44m+FupeiwPUYO76Klhto=;
        b=Ug/i2yIy8ARkyp8tjU7tm9RdrQq4yXxmpYnq7iGNlpGT4O+sSUYH86qHpBSzbsozDD
         DC8ZvPiOKR/R2xKUSxjtRKdwldglitmuuayaCLvhxgMSqiLflBVaEPoqhuGWTjOZ0kRf
         SrVl9+iAS1nYi3xSnum9ld77dHlg9YZCu/esN6RXXv3gI/7szCcWwc1vuQ/Uem/39Ovn
         8ozhfYAfnsD80AcJNjkf6nQLIERvFl1XcrV5o8m2NAGhEMlQwB8PIZB9LefWwA3C+nW5
         JhVKZFkG5hn2Q6inj/tInwCslNqTux0scVxclOCenGdB8HFgGaGitHlh5Ab+GjLCaaEj
         Ijpw==
X-Forwarded-Encrypted: i=1; AHgh+RrYquhHyjpEWMnvuzkG2gYm/r1fIYrmt1aClDCouHFXCYP+Vp97Dq5MYEIJnDwhgPZMJZxs3NrgpBE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGHp8qyinouopdVaupcCOQuACYAI78VBhDTK/iJRa5LjEgNluC
	0KZxDrWfWDtAOU6zd8NtDKG71rIgybedaHmJ8+g2YbZNt7PPHI1oX37zoWm4vIajnJ912Jq9CX2
	fYkjFaiV5L+E+obIyjrGXLVMSp8xP5JBBXOvkJeKjnRvGDWWY0fZ0xGAx6EBDhRxJj8wrWONKF/
	4cmaWJpLZDeyyitLBeg7doUgWUE48ol18nP8rfLvpHGjhAwzKKOzt4isvopr4/6NQ9hr4o9iaHr
	qS4eIwo9YezFpXa/78X7Q==
X-Gm-Gg: AR+sD13Rp5Wpv94IspTQOx9WIa9EHRUXOynhZ0Z8rz1bwJ6XL1VAVXVrK1ENT1p/UDB
	KkRxcQybN3/zBu4ckbLRon1FmGDrFlYyC7KYd1AUzdeA2cYj7VeLehspSjH3v9gi1HV18RVWrCg
	Uqp5PYrcJNMMq6au1a931oIsiNu3iIrPqqHB2MvRhVHpysFf3eXvnHrkyana0213aF9RiywcZUX
	N4RZxTkDj2uQCcRzbhXILeMQPDHykbVEp5QFgM3oH8x5SsKIgkgqsNYiVBd4wM/2BvTjAK2Vs6m
	qkGAjmLL2/tXP1lh7ZWGrZbXVb16s3a/MJ/VVSS0oTsxE89sItWxtlRZ2YaUOAKR8AFHMyqFMuc
	/lwuNsDQIgop+A5uf/2FmgTsRkZBdAE6rZRdCiN8fB6xt7CwmMhCeSk4z0c/Zh9crrqWi43LEy5
	EhdgyWe/R9IB4SlnDu7nh8tRvc4euiIfqZ/2FKL8Y=
X-Received: by 2002:a05:6214:55c8:b0:907:af42:ac86 with SMTP id 6a1803df08f44-907af42af49mr6994216d6.43.1784576945330;
        Mon, 20 Jul 2026 12:49:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-90778342948sm6099256d6.0.2026.07.20.12.49.03
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2026 12:49:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c1662ffbf57so767747066b.2
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 12:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784576942; x=1785181742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iU1p0NoD+yje6AFqPCJghg44m+FupeiwPUYO76Klhto=;
        b=fX/pLuLyXaEpWWtbiuc02HtZI2/Lw5JeZZTlUFwKgJESoMbUYfDPa1YM+xmirzgQw6
         Ut83l6s7olSoA8mBCdOxnK/miKwhtlxWmteYf1YAd8GqhwqmJtcD+1gNhZsaOo4MMsoh
         x//Se9XMzceNqrnkMkHHHp22sGGq9ooDxDJR8=
X-Forwarded-Encrypted: i=1; AHgh+Rr9E2Bqsob8upGvfd0BSHY9pH3UwJqWc3aflGi97AulVE7chqYMq6PEBxeEhWb3Ro7L71qwL/gpIPI=@lists.linux.dev
X-Received: by 2002:a17:907:c70c:b0:c12:894e:501a with SMTP id a640c23a62f3a-c16b4572167mr651063266b.2.1784576942609;
        Mon, 20 Jul 2026 12:49:02 -0700 (PDT)
X-Received: by 2002:a17:907:c70c:b0:c12:894e:501a with SMTP id a640c23a62f3a-c16b4572167mr651061566b.2.1784576942178;
        Mon, 20 Jul 2026 12:49:02 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm506543066b.14.2026.07.20.12.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:49:01 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Jason Huang <jason.huang2@infineon.com>,
	Kurt Lee <kurt.lee@cypress.com>
Subject: Re: [PATCH v5] wifi: brcmfmac: add DPP support
Date: Mon, 20 Jul 2026 21:48:56 +0200
Message-ID: <20260720194900.2356442-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715084718.667522-1-Jason.Huang2@infineon.com>
References: <20260715084718.667522-1-Jason.Huang2@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 15 Jul 2026, Jason Huang wrote:

> [PATCH v5] wifi: brcmfmac: add DPP support
>
> Add DPP AKM handling and RSN parsing support ...
>
> Changes since v4:
> - Drop the pre-existing P2P device vif fixes; they are now a standalone
>   wireless patch.

The DPP code looks good. The P2P fixes have been removed as requested and
the changelog is present.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

This ack is conditional on the standalone P2P device vif guard patch being
submitted. When you post it, please reply here with the lore.kernel.org
link so I can track it.

Regards,
Arend
