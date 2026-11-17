Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937776;
	b=u4RQp+XzQ5HTCehgTxy+JM8m3LaoDkO2IK12wMsBEXF9vZ1KDPtfZ0KKCLUX68vEAvN9
	 D5RBvksoEXKl9yZqA6JItTBYroy5B11Es/5e6Y4cx7mhbh8CF0QdepRtTzQeWppP5NWPR
	 XgnXklitIDEwh8nXkWQB7AHx9YshKYmJmrU8VIoyCfQtltJRWLfXZfnciQ5SHm6eZoG+I
	 7lXzfgrteqPZ2aEkv8wuBAzAtunJvs1XTOEt74tcYmtXbn1RGCkoUuTFyUvRX/wWcf2XY
	 HHjTaJAo0h/KvxTqZ87fbq9Ax4G2LmeYSHXNhV/YmU7ZiouzYUdKHsnr1vhMmw1GQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937776;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Content-Transfer-Encoding:
	 From:Mime-Version:Subject:Date:Message-Id:References:Cc:In-Reply-To:
	 To:X-Mailer;
	bh=USqC8s22nHYoDzDQF9uFHHFGZ31h3DAy1gNTvMcr9dU=;
	b=qBMcl6H2UvzfkYtCTyXe1Tvj/1vVPAAaswDPU61VgQ8pWGe5Ep7eGhxSoAvAk05CEy8J
	 CzkdjcJlaoNGmqpTpJA60c0lVsNbrVQlbjxO5o2whmGsT3FIYwnuZ+6fn9poOH6AbAAtB
	 s1TJjk4eyT9N/Fsi82hoe+Jqm5tl1XIosg85umR+p+ax88kHwS+vwq8t9RMicsPu2pFwL
	 PN+Usr9rMQZpwdVi7wTq2dv1HSsM0UdTfL8A/AlBt7CZDCb9ADQ/5IeRpAq9qp4xO5qPj
	 PtDlhTIKxzfIK3vQCtia2/KiARpprm4cuZ3O9HrMOiWVKwMVk+I/1U4jqeHrHMspp7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YfIRHYZI;
	arc=none smtp.remote-ip=91.218.175.101
Received: from mta0.migadu.com (out-101.mta0.migadu.com [91.218.175.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8273B606A334
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 17:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8273B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YfIRHYZI
X-Envelope-To: brcm80211@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=4nUZbHSGDeC5EzVQv/op9L9Mno790WzQ1pC5Hx0vt5Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794937773; v=1; x=1795542573;
 b=YfIRHYZI1UkGKEdWhq1EsKsV9sJ5TYB/Zor6pnppHWXMR+Tfw/P0oJtiSJ90IDue4AnhNKo3
 PTSTnowS2ll+bQhIUgVIX0Z0CEMV8bc+3svVjImk9HUApeCyBM10uA5XI/AVJ3L2ZgtHwzuMnPV
 uukKNDjFQs7JjM74a0TimTCc=
X-Envelope-To: brcm80211@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 4b46ce5bd6d34d3e;
	Tue, 17 Nov 2026 17:49:33 +0000
X-Mizu-Trace-ID: 4b46ce5bd6d34d3e
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <aditya.garg@linux.dev>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] wifi: brcmfmac: leave the AP 4-way handshake to the host on Apple chips
Date: Tue, 17 Nov 2026 23:19:18 +0530
Message-Id: <BF5FB50E-063E-4EAA-A06D-ADC3670DEAE9@linux.dev>
References: <20261116203719.281605-3-arend.vanspriel@broadcom.com>
Cc: Andre Eikmeyer <dev@deq.rocks>, arend.vanspriel@broadcom.com,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Yossef Osman <Yossef.Osman@proton.me>
In-Reply-To: <20261116203719.281605-3-arend.vanspriel@broadcom.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
X-Mailer: iPad Mail (24B119)



> On 17 Nov 2026, at 2:07=E2=80=AFAM, Arend van Spriel <arend.vanspriel@broa=
dcom.com> wrote:
>=20
> =EF=BB=BFOn Wed, 4 Nov 2026 16:16:29 +0100, Andre Eikmeyer <dev@deq.rocks>=
 wrote:
>> The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
>> capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
>> NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK. hostapd and wpa_supplicant
>> then pass the PSK to the driver and leave the AP side of the 4-way
>> handshake to the firmware. On the BCM4364 that handshake never
>> completes.
>>=20
>> [...]
>>=20
>> Clear BRCMF_FEAT_FWAUTH on the chips in Apple's T2 Macs, so the host
>> runs the handshake.
>=20
> [...]
>=20
>> ---
>> .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++++++
>> 1 file changed, 14 insertions(+)
>=20
>> @@ -318,6 +318,20 @@ void brcmf_feat_attach(struct brcmf_pub *drvr)
>>                    BIT(BRCMF_FEAT_WOWL_GTK);
>>        }
>>    }
>> +    /* The Apple firmware for these chips lists "idauth", but in AP mode=

>> +     * its authenticator never completes the 4-way handshake and the
>> +     * station is dropped after about 8 s. Leave the handshake to the ho=
st.
>> +     */
>> +    switch (drvr->bus_if->chip) {
>> +    case BRCM_CC_4355_CHIP_ID:
>> +    case BRCM_CC_4364_CHIP_ID:
>> +    case BRCM_CC_4377_CHIP_ID:
>> +        ifp->drvr->feat_flags &=3D ~BIT(BRCMF_FEAT_FWAUTH);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>>    /* MBSS does not work for all chips */
>>    switch (drvr->bus_if->chip) {
>=20
> The commit message and the test report only cover BCM4364 and BCM4377,
> but the code also clears FWAUTH for BCM4355. Where does that come from?
> Was it tested, and is BCM4355 found in T2 Macs? If not, please drop it
> or justify it.

4355 is also a Mac specific chip found in MacBookAir8,1 and 8,2. I'm actuall=
y surprised you forgot about that especially when there was a whole issue wh=
en Cypress named their chip firmware wrongly as 4355.

>=20
> The chip ID check has the same problem as in the ARP/ND offload patch [1]:=

> the issue is described as specific to the Apple firmware, but the quirk
> applies to every BCM4355, BCM4364 and BCM4377, and those users would lose
> offloaded AP PSK. Please restrict it as suggested there.
>=20
> Note that BRCMF_FEAT_FWAUTH is required for NL80211_EXT_FEATURE_SAE_OFFLOA=
D_AP
> in brcmf_setup_wiphy(). Please mention in the commit message whether
> that is affected on these chips (i.e. whether the firmware offers "sae"
> at all) or confirm it is intentionally dropped too.
>=20
> Have you looked at the actual root cause (e.g. missing/incorrect
> "idauth" related iovars such as setting the PMK or wsec_info for AP on
> this firmware)? If the offload is never usable on these firmwares, say
> so in the commit message with reference to the firmware version(s)
> checked.
>=20
> [...]
>=20
> Minor: please add the target tree to the subject (wifibot series_format
> warning).
>=20
> [1] https://lore.kernel.org/all/20261104151620.70671-1-dev@deq.rocks/
>=20
> Regards,
> Arend
