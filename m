Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F90F9E8
	for <brcm80211@lists.linux.dev>; Sun, 20 Jul 2025 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753022458; cv=none; b=bNTWbLtmnf8Rf3Spsckq4YxzQhOMKmcEL8XwE7FJ0U8aPBC3zZdoqJFx4nqX8h2e+K3yp+ZTWCnrEtPsVxl+rWFPdp9BB0qUYfM2pqCqPosKen/CvneqQLBHqXKx1l+RbQIGahPRiCN+CwgVG7IqLFz+ZvSptebZuogX+s70PTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753022458; c=relaxed/simple;
	bh=PNyrUBTh3IeoDHLkWclKIc7/yRnlXsHrRLGJ0vynsBY=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Dl3I2AtA5t0Iox+18EoIXE/cVJIpJqhbHq9kl+7p0g5Dy+P+l7xep37ISpAgOirfRpUCNgCjuCY+2ftu1O9XY4opBtWgE7RDsYTVP++sLi2AMPK6rRq5Vg65GEAjTOYt7A8ek3Ml3ez0CHtXiOxAJRm0FwhGt3/FJGBHW3QN7Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=F2qJ3ZUM; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="F2qJ3ZUM"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so636432666b.2
        for <brcm80211@lists.linux.dev>; Sun, 20 Jul 2025 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753022454; x=1753627254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBMzMOSZ7lo/+P2xe4rb3wvuseKwsx8Sup3mujmz6Pk=;
        b=F2qJ3ZUMMowG77/MS/W15qXz2lCUHOYBkkUVovWo80J5c4p5B5K0/KferXq5UkrD/v
         S9s4NKj7zuqy6/a62cKA8Go6gxcmHoF/1zsISvi3qwMaAS5KxGJNinQGc09cwJXpvbwO
         DEzwIg+GIAg1IQfOk7T6unlxOhuxvKWXum7eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753022454; x=1753627254;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBMzMOSZ7lo/+P2xe4rb3wvuseKwsx8Sup3mujmz6Pk=;
        b=dzJvpBrFWdaLbOZyAcUw/ntVQ02xCluzsf7Sn8WQrEWfrfyVIxIY84zAd3qM2S4sTB
         swFhy8Jch/8+obVW9rnsL9QYPGApchBAl4IyME0k7aOQ40jCEeQjJqTNGJZRzcFEGY0a
         QTBGGZXwSpyAGpDTozEJks+7jSkoPhY+2NiwjLLNXBDoJ4PS5uX9Jl0+BEcdBGOVbFtS
         N/1jjjScUHi+aOAwxCm+P+6jJSkqX+2sGYlSrgSoJGiZa/N8+8MbbpYFJj2e5onrdRnp
         g2EfDoBhZgb3nBj5ixliVi4GaqNbTquU4lodMwfAogd2E3o8PTYFcmrb5yUmxCYtM8rF
         1hxA==
X-Forwarded-Encrypted: i=1; AJvYcCUW2JPzvyUb9+SJLSpXSEKX6tPeIRyrMZ9JQpEAHxeMZ8UXhUjAUHBUvacFCYL8mX/he2FaDgvSdZA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6tK7Ig+L4V48KBN/meLMqGpv5dOzk3dgrJqT1fWkfNgT++Kdn
	bopXMFj/hJsgkjk14/g7Os1sXc6JmfLSUTIpDpd27S1tV/fcwufaj7YiBmQusgmeDw==
X-Gm-Gg: ASbGnctBPbVh49O5/DMTCiKjFbXBnY32ZLzH3ZTxh6mdlqr1aLyXNVd69YylPhllZ98
	bZYIXf9K8BqnbrTa51Hw7XSt1tWwSiqyTD/YNmLytcZZbSFOwVDqB2vDSkp43MQKcCGxpR+FQyQ
	gmjQ9O2AGW0aE19loDsW4SSWD8hvrkdZ5AesQzjkN4xBz7b8pS0bOMgkXdenX663OCgiDsUkLey
	3Wowk62yB7WRHtRGL75DDmXfFh3qPMn7zA2yjfSvMhKzBnIA+QmykmqRUmdX+TbGSJ0bLits8uo
	J42XhREwLPzLFm6suIO1eRSY+5mDq2D6iBaZRve2KwJhfMkA1MHnoUm/Um6XMFl6YvnrA+WRSQ2
	/BpQFvu2v8nusRIY+yMENK0VRCMKkwoZY+52ZPZn1peitU5vHsdsf5WBx1bRm
X-Google-Smtp-Source: AGHT+IHXLSbeFQd9moOjeqXx6dt4OA+hOWV2frgiDQ0KIJ0dndnzZzbLEWC0BTdJGjy2EYutG8pWbA==
X-Received: by 2002:a17:906:c10d:b0:ae0:68a8:bd6a with SMTP id a640c23a62f3a-aec6a4e282emr954066266b.15.1753022453836;
        Sun, 20 Jul 2025 07:40:53 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a0basm499204966b.19.2025.07.20.07.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 07:40:53 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Ian Lin <ian.lin@infineon.com>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <carter.chen@infineon.com>, <double.lo@infineon.com>, <vinoth.sampath@infineon.com>, <gokulkumar.sivakumar@infineon.com>
Date: Sun, 20 Jul 2025 16:40:51 +0200
Message-ID: <1982847cd38.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250624093453.7264-1-ian.lin@infineon.com>
References: <20250624093453.7264-1-ian.lin@infineon.com>
User-Agent: AquaMail/1.55.2 (build: 105502562)
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: support CYW54591 PCIE device
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On June 24, 2025 11:36:19 AM Ian Lin <ian.lin@infineon.com> wrote:

> From: Double Lo <double.lo@cypress.com>
>
> CYW54591 is a variant of BCM4355 silicon with the same chipid. In the
> chipid-fwname mapping table, apply chiprev 13 to identify CYW54591.
> Skip reading OTP process for CYW chip since it contains vendor specific
> information which is not common for cypress.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Double Lo <double.lo@cypress.com>
> Signed-off-by: Chi-hsien Lin <chi-hsien.lin@cypress.com>
> Signed-off-by: Ian Lin <ian.lin@infineon.com>
> ---
> .../broadcom/brcm80211/brcmfmac/pcie.c        | 21 ++++++++++++++-----
> .../broadcom/brcm80211/include/brcm_hw_ids.h  |  1 +
> 2 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> index 9747928a3650..6327f4eca500 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -71,6 +71,7 @@ BRCMF_FW_CLM_DEF(4377B3, "brcmfmac4377b3-pcie");
> BRCMF_FW_CLM_DEF(4378B1, "brcmfmac4378b1-pcie");
> BRCMF_FW_CLM_DEF(4378B3, "brcmfmac4378b3-pcie");
> BRCMF_FW_CLM_DEF(4387C2, "brcmfmac4387c2-pcie");
> +BRCMF_FW_CLM_DEF(54591, "brcmfmac54591-pcie");
>
> /* firmware config files */
> MODULE_FIRMWARE(BRCMF_FW_DEFAULT_PATH "brcmfmac*-pcie.txt");
> @@ -88,6 +89,7 @@ static const struct brcmf_firmware_mapping 
> brcmf_pcie_fwnames[] = {
>  BRCMF_FW_ENTRY(BRCM_CC_4350_CHIP_ID, 0xFFFFFF00, 4350),
>  BRCMF_FW_ENTRY(BRCM_CC_43525_CHIP_ID, 0xFFFFFFF0, 4365C),
>  BRCMF_FW_ENTRY(BRCM_CC_4355_CHIP_ID, 0x000007FF, 4355),
> + BRCMF_FW_ENTRY(BRCM_CC_4355_CHIP_ID, 0x00002000, 54591),
>  BRCMF_FW_ENTRY(BRCM_CC_4355_CHIP_ID, 0xFFFFF800, 4355C1), /* rev ID 12/C2 
>  seen */
>  BRCMF_FW_ENTRY(BRCM_CC_4356_CHIP_ID, 0xFFFFFFFF, 4356),
>  BRCMF_FW_ENTRY(BRCM_CC_43567_CHIP_ID, 0xFFFFFFFF, 43570),
> @@ -2522,10 +2524,19 @@ brcmf_pcie_probe(struct pci_dev *pdev, const struct 
> pci_device_id *id)
>  if (ret)
>  goto fail_bus;
>
> - ret = brcmf_pcie_read_otp(devinfo);
> - if (ret) {
> - brcmf_err(bus, "failed to parse OTP\n");
> - goto fail_brcmf;
> + /* otp read operation */
> + switch (bus->fwvid) {
> + case BRCMF_FWVENDOR_WCC:
> + case BRCMF_FWVENDOR_BCA:
> + ret = brcmf_pcie_read_otp(devinfo);
> + if (ret) {
> + brcmf_err(bus, "failed to parse OTP\n");
> + goto fail_brcmf;
> + }
> + break;
> + case BRCMF_FWVENDOR_CYW:
> + default:
> + break;
>  }
>
> #ifdef DEBUG
> @@ -2740,7 +2751,7 @@ static const struct pci_device_id 
> brcmf_pcie_devid_table[] = {
>  BRCMF_PCIE_DEVICE(BRCM_PCIE_4378_DEVICE_ID, WCC_SEED),
>  BRCMF_PCIE_DEVICE(BRCM_PCIE_4387_DEVICE_ID, WCC_SEED),
>  BRCMF_PCIE_DEVICE(BRCM_PCIE_43752_DEVICE_ID, WCC_SEED),
> -
> + BRCMF_PCIE_DEVICE(CY_PCIE_54591_DEVICE_ID, CYW),
>  { /* end: all zeroes */ }
> };
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h 
> b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
> index c1e22c589d85..5195c6c1a5b5 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
> @@ -99,6 +99,7 @@
> #define BRCM_PCIE_4377_DEVICE_ID 0x4488
> #define BRCM_PCIE_4378_DEVICE_ID 0x4425
> #define BRCM_PCIE_4387_DEVICE_ID 0x4433
> +#define CY_PCIE_54591_DEVICE_ID 0x4417
>
> /* brcmsmac IDs */
> #define BCM4313_D11N2G_ID 0x4727 /* 4313 802.11n 2.4G device */
> --
> 2.25.0



